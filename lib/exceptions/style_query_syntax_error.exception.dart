import 'package:flutter/material.dart';

class StyleQuerySyntaxErrorException implements Exception {

  final String query;

  StyleQuerySyntaxErrorException({
    @required this.query,
  });
  
  @override
  String toString() {
    String errorMessage = "Error in Style query:";
    return "$errorMessage\nSyntax error on query:\n'$query'\n\nTry using something like:\n'group > style : property' (for Style Guide)\n\nOr just:\n'style : property' (for Style Set)";
  }
}