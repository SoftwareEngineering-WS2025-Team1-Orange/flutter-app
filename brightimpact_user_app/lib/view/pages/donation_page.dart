import 'package:bright_impact/model/donator.dart';
import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:bright_impact/view/custom_widgets/donation_wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationPage extends StatefulWidget {
  final String targetTitle;
  final String targetSubtitle;
  final bool isNgo;
  final int targetEntityId;

  const DonationPage(
      {super.key,
      required this.targetTitle,
      required this.targetSubtitle,
      required this.isNgo,
      required this.targetEntityId});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  int donationAmountInCents = 0;

  void _displayError(String error, BuildContext context) {
    // Prompt error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _updateDonationAmount(
      String digit, BuildContext context, Donator? donator) {
    final newAmountInCents = (donationAmountInCents * 10) + int.parse(digit);
    if (newAmountInCents / 100 <= (donator?.balance ?? 0.0)) {
      setState(() {
        donationAmountInCents = newAmountInCents;
      });
    } else {
      _displayError("Du hast nicht genug Geld.", context);
    }
  }

  void _removeLastDigit() {
    setState(() {
      donationAmountInCents = (donationAmountInCents / 10).floor();
    });
  }

  String get formattedAmount {
    return (donationAmountInCents / 100)
        .toStringAsFixed(2)
        .replaceAll(".", ",");
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.targetTitle,
                            style: TextStyle(
                                fontSize: screenWidth * 0.073,
                                fontWeight: FontWeight.w700,
                                height: 1)),
                        SizedBox(height: 8),
                        Text(
                          widget.targetSubtitle,
                          style: TextStyle(
                            fontSize: screenWidth * 0.055,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                        child: DonationWalletWidget(
                      amount: appState.donator?.balance ?? 0.0,
                      darkLayout: true,
                    )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Text(
                          "$formattedAmount €",
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16),
                        ButtonWidget(
                          labelText: "Spenden",
                          onPressed: () async {
                            final result = await appState.donatorProvider
                                .donateTo(widget.isNgo, widget.targetEntityId);

                            // Display error when necessary
                            if (result != null && context.mounted) {
                              _displayError("Hoppla. ${result.message}", context);
                            }
                            return result == null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          physics: RangeMaintainingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            if (index == 9) {
                              return SizedBox.shrink(); // Skip index 9 -> emtpy
                            }
                            if (index == 10) {
                              // Digit 0 Button
                              return ElevatedButton(
                                onPressed: () => _updateDonationAmount(
                                    "0", context, appState.donator),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.grey),
                                ),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              );
                            }
                            if (index == 11) {
                              // Remove Button
                              return ElevatedButton(
                                onPressed: _removeLastDigit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.grey),
                                ),
                                child:
                                    Icon(Icons.backspace, color: Colors.black),
                              );
                            }

                            return ElevatedButton(
                              // All other Digit Buttons
                              onPressed: () => _updateDonationAmount(
                                  (index + 1).toString(),
                                  context,
                                  appState.donator),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.grey),
                              ),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
