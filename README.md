# The Hunter's Workshop Mobile

Name : Bramantyo Priyo Utomo

Class : International Class

NPM : 2206821563

# Assignment Explanations

<details>
<summary><strong>Assignment 7: Flutter Basic Elements</strong></summary>

## Flutter Basic Elements

<details>
<summary><strong>Essay Questions</strong></summary>

<strong>What are the main differences between stateless and stateful widget in Flutter?</strong>

Stateless Widgets: These are widgets that describe part of the user interface which can depend on configuration information in the parent widget and on the system itself, but does not depend on any runtime state. In other words, it describes what the view should look like given its current configuration and state. It cannot change over time. Examples include Icon, IconButton, and Text.

Stateful Widgets: These are widgets that can change over time. They can maintain state that might change during the lifetime of the widget. Implementing a stateful widget requires at least two classes: 1) a StatefulWidget class that creates an instance of 2) a State class. The StatefulWidget class is, itself, immutable, but the State class persists over the lifetime of the widget. Examples include Checkbox, Radio, Slider, InkWell, Form, and TextField.

<strong>Explain all widgets that you used in this assignment.</strong>

1. `Scaffold`: This provides a framework which adheres to Material Design guidelines. It has slots for a AppBar, Drawer, BottomNavigationBar, SnackBar, and more.

2. `AppBar`: This is a Material Design app bar (a.k.a. top bar or action bar).

3. `SnackBar`: This is a temporary message that appears at the bottom of the screen.

4. `myApp`: This is the main widget of the app. It contains the `MaterialApp` widget which is the root of the app. The `MaterialApp` widget contains the `home` property which is the first screen of the app. In this case, the first screen of the app is the `Menu` widget which is located in the `menu.dart` file.

5. `Column`: This is a widget that displays its children in a vertical array.

6. `row`: This is a widget that displays its children in a horizontal array.

7. `children`: This is a property of the `Column` and `Row` widgets. It is a list of widgets that are displayed in the `Column` or `Row`.

</details>

<details>
<summary><strong>Implementation</strong></summary>

1. The first thing I did was to create a Flutter app with the command `flutter create <app_name>`. I named my app `Metallic Archives`.

2. After I created the flutter app, I modified the `main.dart` and also added another dart file called `menu.dart` to create the main menu of the app.

3. ```dart
   import 'package:flutter/material.dart';
   import 'menu.dart';

   void main() {
     runApp(MaterialApp(
       home: Menu(),
     ));
   }
   ```

   This is the main function of the app. It contains the `MaterialApp` widget which is the root of the app. The `MaterialApp` widget contains the `home` property which is the first screen of the app. In this case, the first screen of the app is the `Menu` widget which is located in the `menu.dart` file.

4. ```dart
   class MyApp extends StatelessWidget {
   const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Metallic Archives',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      );
    }
   ```

