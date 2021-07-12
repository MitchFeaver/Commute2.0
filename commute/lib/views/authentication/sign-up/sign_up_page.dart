import 'package:commute/components/colored_safe_area.dart';
import 'package:commute/theme/components/custom_all.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage() : super();

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ButtonStyle _backTextButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      elevation: 0,
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      primary: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      side: BorderSide.none,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: TextStyle(color: CustomColors.defaultTextColor));

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  _onBackButtonPressed() {
    Navigator.pop(context);
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
                  style: _backTextButtonStyle,
                ),
                SizedBox(height: CustomSpacing.spacing_16),
                Container(
                  child: Text(
                    "Sign up",
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
                      obscureText: _obscurePassword,
                    ),
                    SizedBox(height: CustomSpacing.spacing_8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.confirmPassword,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          color: CustomColors.primaryColorSwatchLight,
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                          iconSize: 20,
                          splashColor: Colors.transparent,
                        ),
                      ),
                      obscureText: _obscureConfirmPassword,
                    ),
                    SizedBox(height: CustomSpacing.spacing_24),
                    SizedBox(
                        child: TextButton(
                          child: Text("test"),
                          onPressed: () {},
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
