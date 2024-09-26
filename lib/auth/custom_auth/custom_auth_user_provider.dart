import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class TestCustomAuthenAuthUser {
  TestCustomAuthenAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserDataStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<TestCustomAuthenAuthUser> testCustomAuthenAuthUserSubject =
    BehaviorSubject.seeded(TestCustomAuthenAuthUser(loggedIn: false));
Stream<TestCustomAuthenAuthUser> testCustomAuthenAuthUserStream() =>
    testCustomAuthenAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
