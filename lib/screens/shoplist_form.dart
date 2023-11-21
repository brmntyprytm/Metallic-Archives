import 'package:flutter/material.dart';
import 'package:metallicarchives/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:metallicarchives/screens/menu.dart';

class ShopFormPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ShopFormPage({Key? key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _type = "";
  int _attackRating = 0;
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Want to add an album?'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Album Name',
                    labelText: 'Album Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the color you want
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors
                          .grey, // Set the color for the label (unfocused text)
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Type',
                    labelText: 'Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the color you want
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors
                          .grey, // Set the color for the label (unfocused text)
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _type = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Attack Rating",
                    labelText: "Attack Rating",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the color you want
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors
                          .grey, // Set the color for the label (unfocused text)
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _attackRating = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Attack Rating cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Attack Rating must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the color you want
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors
                          .grey, // Set the color for the label (unfocused text)
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Amount must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Set the color you want
                      ),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors
                          .grey, // Set the color for the label (unfocused text)
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.black,
                              title: const Text('Album successfully saved',
                                  style: TextStyle(color: Colors.white)),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    Text('Type: $_type',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    Text('Attack Rating: $_attackRating',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    Text('Amount: $_amount',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    Text('Description: $_description',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      // Send request to Django and wait for the response
                                      // Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                                      final response = await request.postJson(
                                          "http://127.0.0.1:8000/create-flutter/",
                                          jsonEncode(<String, String>{
                                            'name': _name,
                                            'type': _type.toString(),
                                            'attackRating':
                                                _attackRating.toString(),
                                            'amount': _amount.toString(),
                                            'description': _description,
                                            // Adjust the fields with your Django model
                                          }));
                                      if (response['status'] == 'success') {
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "New product has saved successfully!"),
                                        ));
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()),
                                        );
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Something went wrong, please try again."),
                                        ));
                                      }
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
