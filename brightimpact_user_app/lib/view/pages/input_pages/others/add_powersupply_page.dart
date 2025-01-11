import 'package:flutter/material.dart';

void showInputDialog(BuildContext context) {
    // TextEditingController für jedes Eingabefeld
    final TextEditingController fieldNameController = TextEditingController();
    final TextEditingController fieldModelNumberController = TextEditingController();
    final TextEditingController fieldUrlController = TextEditingController();
    final TextEditingController fieldUsernameController = TextEditingController();
    final TextEditingController fieldPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Powersupply hinzufügen"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: fieldNameController,
                  decoration: InputDecoration(labelText: "Name der Powersupply"),
                ),
                TextField(
                  controller: fieldModelNumberController,
                  decoration: InputDecoration(labelText: "Modell Nummer"),
                ),
                TextField(
                  controller: fieldUrlController,
                  decoration: InputDecoration(labelText: "URL"),
                ),
                TextField(
                  controller: fieldUsernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                TextField(
                  controller: fieldPasswordController,
                  decoration: InputDecoration(labelText: "Passwort"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Abbrechen"),
            ),
            ElevatedButton(
              onPressed: () {
                
                print("Feld 1: ${fieldNameController.text}");
                print("Feld 2: ${fieldUrlController.text}");
                print("Feld 3: ${fieldUsernameController.text}");
                print("Feld 4: ${fieldPasswordController.text}");
                Navigator.of(context).pop();
              },
              child: Text("Bestätigen"),
            ),
          ],
        );
      },
    );
  }