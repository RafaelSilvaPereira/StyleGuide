/// [Property] Class Refers to any style properties
///
/// @created_by: Rafael S Pereira
///
/// @created_by: Marcelo F. S Andrade
/// @at: 15/10/2020
class Property {
  /// [value]: contains a value of style property
  final dynamic value;

  const Property(this.value);

  /// [get] return a value from this property
  dynamic get() => value;

  @override
  String toString() {
    return 'Property{value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Property &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
