import '../i_style_query_syntax.exception.dart';

class StyleQuerySyntaxErrorException extends IStyleQuerySyntaxException {
  
  StyleQuerySyntaxErrorException(String query) {
    super.setQuery(query);
  }

  @override
  String toString() {
    return "${super.toString()}\nSyntax error on query:\n'${super.query}'\n\nTry using something like:\n'group > style : property' (for Style Guide)\n\nOr just:\n'style : property' (for Style Set)";
  }
}