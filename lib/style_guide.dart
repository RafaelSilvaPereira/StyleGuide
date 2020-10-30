import 'dart:convert';
import 'package:flutter/widgets.dart';

import 'exceptions/style_exceptions/not_found_exceptions/group_not_found.exception.dart';
import 'exceptions/style_exceptions/syntax_exceptions/invalid_characters.exception.dart';
import 'src/property.dart';
import 'src/style.dart';

import 'src/style_set.dart';
import 'exceptions/style_exceptions/syntax_exceptions/style_query_syntax_error.exception.dart';
import 'src/screen_data.dart';

/// [StyleGuide] Class Refers to any style properties
///
/// @created_by: Rafael S. Pereira
///
/// @created_by: Marcelo F. S. Andrade
///
/// @at: 15/10/2020
class StyleGuide {
  const StyleGuide(this.groups, this.screenData, {this.debug = true});

  final bool debug;

  /// [groups] it's a [Map<String, StyleSet>] from
  /// [String] it's a group name,
  /// [StyleSet] it's a groups value
  ///
  /// simple:
  ///
  /// {
  ///
  ///   'buttons': StyleSet(
  ///     {
  ///       'primary': Style(
  ///         {
  ///           'color': Property(Colors.red),
  ///           'font-size': Property(10),
  ///         }
  ///       ),
  ///       'secondary': Style(
  ///         {
  ///           'color': Property(Colors.green),
  ///           'font-size': Property(15),
  ///         }
  ///       )
  ///     }
  ///   ),
  /// }
  final Map<String, StyleSet> groups;

  /// [ScreenData] screenData: util class which calculates percentages of the
  /// screen dimensions
  final ScreenData screenData;

  /// [StyleGuide.init]: A factory constructor to build a StyleGuide, from a
  /// [Map]
  /// [BuildContext] context: required to create a [ScreenData]
  /// [Map<String, Map<String, Map<String, dynamic>>>] builder: a map to instantiate
  /// a StyleGuide
  ///
  /// [bool] debug: if true verifies all syntax errors of queries.
  ///
  factory StyleGuide.init(
    BuildContext context,
    Map<String, Map<String, Map<String, dynamic>>> builder, {
    bool debug,
  }) {
    final map = builder.map(
      (key, value) => MapEntry(
        key,
        StyleSet.fromMap(value, debug),
      ),
    );

    return StyleGuide(
      map,
      ScreenData.init(context),
      debug: debug,
    );
  }

  /// [StyleGuide.fromJson] is a sugar syntax to create a Style Guide from a given
  ///
  /// [String] builder in json format
  factory StyleGuide.fromJson(
      {String builder, BuildContext context, bool debug}) {
    return StyleGuide.init(context, json.decode(builder), debug: debug);
  }

  @override
  int get hashCode => groups.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StyleGuide &&
          runtimeType == other.runtimeType &&
          groups == other.groups;

  @override
  String toString() {
    return 'StyleGuide{groups: ${groups.toString()}}';
  }

  /// [get] a [dynamic] value from a property chosen by [query]
  ///
  /// Any queries are like [String] and they are written in the format
  ///
  /// 'group_name > style_name : property_name'
  ///
  dynamic get(String query) {
    // Verifies if the query is valid
    if (debug) _verifySyntax(query);
    final args = query.split('>');

    // Verifies if the groupKey is valid
    var groupKey = args[0];
    groupKey = groupKey.toLowerCase().replaceAll(RegExp(r"\s+"), "");
    if (debug) _verifyGroupKey(groupKey, query);

    final styleSetQuery = args[1];

    return groups[groupKey].get(styleSetQuery.trim());
  }

  /// Verifies if the query is valid
  ///
  /// The query is valid if it contains only the following characters:
  /// - a-z
  /// - A-Z
  /// - 0-9
  /// - '_'
  /// - '-'
  /// - ' '
  /// - '>'
  /// - ':'
  /// And if it has exactly one '>'
  ///
  /// If not, it trhows an exception
  ///
  _verifySyntax(String query) {
    if (!RegExp(r'^[a-zA-Z0-9_>\-: ]+$').hasMatch(query)) {
      throw InvalidCharactersException(query);
    } else if ('>'.allMatches(query).length != 1) {
      throw StyleQuerySyntaxErrorException(query);
    }
  }

  /// Verifies if the groupKey is valid
  ///
  /// The groupKey is only valid when it doesn't have ':'
  /// and the group exists inside the group map
  ///
  /// If it's not valid, it throws an exception
  ///
  _verifyGroupKey(String groupKey, String query) {
    if (groupKey.contains(':')) {
      throw StyleQuerySyntaxErrorException(query);
    } else if (groups[groupKey] == null) {
      throw GroupNotFoundException(
        groupKey,
        groups.keys.toList(),
      );
    }
  }

  /// get dimensions from ScreenData
  double dim(double value, String type) {
    return screenData.dim(value, type);
  }
}
