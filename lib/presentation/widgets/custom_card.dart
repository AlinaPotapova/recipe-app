import 'package:flutter/material.dart';

import '../../data/services/hive_service.dart';
import '../../utils/app_bindings.dart';
import '../views/recipe_ui.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: getIt<HiveService>().listenable,
      builder: (context, box, _) {
        List recipes = getIt<HiveService>().read();

        if (recipes.isEmpty) {
          return const Center(child: Text("No recipes found"));
        }
        if (recipes.length > 10) {
          getIt<HiveService>().delete(0);
        }

        return ListView.builder(
          itemCount: recipes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeUi(),
                    ));
              },
              child: Card(
                color: Colors.lime,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/706/706164.png',
                        // Example icon
                        height: 30,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Title
                    Text(
                      recipes[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Subtitle
                    const Text(
                      "5 Lessons | 3 h 12 m",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            recipes[index].isFavorite = true;
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_outward),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
