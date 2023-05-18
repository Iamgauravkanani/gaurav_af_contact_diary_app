import 'package:af_6/Models/contact_model.dart';
import 'package:flutter/cupertino.dart';

class Globals extends ChangeNotifier {
  static List<Contact> allContacts = [];
  static List<Contact> hiddenContacts = [];

  void removeContacts(Contact n) {
    allContacts.remove(n);
    notifyListeners();
  }

  void addContacts(Contact h) {
    hiddenContacts.add(h);
    notifyListeners();
  }
}
