import 'package:bright_impact/state/entity_provider/donationbox_provider.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:flutter/material.dart';

class AddPowersupplyPage extends StatefulWidget {
  const AddPowersupplyPage({super.key, required this.provider});

  final DonationboxProvider provider;

  @override
  State<StatefulWidget> createState() => _AddPowersupplyPageState();
}

class _AddPowersupplyPageState extends State<AddPowersupplyPage> {
  final TextEditingController fieldModelNumberController =
      TextEditingController();
  final TextEditingController fieldUsernameController = TextEditingController();
  final TextEditingController fieldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: AlertDialog(
          title: Text("Solaranlage hinzufügen"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: fieldModelNumberController,
                  decoration: InputDecoration(labelText: "Seriennummer"),
                ),
                TextField(
                  controller: fieldUsernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextField(
                  controller: fieldPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Passwort"),
                ),
              ],
            ),
          ),
          actions: [
            Center(
                child: ButtonWidget(
              labelText: "Hinzufügen",
              onPressed: () async {
                final result = await widget.provider.registerPowerSupply(
                  fieldUsernameController.text,
                  fieldPasswordController.text,
                  fieldModelNumberController.text,
                  widget.provider.entity?.firstOrNull?.cuid ?? ""
                );

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
            )),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Center(
                child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Abbrechen",
                  style: theme.textTheme.headlineSmall!
                      .copyWith(color: Colors.grey)),
            )),
          ],
        ));
  }
}
