import 'package:flutter/material.dart';
import 'package:flutter_application_2/film.dart';

class FilmsProvider extends ChangeNotifier {
  List<Film> _films = [];

  List<Film> get films => _films;

  void setFilms(List<Film> films) {
    _films = films;
    notifyListeners();
  }
}
