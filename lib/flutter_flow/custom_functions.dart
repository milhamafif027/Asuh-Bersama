import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning,";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon,";
  } else {
    return "Goodnight,";
  }
}

DateTime getCurrentHour() {
  final DateTime now = DateTime.now();
  return DateTime(now.hour, now.minute, now.second); // 12:00:00 AM
}

int timeToMilisekon(
  String hours,
  String minute,
) {
  // Ekstraksi angka dari string
  int extractNumber(String input) {
    RegExp regExp = RegExp(r'(\d+)');
    Match? match = regExp.firstMatch(input);
    return match != null ? int.parse(match.group(0)!) : 0;
  }

  // Ekstrak jam dan menit
  int jam = extractNumber(hours);
  int menit = extractNumber(minute);

  // Konversi ke milisekon
  int second = (jam * 3600000) + (menit * 60000);
  return second;
}

double secondToHour(int second) {
  return second / 3600000;
}

DateTime getCurrentDate() {
  final DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day); // 12:00:00 AM
}
