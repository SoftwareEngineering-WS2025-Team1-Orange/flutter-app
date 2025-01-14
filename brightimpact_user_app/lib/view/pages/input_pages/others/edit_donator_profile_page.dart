import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDonatorDialogPage extends StatefulWidget {
  const EditDonatorDialogPage({super.key});

  @override
  State<StatefulWidget> createState() => _EditDonatorDialogPageState();
}

class _EditDonatorDialogPageState extends State<EditDonatorDialogPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    final donator = Provider.of<AppState>(context, listen: false).donator;
    firstNameController.text = donator?.firstname ?? "";
    lastNameController.text = donator?.lastname ?? "";
    emailController.text = donator?.email ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = Provider.of<AppState>(context);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: AlertDialog(
          title: Text("Dein Profil"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: "Vorname"),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: "Nachname"),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "E-Mail"),
                )
              ],
            ),
          ),
          actions: [
            Center(
                child:
                    // Update Button
                    ButtonWidget(
              labelText: "Speichern",
              onPressed: () async {
                final result =
                    await appState.donatorProvider.setDonatorAttribute(
                  firstName: firstNameController.text.isNotEmpty
                      ? firstNameController.text
                      : null,
                  lastName: lastNameController.text.isNotEmpty
                      ? lastNameController.text
                      : null,
                  email: emailController.text.isNotEmpty
                      ? emailController.text
                      : null,
                );

                if (result == null) {
                  // Updated successfully
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  return true;
                } else {
                  // Display error message
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Hoppla! ${result.message}"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                  return false;
                }
              },
            )),
            SizedBox(
              height: 10,
            ),
            // Logout-Button
            Center(
                child: ButtonWidget(
                  isOutlinedButton: true,
              onPressed: () async {
                final confirmLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Abmelden bestätigen"),
                    content: Text("Möchtest du dich wirklich abmelden?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Abbrechen", style: theme.textTheme.labelSmall,),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text("Abmelden",
                            style: theme.textTheme.labelSmall!.copyWith(color: Colors.red)),
                      ),
                    ],
                  ),
                );

                if (confirmLogout == true) {
                  appState.logout();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
                return Future.value(true);
              },
              labelText: "Logout",
            )),
            SizedBox(
              height: 10,
            ),
            // Cancel Button
            Center(
                child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Abbrechen",
                  style:
                      theme.textTheme.bodyMedium!.copyWith(color: Colors.grey)),
            )),
          ],
        ));
  }
}
