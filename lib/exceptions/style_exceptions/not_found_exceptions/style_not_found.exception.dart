

import '../i_element_not_found.exception.dart';

class StyleNotFoundException extends IElementNotFoundException {

  StyleNotFoundException(String styleKey, List<String> styles) {
    super.elementsList = styles;
    super.elementKey = styleKey;
    super.elementName = "Style";
    super.listName = "styles";
  }

  @override
  String toString() {
    return super.toString();
  }
} 
