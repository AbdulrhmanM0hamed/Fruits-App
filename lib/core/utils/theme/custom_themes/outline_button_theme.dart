import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  
  TOutlinedButtonTheme._(); // To avoid creating instances

  /// Light Theme for OutlinedButton
  static final ButtonStyle lightOutlinedButtonTheme = OutlinedButton.styleFrom(
    foregroundColor: Colors.blue, // Text and icon color
    side: const BorderSide(color: Colors.blue, width: 2), // Border color and width
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  /// Dark Theme for OutlinedButton
  static final ButtonStyle darkOutlinedButtonTheme = OutlinedButton.styleFrom(
    foregroundColor: Colors.white, // Text and icon color
    side: const BorderSide(color: Colors.white, width: 2), // Border color and width
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
