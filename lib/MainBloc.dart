import 'package:flutter/material.dart';

class MainBloc extends ChangeNotifier {
  String _currentPage = "home";

  String get currentPage => _currentPage;

  void changePage({String newPage}) {
    _currentPage = newPage;

    notifyListeners();
  }
}
