// import 'package:flutter/foundation.dart';

// class AppState extends ChangeNotifier {
//   bool _isLoggedIn = false;

//   bool get isLoggedIn => _isLoggedIn;

//   set isLoggedIn(bool value) {
//     _isLoggedIn = value;
//     notifyListeners();
//   }
// }
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _userID = '';
  String _userName = '';
  String _userPic = '';


  String _targetID=''; // Add the _userID field
  String _targetName = '';
  String _targetPic = '';
  bool get isLoggedIn => _isLoggedIn;
  String get userID => _userID;
  String get userName => _userName; // Add a getter for _userID
   String get userPic => _userPic; // Add a getter for _userID

  String get targetID => _targetID; 
    String get targetName => _targetName; // Add a getter for _userID
  // Add a getter for _userID
  String get targetPic => _targetPic;

  /// Add a getter for _targetID


  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  set userID(String value) {
    _userID = value;
    notifyListeners();
  }
    set userName(String value) {
    _userName = value;
    notifyListeners();
  }
    set userPic(String value) {
    _userPic = value;
    notifyListeners();
  }
    set targetID(String value) {
    _targetID = value;
    notifyListeners();
  }
  set targetName(String value) {
    _targetName = value;
    notifyListeners();
  }

  set targetPic(String value) {
    _targetPic = value;
    notifyListeners();
  }
}
