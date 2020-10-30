
import 'package:flutter/material.dart';

class GroupNotFoundException implements Exception {

  final List<String> groups;
  final String groupKey;

  GroupNotFoundException({
    @required this.groups,
    @required this.groupKey
  });

  _getGroupsLisg(List<String> groupsList) {
    String result = "";
    groupsList.forEach((element) { 
      result += "- ${element.toString()};\n";
    });

    return result;
  }
 
  @override
  String toString() {
    String errorMessage = "Error in Style query:";
    String groupsList = _getGroupsLisg(groups);
    return "$errorMessage\nGroup '$groupKey' not found.\n\nThe available groups are:\n$groupsList";
  }
} 
