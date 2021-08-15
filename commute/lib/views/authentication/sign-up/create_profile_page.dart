import 'package:commute/components/colored_safe_area.dart';
import 'package:commute/theme/components/custom_all.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:commute/views/authentication/sign-up/car_information_page.dart';
import 'package:commute/views/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage() : super();

  @override
  State<StatefulWidget> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final Widget _profilePicturePlaceholder = CircleAvatar(
    backgroundColor: Colors.white,
    child: Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: Icon(Icons.person_outline,
                color: CustomColors.primaryColorLight, size: 50)),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: CustomColors.primaryColorLight,
                child: Icon(Icons.upload, color: Colors.white, size: 16),
                radius: 12,
              ),
              radius: 16,
            ),
          ),
        )
      ],
    ),
    radius: 46,
  );

  _onBackButtonPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  _onNextButtonPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CarInformationPage()),
    );
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
                    AppLocalizations.of(context)!.createYourProfile,
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
                    Text(
                      AppLocalizations.of(context)!.letsGetToKnowEachOther,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: CustomSpacing.spacing_24),
                    CircleAvatar(
                      // state with profile picture path + boolean check + upload functionality on tapped
                      backgroundColor: CustomColors.primaryColorLight,
                      child: _profilePicturePlaceholder,
                      radius: 50,
                    ),
                    SizedBox(height: CustomSpacing.spacing_24),
                    TextField(
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context)!.myNameIs_Ellipsis,
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: CustomSpacing.spacing_24),
                    SizedBox(
                        child: TextButton(
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child:
                                      Text(AppLocalizations.of(context)!.next)),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.chevron_right_outlined,
                                      size: 21))
                            ],
                          ),
                          onPressed: _onNextButtonPressed,
                        ),
                        width: double.infinity),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(
                CustomSpacing.spacing_32,
                CustomSpacing.spacing_32,
                CustomSpacing.spacing_32,
                CustomSpacing.spacing_16),
          ))
        ],
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    ));
  }
}
