import '../exceptions/style_exceptions/not_found_exceptions/property_not_found.exception.dart';
import '../exceptions/style_exceptions/not_found_exceptions/style_not_found.exception.dart';
import '../exceptions/style_exceptions/syntax_exceptions/style_query_syntax_error.exception.dart';
import 'property.dart';
import 'style.dart';

/// [StyleSet] Class Refers to any style properties
///
/// @created_by: Rafael S. Pereira
///
/// @created_by: Marcelo F. S. Andrade
///
/// @at: 15/10/2020
class StyleSet {
  /// [styles] it's a map from
  /// [String] it's a style name,
  /// [Style] is a groups value
  ///
  /// simples:
  ///
  /// {
  ///
  ///   'color': Style(
  ///     {
  ///       'primary': Property(Colors.red),
  ///       'secondary': Property(Colors.green),
  ///       'failure': Property(Colors.yellow),
  ///     }
  ///   )
  /// }
  final Map<String, Style> styles;

  final bool debug;

  const StyleSet(
    this.styles,
    {this.debug = true}  
  );

  factory StyleSet.fromMap(Map<String, Map<String, dynamic>> builder, debug) {
    return StyleSet(
      builder.map(
        (styleSetKey, styles) => MapEntry(
          styleSetKey,
          Style(
            styles.map(
              (styleKey, properties) => MapEntry(
                styleKey,
                Property(properties),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// [get] a [dynamic] value from a property chosen by [query]
  ///
  /// Any queries are like [String] and they are written in the format
  ///
  /// 'style_name : property_name'
  ///
  dynamic get(String query) {

    // Remove all the empty spaces and verify if the query is valid
    if (debug) _verifySyntax(query);
    query = query.toLowerCase().replaceAll(RegExp(r"\s+"), "");

    // Separate the query by ':'
    final arguments = query.split(':');
  
    // Check if the first argument is valid
    final styleKey = arguments[0];
    if (debug) _verifyStyleKey(styleKey);

    // Check if the second argument is valid
    final propertyKey = arguments[1];
    if (debug) _verifyPropertyKey(styleKey, propertyKey);

    return styles[styleKey].get(propertyKey);
  }

  /// Verifies if the query is valid
  /// 
  /// The query is valid when it has exactly one ":"
  /// 
  /// If not valid, it throws an exception
  /// 
  _verifySyntax(String query) {
    if (':'.allMatches(query).length != 1) {
      throw StyleQuerySyntaxErrorException(query);
    } 
  }

  /// Verifies if the chosen style exists in the styles map
  /// 
  /// If not, it throws an exception
  /// 
  _verifyStyleKey(String styleKey) {
    
    if (styles[styleKey] == null) {
      throw StyleNotFoundException(
        styleKey,
        styles.keys.toList(),
      );
    }
  }

  /// Verifies if the chosen property exists in the chosen style
  /// 
  /// If not, it throws an exception
  /// 
  _verifyPropertyKey(String styleKey, String propertyKey) {
    if (styles[styleKey].properties[propertyKey] == null) {
      throw PropertyNotFoundException(
        propertyKey,
        styles[styleKey].properties.keys.toList(),
        styleKey,
      );
    }
  }

  @override
  String toString() {
    return 'StyleGroup{styles: ${styles.toString()}}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyleSet &&
          runtimeType == other.runtimeType &&
          styles == other.styles;

  @override
  int get hashCode => styles.hashCode;
}
