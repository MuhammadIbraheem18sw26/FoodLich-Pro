import 'package:flutter/foundation.dart';

class AppLink {
  static const String homePath = '/home';
  static const String onboardingPath = '/onboarding';
  static const String loginPath = '/login';
  static const String profilePath = '/profile';
  static const String itemPath = '/item';
  static const String tabParam = 'tab';
  static const String idParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;

  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

// fromLocation() converts a URL string to an AppLink:
  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');

    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    void trySet(String key, void Function(String)? setter) {
      if (params.containsKey(key)) setter?.call(params[key] ?? '');
    }

    final link = AppLink()..location = uri.path;

    trySet(AppLink.tabParam, (s) => link.currentTab = int.tryParse(s));
    trySet(AppLink.idParam, (s) => link.itemId = s);

    return link;
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key}=$value&';

    switch (location) {
      case loginPath:
        return loginPath;

      case onboardingPath:
        return onboardingPath;

      case profilePath:
        return profilePath;

      case itemPath:
        var loc = '$itemPath?';
        loc += addKeyValPair(
          key: idParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);

      default:
        var loc = '$homePath?';
        loc += addKeyValPair(
          key: tabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}
