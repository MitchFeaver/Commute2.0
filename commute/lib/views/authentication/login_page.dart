import 'package:commute/components/colored_safe_area.dart';
import 'package:commute/components/safe_executor.dart';
import 'package:commute/theme/components/custom_all.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:commute/utils/form/form_field_helper.dart';
import 'package:commute/utils/validation/email_validator.dart';
import 'package:commute/utils/validation/password_validator.dart';
import 'package:commute/views/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage() : super();

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _pageKey = GlobalKey<State>();
  bool _canPressDoneButton = false;
  bool _obscurePassword = true;
  String _email = "";
  String _password = "";

  _onBackButtonPressed() {
    Navigator.pop(context);
  }

  _onDoneButtonPressed() async {
    _validateInput();
  }

  _onInputChanged() {
    if (_canPressDoneButton &&
        (_email.isEmpty ||
            _password.isEmpty ||
            !EmailValidator.isValid(_email) ||
            !PasswordValidator.isValid(_password))) {
      setState(() {
        _canPressDoneButton = false;
      });
    } else if (!_canPressDoneButton &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        EmailValidator.isValid(_email) &&
        PasswordValidator.isValid(_password)) {
      setState(() {
        _canPressDoneButton = true;
      });
    }
  }

  _onPrivacyPolicyTapped() {
    // do something here
  }

  _onTermsAndConditionsTapped() {
    // do something here
  }

  _validateInput() async {
    FocusScope.of(context).unfocus();
    final FormState? _formState = _formKey.currentState;
    if (_formState!.validate()) {
      _formState.save();
      UserCredential? _userCredential;
      await SafeExecutor.execute(_pageKey.currentContext!, () async {
        try {
          _userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: _email, password: _password);
        } on FirebaseAuthException catch (_exception) {
          print(_exception.code);
        }
      });
      if (_userCredential != null) {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
              (_) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                child: Column(
                  key: _pageKey,
                  children: [
                    TextButton.icon(
                      onPressed: _onBackButtonPressed,
                      icon: Icon(Icons.chevron_left_outlined, size: 16),
                      label: Text(AppLocalizations.of(context)!.back),
                      style: CustomButtons.loginSignUpBackTextButtonStyle,
                    ),
                    SizedBox(height: CustomSpacing.spacing_16),
                    Container(
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white,
                          fontSize: 48,
                        ),
                      ),
                      padding: EdgeInsets.only(left: CustomSpacing.spacing_16),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/road_bird_view_forest.png"),
                      fit: BoxFit.cover,
                    )),
                padding: EdgeInsets.fromLTRB(
                    CustomSpacing.spacing_12,
                    CustomSpacing.spacing_16,
                    CustomSpacing.spacing_12,
                    CustomSpacing.spacing_24),
                width: double.infinity,
              ),
              Expanded(
                  child: Container(
                    child: Material(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.email,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [FormFieldHelper.preventWhitespaces],
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                                _onInputChanged();
                              },
                              validator: (input) =>
                                  EmailValidator.getValidationMessage(
                                      context, input),
                            ),
                            SizedBox(height: CustomSpacing.spacing_8),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.password,
                                suffixIcon: IconButton(
                                  icon: Icon(_obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined),
                                  color: CustomColors.primaryColorSwatchLight,
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                  iconSize: 20,
                                  splashColor: Colors.transparent,
                                ),
                              ),
                              inputFormatters: [FormFieldHelper.preventWhitespaces],
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscurePassword,
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                                _onInputChanged();
                              },
                              validator: (input) =>
                                  PasswordValidator.getValidationMessage(
                                      context, input, false),
                            ),
                            SizedBox(height: CustomSpacing.spacing_24),
                            SizedBox(
                                child: TextButton(
                                  child: Text(AppLocalizations.of(context)!.done),
                                  onPressed: _canPressDoneButton ? _onDoneButtonPressed : null,
                                ),
                                width: double.infinity),
                            SizedBox(height: CustomSpacing.spacing_24),
                            SizedBox(
                                child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: AppLocalizations.of(context)!
                                                .byLoggingIn),
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = _onTermsAndConditionsTapped(),
                                            text: AppLocalizations.of(context)!
                                                .termsAndConditions,
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                            )),
                                        TextSpan(
                                            text: AppLocalizations.of(context)!
                                                .and_Lowercase),
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = _onPrivacyPolicyTapped(),
                                            text: AppLocalizations.of(context)!
                                                .privacyPolicy,
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                            )),
                                      ],
                                      style: TextStyle(
                                        color: CustomColors.defaultTextColor,
                                        fontSize: 16,
                                      )),
                                  textAlign: TextAlign.center,
                                ),
                                width: double.infinity),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(
                        CustomSpacing.spacing_32,
                        CustomSpacing.spacing_16,
                        CustomSpacing.spacing_32,
                        CustomSpacing.spacing_16),
                  ))
            ],
          ),
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        ));
  }
}
