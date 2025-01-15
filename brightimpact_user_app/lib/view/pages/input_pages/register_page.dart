import 'package:bright_impact/state/api_login.dart';
import 'package:bright_impact/state/app_state.dart';
import 'package:bright_impact/view/pages/input_pages/input_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<TextEditingController> controllers =
      List.generate(5, (_) => TextEditingController());

  String? passwordErrorMessage;

  Future<bool> _register() async {
    if (controllers[3].text != controllers[4].text) {
      setState(() {
        passwordErrorMessage = "Passwörter müssen übereinstimmen";
      });
      return Future.value(false);
    } else {
      setState(() {
        passwordErrorMessage = null;
      });
    }

    final login = ApiLogin();
    final res = await login.register(
        firstname: controllers[0].text,
        lastname: controllers[1].text,
        email: controllers[2].text,
        password: controllers[3].text);

    if (res == null) {
      if (context.mounted) {
        final context = this.context;
        // SUCCESS: Login
        final appState = Provider.of<AppState>(context);
        await appState.login(controllers[2].text, controllers[3].text);

        // Close register sheet
        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    } else {
      if (context.mounted) {
        BuildContext context = this.context;
        // Prompt error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Hoppla! ${res.message}"),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }

    return Future.value(res == null);
  }

  @override
  Widget build(BuildContext context) {
    final List<InputPage> inputPages = [
      InputPage(
        title: "Wie sollen wir dich nennen?",
        textFields: [
          InputPageData(
            previewText: "Vorname",
            compliantRegExp: RegExp(r'^.{2,}$'), // At least 2 characters
            inputLimitRegExp:
                RegExp(r'^[a-zA-Z ]*$'), // Letters and spaces only
            controller: controllers[0],
          )
        ],
        lastPage: false,
        onBack: () => Navigator.pop(context),
      ),
      InputPage(
        title: "Und dein Nachname?",
        textFields: [
          InputPageData(
            previewText: "Nachname",
            compliantRegExp: RegExp(r'^.{2,}$'),
            inputLimitRegExp: RegExp(r'^[a-zA-Z ]*$'),
            controller: controllers[1],
          )
        ],
        lastPage: false,
      ),
      InputPage(
        title: "Wie können wir dir schreiben?",
        textFields: [
          InputPageData(
            previewText: "name@mail.de",
            compliantRegExp: RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'), // Basic email regex
            inputLimitRegExp: RegExp(r'^[\w@\.]*$'), // No special characters
            controller: controllers[2],
          )
        ],
        lastPage: false,
      ),
      InputPage(
        title: "Damit wir wissen, dass du es bist.",
        textFields: [
          InputPageData(
            previewText: "Neues Passwort",
            compliantRegExp: RegExp(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&\._]).{8,30}$'), // At least 8 characters
            inputLimitRegExp: RegExp(r'^.{,30}$'),
            controller: controllers[3],
            isPassword: true,
          )
        ],
        lastPage: false,
      ),
      InputPage(
        title: "Und noch einmal, bitte ...",
        textFields: [
          InputPageData(
            previewText: "Passwort wiederholen",
            compliantRegExp: RegExp(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&\._]).{8,30}$'), // At least 8 characters
            inputLimitRegExp: RegExp(r'^.{,30}$'),
            controller: controllers[4],
            isPassword: true,
            errorMessage: passwordErrorMessage,
          )
        ],
        lastPage: true,
        onNext: _register,
        continueButtonText: "Registrieren",
      ),
    ];

    return InputSheet(inputPages: inputPages);
  }
}
