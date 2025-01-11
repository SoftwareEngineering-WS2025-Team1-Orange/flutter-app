import 'package:bright_impact/state/entity_provider/donationbox_provider.dart';
import 'package:bright_impact/view/pages/input_pages/input_page.dart';
import 'package:flutter/material.dart';

class AddDonationBoxPage extends StatefulWidget {
  final DonationboxProvider provider;
  final String cuid;

  const AddDonationBoxPage({super.key, required this.provider, required this.cuid});

  @override
  State<StatefulWidget> createState() => _AddDonationBoxPageState();
}

class _AddDonationBoxPageState extends State<AddDonationBoxPage> {
  final TextEditingController donationboxNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<InputPage> inputPages = [
      InputPage(
        title: "Name deiner Donationbox",
        textFields: [
          InputPageData(
            previewText: "Meine Donationbox",
            compliantRegExp: RegExp(r'^.{4,20}$'),
            inputLimitRegExp: RegExp(r'^.{,20}$'),
            controller: donationboxNameController,
          )
        ],
        lastPage: true,
        onBack: () => Navigator.pop(context),
        onNext: () async {
          final result = await widget.provider.registerDonationBox(widget.cuid, donationboxNameController.text);
          if (result == null) {
            // SUCCESSFULLY REGISTERED
            if (context.mounted) {
              Navigator.pop(context);
            }
          } else {
            if (context.mounted) {
              // Prompt error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Hoppla! ${result.message}"),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          }
          return Future.value(result == null);
        },
        continueButtonText: "Registrieren",
      ),
    ];

    return InputSheet(inputPages: inputPages);
  }
}
