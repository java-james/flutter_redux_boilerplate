import 'package:flutter/material.dart';
import 'package:redux_thunk_boilerplate/src/styles/colours.dart';

Map<String, TextStyle> textStyles = {
  'bottom_label': TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  ),
  'button_label': TextStyle(
    fontSize: 12.0,
  ),
  'title': TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: colourStyles['gray']
  ),
  'tile_title': TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: colourStyles['white'],
  ),
  'nav_title': TextStyle(
    color: colourStyles['white'],
  ),
};
