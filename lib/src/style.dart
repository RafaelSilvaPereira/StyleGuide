import 'property.dart';

/// [Style] this class represents a set of properties
///
/// @created_by: Rafael S Pereira
///
/// @created_by: Marcelo F. S Andrade
/// @at: 15/10/2020
class Style {
  final Map<String, Property> properties;

  const Style(this.properties);

  /// get a [dynamic] value, from a given key
  ///
  /// [key] is the name of the property
  get(String key) => properties[key].get();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Style &&
          runtimeType == other.runtimeType &&
          properties == other.properties;

  @override
  int get hashCode => properties.hashCode;

  @override
  String toString() {
    return 'Style{properties: ${properties.toString()}}';
  }
}
