import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/state/entity_provider/donationbox_provider.dart';
import 'package:bright_impact/view/custom_widgets/qr_scanner_widget.dart';
import 'package:bright_impact/view/pages/input_pages/login_page.dart';
import 'package:bright_impact/view/pages/input_pages/register_page.dart';
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
    InitPageState.init: "Los geht's.",
    InitPageState.qrScanning: "Scanne den\nQR-Code.",
    InitPageState.boxFound: "Verbinde\ndeinen Account.",
  };

  void _showQRCodeScanner() {
    setState(() {
      _state = InitPageState.qrScanning;
    });
  }

  void _openRegisterPage(BuildContext context, AppState appState) {
    appState.pendingActionRegisterBoxCUID = _state == InitPageState.boxFound ? _donationBoxSN : null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.9, // Sheet only takes 90% of screen height
        child: RegisterPage(),
      ),
    );
  }

  void _openLoginPage(BuildContext context, AppState appState) {
    appState.pendingActionRegisterBoxCUID = _state == InitPageState.boxFound ? _donationBoxSN : null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.9, // Sheet only takes 90% of screen height
        child: LoginPage(),
      ),
    );
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
      if (sn == null || !DonationboxProvider.isValidSN(sn)) {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = Provider.of<AppState>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                      "Donationbox erkannt",
                      style: theme.textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  if (_state == InitPageState.init)
                    GestureDetector(
                      onTap: () {
                        // QR-Code-Scan-Funktionalität
                        _showQRCodeScanner();
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          // QR-Code-Scan-Aktion
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
                        // Calc 1/3 of screen width
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
                      "SerialNo.: ${_donationBoxSN.substring(_donationBoxSN.length - 8)}",
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
                      "Scanne deine\nDonationbox",
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                      ),
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
                              _openLoginPage(context, appState);
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Anmelden",
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
                              _openRegisterPage(context, appState);

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Registrieren',
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
