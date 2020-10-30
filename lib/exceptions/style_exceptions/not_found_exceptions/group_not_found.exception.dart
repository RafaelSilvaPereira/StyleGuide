import '../i_element_not_found.exception.dart';

class GroupNotFoundException extends IElementNotFoundException {
  GroupNotFoundException(String groupKey, List<String> groups) {
    super.elementsList = groups;
    super.elementKey = groupKey;
    super.elementName = "Group";
    super.listName = "groups";
  }

  @override
  String toString() {
    return super.toString();
  }
}
