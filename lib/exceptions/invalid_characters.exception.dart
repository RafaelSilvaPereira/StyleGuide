import 'package:flutter/material.dart';

class InvalidCharactersException implements Exception {
  
  String query;
  
  InvalidCharactersException({
    @required this.query,
  });

  @override
  String toString() {
    String errorMessage = "Error in Style query:";
    return "$errorMessage\nInvalid characters in query:\n'$query'\n\nUse only:\n- [a-z];\n- [A-Z];\n- [0-9];\n- '-' (dash);\n- '_' (underscore);\n- '>' (greater than);\n- ':' (colon);\n- ' ' (whitespace).";
  }
}
