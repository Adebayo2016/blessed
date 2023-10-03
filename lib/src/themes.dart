import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData blessedAcademyTheme(BuildContext context) => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: Colors.transparent,
      primaryColor: kColorMainPrimary,
      backgroundColor: kColorMainPrimary,
      scaffoldBackgroundColor: kColorMainPrimary,
      brightness: Brightness.light,
      hintColor: kColorMainPrimary,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: kColorMainPrimary,
        selectionColor: kColorMainPrimary,
        selectionHandleColor: kColorMainPrimary,
      ),
      fontFamily: GoogleFonts.getFont('Montserrat').fontFamily,
    );

OutlineInputBorder errorBorder = const OutlineInputBorder(
  borderSide: BorderSide(color: Colors.red, width: 1.0),
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);
OutlineInputBorder normalBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.purple[200]!, width: 1.0),
  borderRadius: const BorderRadius.all(
    Radius.circular(5),
  ),
);
OutlineInputBorder normalProfileBorder = const OutlineInputBorder(
  borderSide: BorderSide(color: kColorWhite, width: 1.0),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

OutlineInputBorder emptyBorder = const OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFFE9E5EA), width: 1.0),
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);

UnderlineInputBorder underlineBorder = const UnderlineInputBorder(
  borderSide: BorderSide(
    color: kColorWhite,
    width: 1.0,
    style: BorderStyle.solid,
  ),
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(1),
  ),
);
