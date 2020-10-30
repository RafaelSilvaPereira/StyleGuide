

import '../i_style_query.exception.dart';

class IStyleQuerySyntaxException extends IStyleQueryException {

  String query;

  setQuery(String query) {
    this.query = query;
  }

  @override
  String toString() {
    return super.toString();
  }

}
