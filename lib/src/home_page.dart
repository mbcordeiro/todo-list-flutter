import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Todo\'s'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text('item $index'),
          );
        },
      ),
    );
  }
}
