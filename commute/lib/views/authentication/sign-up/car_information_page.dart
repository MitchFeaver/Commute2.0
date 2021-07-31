import 'package:commute/components/colored_safe_area.dart';
import 'package:commute/theme/components/custom_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarInformationPage extends StatefulWidget {
  const CarInformationPage() : super();

  @override
  State<StatefulWidget> createState() => _CarInformationPageState();
}

class _CarInformationPageState extends State<CarInformationPage> {
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
                  style: CustomButtons.loginSignUpBackTextButtonStyle,
                ),
                SizedBox(height: CustomSpacing.spacing_16),
                Container(
                  child: Text(
                    AppLocalizations.of(context)!.letsTalkCars,
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
              image: AssetImage("assets/images/city_driving_busy.png"),
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
                      AppLocalizations.of(context)!.helpUsWorkOutYourFuelCosts,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: CustomSpacing.spacing_12),
                    Text(
                      AppLocalizations.of(context)!.youCanChangeThisLater,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: CustomSpacing.spacing_24),
                    TextField(
                      decoration: InputDecoration(
                        prefix: Container(
                          child: Text(AppLocalizations.of(context)!.mph_Symbol_Uppercase),
                          padding: EdgeInsets.only(right: CustomSpacing.spacing_4),
                        ),
                        labelText: AppLocalizations.of(context)!.fuelEfficiency,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: CustomSpacing.spacing_24),
                    TextField(
                      decoration: InputDecoration(
                        prefix: Container(
                          child: Text("£"),
                          padding: EdgeInsets.only(right: CustomSpacing.spacing_4),
                        ),
                        labelText:
                            AppLocalizations.of(context)!.fuelPricePerLitre,
                      ),
                      keyboardType: TextInputType.number,
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
                          onPressed: () {},
                        ),
                        width: double.infinity),
                    SizedBox(height: CustomSpacing.spacing_12),
                    SizedBox(
                        child: OutlinedButton(
                          child: Text(AppLocalizations.of(context)!.iDontDrive),
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
