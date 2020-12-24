import 'package:flutter/material.dart';
import 'package:todo_list/src/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  _success() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text('item $index'),
        );
      },
    );
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {},
        child: Text('Tentar novamente'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.sucess:
        return _success();
      case HomeState.error:
        return _error();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Todo\'s'),
        ),
        body: stateManagement(HomeState.start));
  }
}
