

import '../i_style_query.exception.dart';

class IElementNotFoundException extends IStyleQueryException {

  List<String> elementsList;
  String elementKey;
  String listName;
  String elementName;

  elementsListToString(List<String> eList) {
    String result = "";
    eList.forEach((e) { 
      result += "- ${e.toString()};\n";
    });

    return result;
  }

  

  @override
  String toString() {
    String list = elementsListToString(elementsList);
    return "${super.toString()}\n\n$elementName '$elementKey' not found.\n\nThe available $listName are:\n$list";
  }

}