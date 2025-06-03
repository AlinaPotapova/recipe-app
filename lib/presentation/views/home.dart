import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/common/widgets/async_search_anchor.dart';
import 'package:recipe_app/domain/entities/category/category_provider.dart';
import 'package:recipe_app/presentation/views/recipe_view.dart';
import 'package:recipe_app/utils/app_bindings.dart';

import '../../common/widgets/camera.dart';
import '../../data/services/hive_service.dart';
import '../widgets/custom_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final globals = GetIt.instance<AppGlobals>();
  final hiveService = GetIt.instance<HiveService>();

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });

    if (value == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraApp(
                  cameras: [globals.cameras[0]],
                )),
      );
    }
    if (value == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeView(hiveService
              .read()
              .where((element) => element.isFavorite == true)
              .toList()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CategoryWidget(),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "I would like to cook",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            const Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                    height: 50, // Adjust as needed
                    child: CustomAsyncSearchAnchor()),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  hiveService.deleteAll();
                });
              },
              child: Text("delete"),
            ),
            Expanded(
                flex: 2,
                child:
                    Container(color: Colors.limeAccent, child: CustomCard())),
            const SizedBox(height: 20),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: 'Saved'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.camera), label: 'Camera'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_outlined), label: 'Account'),
              ],
              selectedItemColor: Colors.green[500],
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  // refactor
  final CategoryProvider categoryProvider = CategoryProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: null,
          child: const Icon(Icons.menu),
        ),
        title: Text("Categories"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: categoryProvider.categories.map((category) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (category.label == "Random") {
                        //     getIt<FirebaseRepository>().addRecipe(Recipe);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: category.color,
                      radius: 40,
                      child: Icon(
                        category.icon,
                        size: 40,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.label,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

//List
