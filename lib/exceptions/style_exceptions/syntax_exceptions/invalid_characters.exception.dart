import '../i_style_query_syntax.exception.dart';

class InvalidCharactersException extends IStyleQuerySyntaxException {
  
  InvalidCharactersException(String query) {
    super.setQuery(query);
  }

  @override
  String toString() {
    return "${super.toString()}\nInvalid characters in query:\n'${super.query}'\n\nUse only:\n- [a-z];\n- [A-Z];\n- [0-9];\n- '-' (dash);\n- '_' (underscore);\n- '>' (greater than);\n- ':' (colon);\n- ' ' (whitespace).";
  }
}
