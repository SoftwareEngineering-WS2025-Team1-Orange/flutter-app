import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/view/pages/input_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    final List<InputPage> inputPages = [
      InputPage(
        title: "Anmelden",
        textFields: [
          InputPageData(
            previewText: "Deine E-Mail",
            compliantRegExp: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
            inputLimitRegExp: RegExp(r'^[\w@\.]*$'),
            controller: emailTextController,
          ),
        ],
        lastPage: false,
        onBack: () => Navigator.pop(context),
      ),
      InputPage(
        title: "Anmelden",
        textFields: [
          InputPageData(
            previewText: "Passwort",
            compliantRegExp: RegExp(r'^.{4,30}$'),
            inputLimitRegExp: RegExp(r'^.{,30}$'),
            isPassword: true,
            controller: passwordTextController,
          )
        ],
        lastPage: true,
        onNext: () async {
          final result = await appState.login(
              emailTextController.text, passwordTextController.text);
          if (result && context.mounted) {
            // SUCCESSFULLY LOGGED IN: 
            Navigator.pop(context);
          }
          return Future.value(result);
        },
        continueButtonText: "Anmelden",
      ),
    ];

    return InputSheet(inputPages: inputPages);
  }
}
