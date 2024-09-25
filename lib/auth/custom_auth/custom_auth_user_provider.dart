import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class TestCustomAuthenAuthUser {
  TestCustomAuthenAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<TestCustomAuthenAuthUser> testCustomAuthenAuthUserSubject =
    BehaviorSubject.seeded(TestCustomAuthenAuthUser(loggedIn: false));
Stream<TestCustomAuthenAuthUser> testCustomAuthenAuthUserStream() =>
    testCustomAuthenAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
