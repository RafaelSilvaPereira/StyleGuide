import 'package:meta/meta.dart';

class PropertyNotFoundException implements Exception {
  final List<String> properties;
  final String propertyKey;
  final String styleKey;

  const PropertyNotFoundException({
    @required this.properties,
    @required this.propertyKey,
    @required this.styleKey,
  });

  _getPropertiesList(List<String> propertiesList) {
    String result = "";
    propertiesList.forEach((element) {
      result += "- ${element.toString()};\n";
    });

    return result;
  }

  @override
  String toString() {
    String errorMessage = "Error in Style query:";
    String propertiesList = _getPropertiesList(properties);
    return "$errorMessage\nProperty '$propertyKey' not found.\n\nThe available properties in '$styleKey' are:\n$propertiesList";
  }
}
