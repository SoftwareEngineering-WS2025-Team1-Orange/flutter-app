import 'package:bright_impact/view/custom_widgets/button_widget.dart';
import 'package:flutter/material.dart';

class InputPageData {
  final String previewText;
  final bool isPassword;
  final RegExp compliantRegExp;
  final RegExp inputLimitRegExp;
  final TextEditingController controller;

  const InputPageData(
      {required this.previewText,
      this.isPassword = false,
      required this.compliantRegExp,
      required this.inputLimitRegExp,
      required this.controller});
}

// ignore: must_be_immutable
class InputPage extends StatefulWidget {
  final String title;
  final List<InputPageData> textFields;
  final bool lastPage;
  Future<bool> Function()? onNext;
  VoidCallback? onBack;
  final String continueButtonText;

  InputPage({
    super.key,
    required this.title,
    required this.textFields,
    required this.lastPage,
    this.onNext,
    this.onBack,
    this.continueButtonText = "Weiter",
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
    final moreThanOneInput = widget.textFields.length > 1;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * 0.1, vertical: width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: width * 0.8,
              child: Text(
                widget.title,
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.left,
                maxLines: 3,
              )),
          const SizedBox(height: 20),
          Column(
            children: widget.textFields
                .map((t) => Column(children: [
                      _buildTextBox(context, t, moreThanOneInput),
                      const SizedBox(height: 40),
                    ]))
                .toList(),
          ),
          Opacity(
              opacity: _isValid ? 1.0 : 0.4,
              child: ButtonWidget(
                  labelText: widget.continueButtonText,
                  onPressed: _isValid
                      ? () async {
                          return await widget.onNext!();
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

  Widget _buildTextBox(BuildContext context,
      InputPageData textFieldData, bool ignoreIsValid) {
    final theme = Theme.of(context);

    return TextField(
      controller: textFieldData.controller,
      cursorColor: theme.primaryColor,
      obscureText: textFieldData.isPassword,
      enableInteractiveSelection: false,
      style: theme.textTheme.headlineMedium!.copyWith(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintText: textFieldData.previewText,
        hintStyle: const TextStyle(color: Color.fromARGB(97, 255, 255, 255)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        errorText: _errorMessage,
      ),
      onChanged: (value) {
        if (!textFieldData.inputLimitRegExp.hasMatch(value)) {
          textFieldData.controller.text =
              value.replaceAll(RegExp(r'[^\w\s@#\$%!]'), '');
          textFieldData.controller.selection = TextSelection.fromPosition(
            TextPosition(offset: textFieldData.controller.text.length),
          );
        }
        setState(() {
          _isValid =
              textFieldData.compliantRegExp.hasMatch(value) || ignoreIsValid;
          //_errorMessage = _isValid ? null : "Invalid input!";
        });
      },
    );
  }
}

class InputSheet extends StatefulWidget {
  final List<InputPage> inputPages;

  const InputSheet(
      {super.key,
      required this.inputPages,});

  @override
  State<StatefulWidget> createState() => _InputSheetState();
}

class _InputSheetState extends State<InputSheet> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<bool> _nextPage() {
    if (_currentPage < 4) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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
                // Replacing onBack and onNext function with default page navigation action if null
                children: widget.inputPages
                  ..forEach((p) {
                    p.onBack = p.onBack ?? (() => _previousPage());
                    p.onNext = p.onNext ?? (() => _nextPage());
                  }))));
  }
}
