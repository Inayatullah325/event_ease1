import 'package:flutter/material.dart';

void main() => runApp(PopUp());

class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Example'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle the menu selection
                print('Selected: $value');
              },
              itemBuilder: (BuildContext context) {
                return {'Option 1', 'Option 2', 'Option 3'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Center(child: Text('Tap the three dots in the AppBar')),
      ),
    );
  }
}
