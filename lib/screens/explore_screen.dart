import 'package:flutter/material.dart';
import 'package:foodlich_pro/models/models.dart';
import 'package:foodlich_pro/api/mock_fooderlich_service.dart';
import 'package:foodlich_pro/components/components.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  final MockFooderlichService mockFooderlichService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockFooderlichService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO: Add Nested List Views

        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          return Center(
            child: Container(
              child: const Text('Show TodayRecipeListView'),
            ),
          );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