5. There is also the `menu.dart` file, which contains the `Menu` widget. The `Menu` widget is a stateless widget that contains the main menu of the app.

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ShopItem> items = [
    ShopItem("View Album Catalogues", Icons.checklist),
    ShopItem("Add Albums to Wishlist", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      ...
    )
  }

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key});

  @override
  Widget build(BuildContext context) {
    ...
  }
}
```

</details>
</details>

<details>
<summary><strong>Assignment 8: Flutter Navigation</strong></summary>

<details>
<summary><strong>Essay Questions</strong></summary>

### Flutter Navigation

In Flutter, `Navigator.push()` and Navigator.`pushReplacement()` are used for navigation between screens.

`Navigator.push()`: This method is used to navigate to a new screen, while keeping the current screen in the stack. This means that if you press the back button on the new screen, you will return to the original screen.

`Navigator.pushReplacement()`: This method is used to navigate to a new screen, replacing the current screen in the stack. This means that if you press the back button on the new screen, you will not return to the original screen, because it has been replaced.

### Widgets In Flutter Navigation

In Flutter, there are several layout widgets that are used to arrange other widgets. Here are some of them:

`Container`: A box that can contain a single child widget. It can have a margin, padding, constraints, and a background decoration.

`Row and Column`: These are flexible layout widgets that allow you to align children widgets along a horizontal or vertical axis.

`Stack`: Allows for stacking of multiple children widgets over each other. It can be useful for creating layouts where you want widgets to overlay each other.

`GridView`: A scrollable grid list. It's useful when you need to display data in a grid format.

`ListView`: A scrollable list of widgets arranged linearly. It's useful when you need to display a long list of similar items.

`Expanded`: A widget that expands a child of a Row, Column, or Flex to fill the available space.

### Cleanliness in Flutter Implementation

Clean Architecture in a Flutter application can be implemented by dividing the project into three layers:

`Presentation Layer`: This is the layer where you handle everything related to the UI. It includes widgets, pages, and also the BLoC or ViewModel if you're using state management solutions like BLoC or Provider.

`Domain Layer`: This is the most inner layer and it should be independent of every other layer. It includes entities (the business objects), use cases (the operations that can be performed on the entities), and abstract definitions of repositories.

`Data Layer`: This layer is responsible for fetching data from the network, database, or any other source. It includes data sources, models (the objects you use in the data layer), and the implementation of the repositories defined in the domain layer.

</details>

<details>
<summary><strong>Implementation</strong></summary>

1. I created an app called the `left_drawer.dart` which is a drawer that is located on the left side of the screen. It contains the `ListView` widget which is a scrollable list of widgets arranged linearly. It's useful when you need to display a long list of similar items.

```dart
import 'package:flutter/material.dart';
import 'package:metallicarchives/screens/menu.dart';
import 'package:metallicarchives/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Text(
                  'Metallic Archives',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10), // Use SizedBox for padding
                Text(
                  "Write all your shopping needs here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text(
                'Home Page'), // Corrected typo: 'Homa Page' to 'Home Page'
            // Redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Album to Wishlist'),
            // Redirect to ShopFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

```

2. Then I created the `shopcard.dart`, which is just the menu that has been stripped of the drawer and the app bar.

```dart
import 'package:flutter/material.dart';
import 'package:metallicarchives/screens/shoplist_form.dart';
import 'package:metallicarchives/screens/view_product.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  // ignore: use_key_in_widget_constructors
  const ShopCard(this.item, {Key? key});

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    switch (item.name) {
      case "View Album Catalogues":
        buttonColor = Colors.green;
        break;
      case "Add Albums to Wishlist":
        buttonColor = Colors.blue;
        break;
      case "Logout":
        buttonColor = Colors.red;
        break;
      default:
        buttonColor = Colors.indigo;
    }
    return Material(
      color: buttonColor,
      child: InkWell(
        // Area responsive to touch
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Albums to Wishlist") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
              ),
            );
          }
          if (item.name == "View Album Catalogues") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ViewAlbums(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

```

3. I added a screens package folder which is just a folder that contains all the screens of the app. I also added the menu, form, and the view product file which is the various menus of the app.

4. I also implemented the bonus for the app, which is viewing the products that user have created using the add albums to wishlist menu.

```dart
import 'package:flutter/material.dart';
import 'package:metallicarchives/widgets/left_drawer.dart';
import 'package:metallicarchives/screens/shoplist_form.dart';
import 'package:metallicarchives/models/Albums.dart';

class ViewAlbums extends StatefulWidget {
  const ViewAlbums({Key? key}) : super(key: key);

  @override
  State<ViewAlbums> createState() => _ViewAlbumsState();
}

class _ViewAlbumsState extends State<ViewAlbums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Albums',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: (() {
        if (albums.isEmpty) {
          return const Center(
            child: Text("No Albums found!"),
          );
        } else {
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // Handle card tap
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(albums[index].name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      const SizedBox(height: 10),
                      Text('Description: ${albums[index].description}'),
                      const SizedBox(height: 10),
                      Text('Price: ${albums[index].price}'),
                    ],
                  ),
                ),
              );
            },
          );
        }
      })(),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()));
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black, // Set your desired button color
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}

List<Album> albums = [];
```

In addition to the view product menu, I also added the models required for the app.

```dart
// ignore: file_names
class Album {
  final String name;
  final int price;
  final String description;

  Album(this.name, this.price, this.description);
}

```

</details>
