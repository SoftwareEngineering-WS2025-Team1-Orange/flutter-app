import 'package:bright_impact/State/AppState.dart';
import 'package:bright_impact/View/CustomWidgets/QRScannerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum InitPageState { init, qrScanning, boxFound }

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<StatefulWidget> createState() => _InitPage();
}

class _InitPage extends State<InitPage> {
  InitPageState _state = InitPageState.init;
  String _donationBoxSN = "";

  final Map<InitPageState, String> headlineText = {
    InitPageState.init: "Let's get\nstarted.",
    InitPageState.qrScanning: "Scan the\nQR Code.",
    InitPageState.boxFound: "Connect with\nyour account.",
  };

  void _showQRCodeScanner() {
    setState(() {
      _state = InitPageState.qrScanning;
    });
  }

  bool _qrCodeDetected(String data) {
    try {
      // Check if data is an URI
      final uri = Uri.parse(data);

      // Check that URI is a http(s) URL
      if (uri.scheme != 'http' && uri.scheme != 'https') {
        throw Exception("Not a http/https URL");
      }

      final sn = uri.queryParameters['sn'];
      // Check if parameter exists and is a serial number
      if (sn == null || !_isValidSN(sn)) {
        throw Exception("No valid serial number in parameter sn");
      }

      // SUCCESS:
      setState(() {
        _state = InitPageState.boxFound;
        _donationBoxSN = sn;
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  bool _isValidSN(String uuid) {
    // Regex zum Überprüfen eines UUID-Formats
    final uuidRegex = RegExp(
      r'^[0-9]{8}$',
    );
    return uuidRegex.hasMatch(uuid);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = Provider.of<AppState>(context);

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Row(
                children: [
                  Text(
                    headlineText[_state] ?? "",
                    style: theme.textTheme.headlineLarge,
                    maxLines: 3,
                  ),
                ],
              )),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_state == InitPageState.boxFound)
                Text(
                  'Donationbox found',
                  style: theme.textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
              if (_state == InitPageState.init)
                GestureDetector(
                  onTap: () {
                    // QR-Code-Scan-Funktionalität
                    debugPrint('Scan button pressed');
                    _showQRCodeScanner();
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      // QR-Code-Scan-Aktion
                      debugPrint('Scan your Donationbox');
                      _showQRCodeScanner();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      backgroundColor: theme.primaryColor,
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (_state == InitPageState.qrScanning)
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Berechne 1/3 der Bildschirmbreite
                    double widgetWidth = 250; //constraints.maxWidth / 3;

                    return Center(
                      child: SizedBox(
                        width: widgetWidth,
                        height: widgetWidth,
                        child: QRCodeScannerWidget(
                          onQRCodeDetected: (x) {
                            return _qrCodeDetected(x);
                          },
                        ),
                      ),
                    );
                  },
                ),
              if (_state == InitPageState.boxFound)
                Icon(Icons.archive_rounded,
                    size: 200, color: theme.primaryColor),
              const SizedBox(height: 10),
              if (_state == InitPageState.boxFound)
                Text(
                  "S/N: $_donationBoxSN",
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 20,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              if (_state == InitPageState.init ||
                  _state == InitPageState.qrScanning)
                Text(
                  'Scan your\nDonationbox',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(3),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: OutlinedButton(
                        onPressed: () {
                          appState.testLogIn();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: theme.textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_state == InitPageState.boxFound) {
                            appState.registerDonationbox(_donationBoxSN);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: theme.secondaryHeaderColor),
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
