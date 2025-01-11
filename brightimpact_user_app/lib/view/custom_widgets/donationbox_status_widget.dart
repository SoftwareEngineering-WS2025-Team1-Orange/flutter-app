import 'package:bright_impact/model/donationbox.dart';
import 'package:bright_impact/model/power_supply.dart';
import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/state/entity_provider/donationbox_provider.dart';
import 'package:bright_impact/state/entity_provider/power_supply_provider.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:bright_impact/view/custom_widgets/qr_scanner_widget.dart';
import 'package:bright_impact/view/custom_widgets/rotating_circle_widget.dart';
import 'package:bright_impact/view/pages/input_pages/add_donationbox_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationboxStatusWidget extends StatefulWidget {
  const DonationboxStatusWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DonationBoxStatusWidgetState();
}

class _DonationBoxStatusWidgetState extends State<DonationboxStatusWidget> {
  bool _isScanningForBox = false;

  bool _qrCodeDetected(String data, DonationboxProvider provider) {
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
        _isScanningForBox = false;
      });

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => FractionallySizedBox(
          heightFactor: 0.9,
          child: AddDonationBoxPage(cuid: sn, provider: provider),
        ),
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    // Intialize 2 Providers: DonationboxProvider and PowerSupplyProvider
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DonationboxProvider>(
            create: (_) => DonationboxProvider(
              donatorId: appState.donator?.id ?? 0,
              // entity id is 0 since all Boxes are fetched in a list
            )..setIdAndFetch(0),
          ),
          ChangeNotifierProvider<PowerSupplyProvider>(
            create: (_) => PowerSupplyProvider(
                donatorId: appState.donator?.id ?? 0
                // entity id is 0 since all power supplies are fetched in a list
                )
              ..setIdAndFetch(0),
          ),
        ],
        child: Consumer2<DonationboxProvider, PowerSupplyProvider>(builder:
            (context, donationboxProvider, powerSupplyProvider, child) {
          final box = donationboxProvider.entity?.firstOrNull;
          final supplyList = powerSupplyProvider.entity;

          return SizedBox(
              width: width * 0.95,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                      child: Stack(children: [
                    if (donationboxProvider.isLoading)
                      CircularProgressIndicator(color: theme.primaryColor)
                    else if (donationboxProvider.loadingError != null)
                      Text(donationboxProvider.loadingError!.message)
                    else if (box != null)
                      _buildDonationboxInfo(
                          context,
                          box,
                          supplyList
                              ?.firstWhere((e) => e.id == box.powerSupplyId))
                    else
                      _buildAddDonationBoxWidget(context, donationboxProvider)
                  ]))));
        }));
  }

  Widget _buildDonationboxInfo(
      BuildContext context, Donationbox box, PowerSupply? supply) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Donationbox"),
        Text(
          box.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 8),
        Text(
          box.lastStatus.name.toUpperCase(),
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: _buildStatusItem("27 Watt", null, Icons.bolt, context)),
            SizedBox(width: 10),
            Expanded(
                child: _buildStatusItem("0,05 €", "Ø/Tag", Icons.euro, context,
                    animationReversed: true)),
            SizedBox(width: 10),
            Expanded(
                child: _buildStatusItem(
                    "17%", "Active Time", Icons.timer, context)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusItem(
      String label, String? subtitle, IconData icon, BuildContext context,
      {bool animationReversed = false}) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Container(
              color: theme.secondaryHeaderColor,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                      padding: EdgeInsets.all(constraints.maxHeight * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              label,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: theme.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (subtitle != null)
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                subtitle,
                                style: TextStyle(
                                  color: theme.primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          SizedBox(height: constraints.maxHeight * 0.05),
                          Icon(
                            icon,
                            color: theme.primaryColor,
                            size: constraints.maxHeight * 0.2,
                          ),
                        ],
                      ));
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: RotatingCircle(
            gaps: 3,
            color: theme.primaryColor,
            reversed: animationReversed,
          ),
        ),
      ],
    );
  }

  Widget _buildAddDonationBoxWidget(BuildContext context, DonationboxProvider donationboxProvider) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return AspectRatio(
        aspectRatio: 1,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (!_isScanningForBox)
            ButtonWidget(
              labelText: "Add Donationbox",
              onPressed: () {
                setState(() {
                  _isScanningForBox = true;
                });
                return Future.value(true);
              },
            ),
          if (_isScanningForBox)
            Column(
              children: [
                Text("Scanne den QR-Code deiner Box"),
                SizedBox(
                  height: width * 0.05,
                ),
                SizedBox(
                  width: width * 0.4,
                  height: width * 0.4,
                  child: QRCodeScannerWidget(
                    onQRCodeDetected: (x) {
                      if (_isScanningForBox) {
                        _isScanningForBox = false;
                        return _qrCodeDetected(x, donationboxProvider);
                      }
                      return false;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isScanningForBox = false;
                    });
                  },
                  child: Text("Abbrechen",
                      style: theme.textTheme.labelSmall!
                          .copyWith(color: theme.primaryColor)),
                ),
              ],
            )
        ]));
  }
}
