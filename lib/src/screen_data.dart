import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [ScreenData] this class represents a dimensions of screen
///
/// @created_by: Rafael S Pereira
///
/// @created_by: Marcelo F. S Andrade
/// @at: 15/10/2020
class ScreenData {
  /// [Map<String, double>] _cachedValues: this map respresents a cache of
  /// already calculated values by [dim] method;
  final Map<String, double> _cachedValues;

  const ScreenData(this._cachedValues);

  /// creates a new ScreenData from a given Context
  factory ScreenData.init(BuildContext context) {
    final screenData = ScreenData({});
    screenData.init(context);
    return screenData;
  }

  /// [init]: init a ScreenUtil from a
  ///
  /// [BuildContext] [context]
  ///
  void init(BuildContext context) {
    ScreenUtil.init(context);
  }

  /// [dim] get a [double] relative  dimension based  on a screen percent's
  double dim(double value, String type) {
    String key = value.toString() + type;

    double result = _cachedValues[key];

    if (result == null) {
      result = _calculateDimension(value, type);
      _cachedValues.putIfAbsent(key, () => result);
    }

    return result;
  }

  double _calculateDimension(double value, String type) {
    type = type.toLowerCase().replaceAll(RegExp(r"\s+"), "");
    value = value * 0.01;
    double result = 0;

    if (type == 'w') {
      return value.wp;
    } else if (type == 'h') {
      return value.hp;
    }
    return result.w;
  }
}
