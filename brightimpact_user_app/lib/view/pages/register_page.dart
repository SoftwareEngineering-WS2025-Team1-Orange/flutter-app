import 'package:bright_impact/state/api_login.dart';
import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final PageController _pageController = PageController();
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  int _currentPage = 0;

  Future<bool> _nextPage() {
    if (_currentPage < 4) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // Handle registration logic here (e.g., validate passwords, etc.)
    }

    return Future.value(true);
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            color: theme.secondaryHeaderColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InputPage(
                title: "Wie sollen wir dich nennen?",
                previewText: "Vorname",
                compliantRegExp: RegExp(r'^.{2,}$'), // At least 2 characters
                inputLimitRegExp:
                    RegExp(r'^[a-zA-Z ]*$'), // Letters and spaces only
                controller: _controllers[0],
                lastPage: false,
                onNext: _nextPage,
                onBack: () => Navigator.pop(context),
              ),
              InputPage(
                title: "Und dein Nachname?",
                previewText: "Nachname",
                compliantRegExp: RegExp(r'^.{2,}$'),
                inputLimitRegExp: RegExp(r'^[a-zA-Z ]*$'),
                controller: _controllers[1],
                lastPage: false,
                onNext: _nextPage,
                onBack: _previousPage,
              ),
              InputPage(
                title: "Wie können wir dir schreiben?",
                previewText: "name@mail.de",
                compliantRegExp: RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'), // Basic email regex
                inputLimitRegExp:
                    RegExp(r'^[\w@\.]*$'), // No special characters
                controller: _controllers[2],
                lastPage: false,
                onNext: _nextPage,
                onBack: _previousPage,
              ),
              InputPage(
                title: "Damit wir wissen, dass du es bist.",
                previewText: "Neues Passwort",
                compliantRegExp: RegExp(r'^.{8,}$'), // At least 8 characters
                inputLimitRegExp: RegExp(
                    r'^[\w@#\$%!]*$'), // Letters, numbers, and common symbols
                controller: _controllers[3],
                lastPage: false,
                onNext: _nextPage,
                onBack: _previousPage,
                isPassword: true,
              ),
              InputPage(
                title: "Und noch einmal, bitte ...",
                previewText: "Passwort wiederholen",
                compliantRegExp: RegExp(r'^.{8,}$'),
                inputLimitRegExp: RegExp(r'^[\w@#\$%!]*$'),
                controller: _controllers[4],
                lastPage: true,
                onNext: _register,
                onBack: _previousPage,
                isPassword: true,
              ),
            ],
          ),
        ));
  }

  Future<bool> _register() async {
    final login = ApiLogin();
    final res = await login.register(
        firstname: _controllers[0].text,
        lastname: _controllers[1].text,
        email: _controllers[2].text,
        password: _controllers[3].text);

    if (res) {
      await login.login(_controllers[2].text, _controllers[3].text);
    }

    return res;
  }
}

class InputPage extends StatefulWidget {
  final String title;
  final String previewText;
  final bool isPassword;
  final RegExp compliantRegExp;
  final RegExp inputLimitRegExp;
  final TextEditingController controller;
  final bool lastPage;
  final Future<bool> Function() onNext;
  final VoidCallback onBack;

  const InputPage({
    super.key,
    required this.title,
    required this.previewText,
    this.isPassword = false,
    required this.compliantRegExp,
    required this.inputLimitRegExp,
    required this.controller,
    required this.lastPage,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>
    with AutomaticKeepAliveClientMixin {
  bool _isValid = false;
  String? _errorMessage;

  // Keeps page alive when not visible in PageView
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * 0.1, vertical: width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: theme.textTheme.headlineLarge,
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: widget.controller,
            cursorColor: theme.primaryColor,
            obscureText: widget.isPassword,
            enableInteractiveSelection: false,
            style:
                theme.textTheme.headlineMedium!.copyWith(color: Colors.white),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintText: widget.previewText,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(97, 255, 255, 255)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              errorText: _errorMessage,
            ),
            onChanged: (value) {
              if (!widget.inputLimitRegExp.hasMatch(value)) {
                widget.controller.text =
                    value.replaceAll(RegExp(r'[^\w\s@#\$%!]'), '');
                widget.controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller.text.length),
                );
              }
              setState(() {
                _isValid = widget.compliantRegExp.hasMatch(value);
                //_errorMessage = _isValid ? null : "Invalid input!";
              });
            },
          ),
          const SizedBox(height: 40),
          Opacity(
              opacity: _isValid ? 1.0 : 0.4,
              child: ButtonWidget(
                  labelText: widget.lastPage ? "Registrieren" : "Weiter",
                  onPressed: _isValid
                      ? () async {
                          return await widget.onNext();
                        }
                      : null)),
          TextButton(
            onPressed: widget.onBack,
            child: Text("Zurück",
                style: theme.textTheme.labelMedium!
                    .copyWith(color: const Color.fromARGB(204, 255, 255, 255))),
          ),
        ],
      ),
    );
  }
}
