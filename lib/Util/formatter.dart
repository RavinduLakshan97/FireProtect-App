import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

abstract class Formatter {
  static final _dateTimeFormat = DateFormat.yMMMMEEEEd().add_jm();
  static final _dateFormat = DateFormat.yMMMMEEEEd();
  static final escape = HtmlEscape();

  Formatter._();

  static String getDateTime(Timestamp timestamp) {
    return _dateTimeFormat.format(timestamp.toDate());
  }

  static String getDate(Timestamp timestamp) {
    return _dateFormat.format(timestamp.toDate());
  }

  static String formatHTML(String text) {
    final str = text.replaceAllMapped(
      RegExp(
        r'https?://(www\.)?[-\w@:%.,_\+~#=/]+',
        caseSensitive: false,
        unicode: true,
        multiLine: true,
      ),
          (m) {
        return '<a href=${m[0]}>${m[0]}</a>';
      },
    ).replaceAll('\n', '</p><p>');
    return '<p>$str</p>';
  }

}
