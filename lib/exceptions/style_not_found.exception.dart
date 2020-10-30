import 'package:flutter/material.dart';

class StyleNotFoundException implements Exception {

  final List<String> styles;
  final String styleKey;

  StyleNotFoundException({
    @required this.styles,
    @required this.styleKey
  });

  _getStylesList(List<String> stylesList) {
    String result = "";
    stylesList.forEach((element) { 
      result += "- ${element.toString()};\n";
    });

    return result;
  }
 
  @override
  String toString() {
    String errorMessage = "Error in Style query:";
    String stylesList = _getStylesList(styles);
    return "$errorMessage\nStyle '$styleKey' not found.\n\nThe available styles are:\n$stylesList";
  }
} 
