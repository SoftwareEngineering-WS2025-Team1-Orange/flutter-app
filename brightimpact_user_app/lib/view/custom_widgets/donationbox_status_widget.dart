import 'package:bright_impact/model/donationbox.dart';
import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/state/entity_provider/donationbox_provider.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:bright_impact/view/custom_widgets/qr_scanner_widget.dart';
import 'package:bright_impact/view/custom_widgets/rotating_circle_widget.dart';
import 'package:bright_impact/view/pages/input_pages/add_donationbox_page.dart';
import 'package:bright_impact/view/pages/input_pages/others/add_powersupply_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationboxStatusWidget extends StatefulWidget {
  const DonationboxStatusWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DonationBoxStatusWidgetState();
}

class _DonationBoxStatusWidgetState extends State<DonationboxStatusWidget>
    with WidgetsBindingObserver {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Start cyclic refetching
    Provider.of<DonationboxProvider>(context, listen: false)
        .startCyclicRefetch();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appState = Provider.of<AppState>(context, listen: false);
      final provider = Provider.of<DonationboxProvider>(context, listen: false);

      if (appState.pendingActionRegisterBoxCUID != null) {
        final cuid = appState.pendingActionRegisterBoxCUID!;
        appState.pendingActionRegisterBoxCUID = null;

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => FractionallySizedBox(
            heightFactor: 0.9,
            child: AddDonationBoxPage(cuid: cuid, provider: provider),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // Stop cyclic refetching
    Provider.of<DonationboxProvider>(context, listen: false)
        .stopCyclicRefetch();
    super.dispose();
  }

  // Tracks current app lifecycle state
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final donationboxProvider =
        Provider.of<DonationboxProvider>(context, listen: false);
    // App in active
    if (state == AppLifecycleState.resumed) {
      donationboxProvider.refetch();
      donationboxProvider.startCyclicRefetch();
      // App not active
    } else if (state == AppLifecycleState.paused) {
      donationboxProvider.stopCyclicRefetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Consumer<DonationboxProvider>(
        builder: (context, donationboxProvider, child) {
      final box = donationboxProvider.entity?.firstOrNull;

      return SizedBox(
          width: width * 0.85,
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                          color: const Color.fromARGB(255, 238, 238, 238),
                          width: 1.0)),
                  child: Center(
                      child: Column(children: [
                    Text(
                      "Donationbox",
                      style: theme.textTheme.labelMedium,
                    ),
                    // Show progress indicator for very first load
                    if (donationboxProvider.isLoading &&
                        donationboxProvider.loadingError == null &&
                        donationboxProvider.entity == null)
                      CircularProgressIndicator(color: theme.primaryColor)
                    // Show error when error appeared
                    else if (donationboxProvider.loadingError != null)
                      Text(donationboxProvider.loadingError!.message)
                    else if (box != null)
                      _buildDonationboxInfo(context, box, donationboxProvider)
                    else
                      _buildAddDonationBoxWidget(context, donationboxProvider)
                  ])))));
    });
  }

  Widget _buildDonationboxInfo(
      BuildContext context, Donationbox box, DonationboxProvider provider) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    const double secondsForDay = 3600 * 24;

    final avgEarningString =
        "${(box.earningsAvgDayCent / 100).toStringAsFixed(2).replaceAll(".", ",")} €";
    final activeTimeStr =
        "${(100 * (box.activeTimeEachDaySec ?? 0) / secondsForDay).round()}%";

    final isActive = box.status == DonationboxStatus.working;
    final isOnline = box.status != DonationboxStatus.disconnected;
    final isPowerSupplyOk = box.solarStatus == DonationboxSolarStatus.ok;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          box.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 8),
        Text(
          box.status.name.toUpperCase(),
          style: TextStyle(
            color: box.status == DonationboxStatus.disconnected
                ? Colors.grey
                : theme.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: _buildStatusItem(
                    avgEarningString, "Ø/Tag", Icons.euro, context,
                    animationReversed: true,
                    isActive: isActive,
                    isOnline: isOnline)),
            SizedBox(width: 10),
            Expanded(
                child: Opacity(
                    opacity:
                        box.solarStatus != DonationboxSolarStatus.ok ? 0.1 : 1,
                    child: _buildStatusItem(
                        "${box.powerSurplusWatt?.toStringAsFixed(0) ?? "--"} Watt",
                        (box.powerSurplusWatt ?? 0) >= 0
                            ? "Überschuss"
                            : "Defizit",
                        Icons.bolt,
                        context,
                        isActive: isActive && isPowerSupplyOk,
                        isOnline: isOnline))),
            SizedBox(width: 10),
            Expanded(
                child: _buildStatusItem(
                    activeTimeStr, "Active Time", Icons.timer, context,
                    isActive: isActive, isOnline: isOnline)),
          ],
        ),
        if (box.solarStatus == DonationboxSolarStatus.pending)
          Padding(
              padding: EdgeInsets.only(top: width * 0.07),
              child: Text("Warten auf Solaranlage ...")),
        if (box.solarStatus == DonationboxSolarStatus.error)
          Padding(
              padding: EdgeInsets.only(top: width * 0.07),
              child: Text(
                "Fehler mit Solaranlage",
                style: TextStyle(color: Colors.red),
              )),
        if (box.solarStatus == DonationboxSolarStatus.noConfig ||
            box.solarStatus == DonationboxSolarStatus.error)
          Padding(
              padding: EdgeInsets.only(top: width * 0.07),
              child: Opacity(
                  opacity:
                      box.status == DonationboxStatus.disconnected ? 0.2 : 1.0,
                  child: ButtonWidget(
                    labelText: "Solaranlage anbinden",
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AddPowersupplyPage(
                                provider: provider,
                              ));
                      return Future.value(true);
                    },
                  ))),
      ],
    );
  }

  Widget _buildStatusItem(
      String label, String? subtitle, IconData icon, BuildContext context,
      {bool animationReversed = false,
      bool isActive = true,
      bool isOnline = true}) {
    final theme = Theme.of(context);
    const lightWhite = Color.fromARGB(120, 255, 255, 255);

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
                                color: isActive
                                    ? theme.primaryColor
                                    : Colors.white,
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
                                  color: isActive
                                      ? theme.primaryColor
                                      : Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          SizedBox(height: constraints.maxHeight * 0.05),
                          Icon(
                            icon,
                            color: isActive ? theme.primaryColor : Colors.white,
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
            color: isActive ? theme.primaryColor : lightWhite,
            reversed: animationReversed,
            isRotating: isOnline,
          ),
        ),
      ],
    );
  }

  Widget _buildAddDonationBoxWidget(
      BuildContext context, DonationboxProvider donationboxProvider) {
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
