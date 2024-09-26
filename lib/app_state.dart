import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _user = prefs
              .getStringList('ff_user')
              ?.map((x) {
                try {
                  return UserDataStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _user;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _test = '';
  String get test => _test;
  set test(String value) {
    _test = value;
  }

  List<UserDataStruct> _user = [];
  List<UserDataStruct> get user => _user;
  set user(List<UserDataStruct> value) {
    _user = value;
    prefs.setStringList('ff_user', value.map((x) => x.serialize()).toList());
  }

  void addToUser(UserDataStruct value) {
    user.add(value);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void removeFromUser(UserDataStruct value) {
    user.remove(value);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUser(int index) {
    user.removeAt(index);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void updateUserAtIndex(
    int index,
    UserDataStruct Function(UserDataStruct) updateFn,
  ) {
    user[index] = updateFn(_user[index]);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUser(int index, UserDataStruct value) {
    user.insert(index, value);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
