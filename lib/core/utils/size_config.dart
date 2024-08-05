
import 'package:flutter/cupertino.dart';

class SizeConfig {



  SizeConfig._();

  static final instance = SizeConfig._();

  static MediaQueryData? _mediaQueryData;
  static double _screenWidth = 0;
  static double _screenHeight =0;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;
    // restrict text scale range
    final constrainedTextScaleFactor = _mediaQueryData!.textScaler.clamp(
      minScaleFactor: 0.8,
      maxScaleFactor: 1.0
    );
    _mediaQueryData!.copyWith(textScaler:  constrainedTextScaleFactor);
  }

  static const double ra38 = 38;
  //considering 812px as base screen height
  static final double size150 = _screenHeight/5.21;
  static final double size300 = _screenHeight/2.70;
  static final double size200 = _screenHeight/4.06;
  static final double size72 = _screenHeight/11.27;
  static final double size20 = _screenHeight/40.06;
  static final double size30 = _screenHeight/20.06;
  static final double size50 = _screenHeight/16.24;
  static final double size18 = _screenHeight/45.11;
  static final double size16 = _screenHeight/50.75;
  static final double size65 = _screenHeight/12.49;
  static final double size100 = _screenHeight/8.12;
  static final double size2Width = _screenWidth/157.5;
  static final double size5 = _screenWidth/162.4;


}