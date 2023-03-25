import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_venture/models/auto_complete_results.dart';

final placeResultsProvider = ChangeNotifierProvider<PlaceResults>((ref) {
  return PlaceResults();
});

final searchToggleProvider = ChangeNotifierProvider<SearchToggle>((ref) {
  return SearchToggle();
});

class PlaceResults extends ChangeNotifier {
  List<AutoCompleteResult> allReturnedResults = [];

  void setResults(allPlace) {
    allReturnedResults = allPlace;
    notifyListeners();
  }
}

class SearchToggle extends ChangeNotifier {
  bool searchToggle = false;

  void toggleSearch() {
    searchToggle = !searchToggle;
    notifyListeners();
  }
}
