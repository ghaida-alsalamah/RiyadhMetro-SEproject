import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _Notifications = true;
  bool get Notifications => _Notifications;
  set Notifications(bool value) {
    _Notifications = value;
  }

  List<dynamic> _Stations = [
    jsonDecode(
        '{\"name\":\"King Abdullah Financial District (KAFD)\",\"latitude\":24.7136,\"longitude\":46.6753}'),
    jsonDecode(
        '{\"name\":\"Olaya\",\"latitude\":24.6923,\"longitude\":46.7242}'),
    jsonDecode(
        '{\"name\":\"Ar Rabi\",\"latitude\":24.794699286801013,\"longitude\":46.657195005960645}'),
    jsonDecode(
        '{\"name\":\"Al Malqa\",\"latitude\":24.7786,\"longitude\":46.6442}'),
    jsonDecode(
        '{\"name\":\"King Khalid International Airport\",\"latitude\":24.9578,\"longitude\":46.6988}'),
    jsonDecode(
        '{\"name\":\"King Abdulaziz Historical Center\",\"latitude\":24.6318,\"longitude\":46.7095}'),
    jsonDecode(
        '{\"name\":\"Al Hamra\",\"latitude\":24.7744,\"longitude\":46.7513}'),
    jsonDecode(
        '{\"name\":\"Al Quds\",\"latitude\":24.7745,\"longitude\":46.7643}'),
    jsonDecode(
        '{\"name\":\"King Saud University\",\"latitude\":24.7142,\"longitude\":46.6275}'),
    jsonDecode(
        '{\"name\":\"Al Ma\'ather\",\"latitude\":24.6457,\"longitude\":46.7042}'),
    jsonDecode(
        '{\"name\":\"Al Murabba\",\"latitude\":24.6333,\"longitude\":46.7167}'),
    jsonDecode(
        '{\"name\":\"Riyadh Gallery\",\"latitude\":24.7388,\"longitude\":46.6565}'),
    jsonDecode(
        '{\"name\":\"Al Nakheel\",\"latitude\":24.7886,\"longitude\":46.7107}'),
    jsonDecode(
        '{\"name\":\"King Fahd Stadium\",\"latitude\":24.7545,\"longitude\":46.8368}'),
    jsonDecode(
        '{\"name\":\"Al Batha\",\"latitude\":24.6214,\"longitude\":46.7073}'),
    jsonDecode(
        '{\"name\":\"Riyadh Park\",\"latitude\":24.7416,\"longitude\":46.6364}')
  ];
  List<dynamic> get Stations => _Stations;
  set Stations(List<dynamic> value) {
    _Stations = value;
  }

  void addToStations(dynamic value) {
    Stations.add(value);
  }

  void removeFromStations(dynamic value) {
    Stations.remove(value);
  }

  void removeAtIndexFromStations(int index) {
    Stations.removeAt(index);
  }

  void updateStationsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    Stations[index] = updateFn(_Stations[index]);
  }

  void insertAtIndexInStations(int index, dynamic value) {
    Stations.insert(index, value);
  }

  List<String> _favorites = ['Home'];
  List<String> get favorites => _favorites;
  set favorites(List<String> value) {
    _favorites = value;
  }

  void addToFavorites(String value) {
    favorites.add(value);
  }

  void removeFromFavorites(String value) {
    favorites.remove(value);
  }

  void removeAtIndexFromFavorites(int index) {
    favorites.removeAt(index);
  }

  void updateFavoritesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favorites[index] = updateFn(_favorites[index]);
  }

  void insertAtIndexInFavorites(int index, String value) {
    favorites.insert(index, value);
  }

  String _FromStation = '';
  String get FromStation => _FromStation;
  set FromStation(String value) {
    _FromStation = value;
  }

  String _ToStation = '';
  String get ToStation => _ToStation;
  set ToStation(String value) {
    _ToStation = value;
  }

  String _PaymentMethod = '';
  String get PaymentMethod => _PaymentMethod;
  set PaymentMethod(String value) {
    _PaymentMethod = value;
  }

  String _TicketType = '';
  String get TicketType => _TicketType;
  set TicketType(String value) {
    _TicketType = value;
  }

  String _meesage = '';
  String get meesage => _meesage;
  set meesage(String value) {
    _meesage = value;
  }

  List<String> _q = [];
  List<String> get q => _q;
  set q(List<String> value) {
    _q = value;
  }

  void addToQ(String value) {
    q.add(value);
  }

  void removeFromQ(String value) {
    q.remove(value);
  }

  void removeAtIndexFromQ(int index) {
    q.removeAt(index);
  }

  void updateQAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    q[index] = updateFn(_q[index]);
  }

  void insertAtIndexInQ(int index, String value) {
    q.insert(index, value);
  }

  int _numQueries = 0;
  int get numQueries => _numQueries;
  set numQueries(int value) {
    _numQueries = value;
  }
}
