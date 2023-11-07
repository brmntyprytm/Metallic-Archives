# Metallic Archives

Name : Bramantyo Priyo Utomo

Class : International Class

NPM : 2206821563

# Essay

<details>
<summary><strong>Assignment 7: Flutter Basic Elements</strong></summary>

## Flutter Basic Elements

### Essay Questions

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

### Implementation

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
