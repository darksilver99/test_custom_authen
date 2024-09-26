import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

UserDataStruct getUserData(
  String username,
  String password,
  List<UserDataStruct> userList,
) {
  if (userList.isEmpty) {
    return UserDataStruct();
  }
  return userList.firstWhere(
    (user) => user.username == username && user.password == password,
    orElse: () => UserDataStruct(),
  );
}

bool checkIsDuplicateUsername(
  String username,
  List<UserDataStruct> userList,
) {
  return userList.any((user) => user.username == username);
}
