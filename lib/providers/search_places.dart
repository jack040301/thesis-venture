import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

final mySetProvider = ChangeNotifierProvider<MySet>((ref) {
  return MySet();
});

class MySet extends ChangeNotifier {
  final Set<Marker> _set = <Marker>{};

  Set<Marker> get set => _set;

  void add(value) {
    _set.add(value);
    notifyListeners();
  }

  void remove(String value) {
    _set.remove(value);
    notifyListeners();
  }
}
