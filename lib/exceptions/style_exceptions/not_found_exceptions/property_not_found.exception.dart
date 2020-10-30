

import '../i_element_not_found.exception.dart';

class PropertyNotFoundException extends IElementNotFoundException {

  PropertyNotFoundException(String propertyKey, List<String> properties, String styleKey) {
    super.elementsList = properties;
    super.elementKey = propertyKey;
    super.elementName = "Property";
    super.listName = "properties in '$styleKey'";
  }

  @override
  String toString() {
    return super.toString();
  }
} 
