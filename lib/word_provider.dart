import 'package:flutter/material.dart';
import 'database_helper.dart';

class WordProvider extends ChangeNotifier {
  String? _englishWord;
  String? _turkishMeaning;

  String? get englishWord => _englishWord;
  String? get turkishMeaning => _turkishMeaning;

  Future<void> searchWord(String english) async {
    final word = await DatabaseHelper.getWord(english);
    if (word != null) {
      _englishWord = word['english'];
      _turkishMeaning = word['turkish'];
    } else {
      _englishWord = null;
      _turkishMeaning = null;
    }
    notifyListeners();
  }
}
