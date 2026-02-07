import 'package:flutter/material.dart';

extension OpenSansTextStyles on TextTheme {
  TextStyle get osH1 =>
      displayMedium!.copyWith(fontFamily: 'OpenSans', fontSize: 32.4);

  TextStyle get osH2 =>
      displaySmall!.copyWith(fontFamily: 'OpenSans', fontSize: 28.8);

  TextStyle get osH3 =>
      headlineLarge!.copyWith(fontFamily: 'OpenSans', fontSize: 25.6);

  TextStyle get osH4 =>
      headlineMedium!.copyWith(fontFamily: 'OpenSans', fontSize: 22.8);

  TextStyle get osH5 =>
      headlineSmall!.copyWith(fontFamily: 'OpenSans', fontSize: 20.3);

  TextStyle get osH6 =>
      titleLarge!.copyWith(fontFamily: 'OpenSans', fontSize: 18);

  TextStyle get osP =>
      bodyLarge!.copyWith(fontFamily: 'OpenSans', fontSize: 16);

  TextStyle get osPItalic => bodyLarge!.copyWith(
    fontFamily: 'OpenSans',
    fontSize: 16,
    fontStyle: .italic,
  );

  TextStyle get osS =>
      bodySmall!.copyWith(fontFamily: 'OpenSans', fontSize: 13.3);

  TextStyle get osSItalic => bodySmall!.copyWith(
    fontFamily: 'OpenSans',
    fontSize: 13.3,
    fontStyle: .italic,
  );
  TextStyle get osS2 =>
      bodySmall!.copyWith(fontFamily: 'OpenSans', fontSize: 11.1);

  TextStyle get osSmall =>
      bodySmall!.copyWith(fontFamily: 'OpenSans', fontSize: 14.2);
}
