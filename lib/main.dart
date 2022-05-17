import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fooderlich_theme.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';
import 'navigation/app_route_parser.dart';

void main() {
  runApp(
    const FooderlichPro(),
  );
}

class FooderlichPro extends StatefulWidget {
  const FooderlichPro({Key? key}) : super(key: key);

  @override
  _FooderlichProState createState() => _FooderlichProState();
}

class _FooderlichProState extends State<FooderlichPro> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  // initilizing app_router parser
  final routeParser = AppRouteParser();

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
      profileManager: _profileManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FooderlichTheme.dark();
          } else {
            theme = FooderlichTheme.light();
          }

          return MaterialApp.router(
            theme: theme,
            title: 'Fooderlich_Pro',
            debugShowCheckedModeBanner: false,
            backButtonDispatcher: RootBackButtonDispatcher(),
            routeInformationParser: routeParser,
            routerDelegate: _appRouter,
          );
        },
      ),
    );
  }
}
