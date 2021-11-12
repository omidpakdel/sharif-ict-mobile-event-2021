import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData myTheme = ThemeData(
  fontFamily: 'Kalameh',
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: ExtryColors.white,
    iconTheme: IconThemeData(color: ExtryColors.title),
  ),
  primaryColor: const Color(0xff4caf50),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: const Color(0xffc8e6c9),
  primaryColorDark: const Color(0xff388e3c),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  bottomAppBarColor: const Color(0xffffffff),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  toggleableActiveColor: const Color(0xff43a047),
  secondaryHeaderColor: const Color(0xffe8f5e9),
  backgroundColor: const Color(0xffa5d6a7),
  // backgroundColor: const Color(0xFFFAFAFA),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xff4caf50),
  hintColor: const Color(0x8a000000),
  errorColor: const Color(0xffd32f2f),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xff4caf50),
      primaryVariant: Color(0xff388e3c),
      secondary: Color(0xff4caf50),
      secondaryVariant: Color(0xff388e3c),
      surface: Color(0xffffffff),
      background: Color(0xffa5d6a7),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
);
