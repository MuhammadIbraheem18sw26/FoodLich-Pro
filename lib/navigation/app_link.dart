import 'package:flutter/foundation.dart';

class AppLink {
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kItemPath = '/item';
  // 2
  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';
  // 3
  String location;
  // 4
  int currentTab;
  // 5
  String itemId;
  // 6
  AppLink(
      {required this.location, required this.currentTab, required this.itemId});
// TODO: Add fromLocation
// TODO: Add toLocation
}
