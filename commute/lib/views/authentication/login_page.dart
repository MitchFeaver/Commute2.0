import 'package:commute/components/colored_safe_area.dart';
import 'package:commute/theme/components/custom_all.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:commute/views/main/main_page.dart';
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
  bool _obscurePassword = true;

  _onBackButtonPressed() {
    Navigator.pop(context);
  }

  _onDoneButtonPressed() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
  }

  _onPrivacyPolicyTapped() {
    // do something here
  }

  _onTermsAndConditionsTapped() {
    // do something here
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                child: Column(
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
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.email,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: CustomSpacing.spacing_8),
                            TextField(
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
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscurePassword,
                            ),
                            SizedBox(height: CustomSpacing.spacing_24),
                            SizedBox(
                                child: TextButton(
                                  child: Text(AppLocalizations.of(context)!.done),
                                  onPressed: _onDoneButtonPressed,
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
