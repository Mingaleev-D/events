import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme _baseNunitoSans = GoogleFonts.nunitoSansTextTheme();
final nunitosans = _baseNunitoSans.copyWith(
  titleMedium: _baseNunitoSans.titleMedium?.copyWith(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  ),
  bodyLarge: _baseNunitoSans.bodyLarge?.copyWith(
    fontSize: 17,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: _baseNunitoSans.bodySmall?.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: _baseNunitoSans.bodyMedium?.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: _baseNunitoSans.headlineSmall?.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
);
