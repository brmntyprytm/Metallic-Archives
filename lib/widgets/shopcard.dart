import 'package:flutter/material.dart';
import 'package:metallicarchives/screens/list_product.dart';
import 'package:metallicarchives/screens/login.dart';
import 'package:metallicarchives/screens/shoplist_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();
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
        onTap: () async {
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
          } else if (item.name == "View Album Catalogues") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Good bye, $uname."),
              ));
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                // ignore: unnecessary_string_interpolations
                content: Text("$message"),
              ));
            }
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
