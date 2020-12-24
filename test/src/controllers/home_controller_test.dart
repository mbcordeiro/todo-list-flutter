import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/src/controllers/home_controller.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);
  test('Must fill todo', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    expect(controller.start(), HomeState.start);
    await controller.start();
    expect(controller.start(), HomeState.sucess);
    expect(controller.todos.isNotEmpty, true);
  });
  test('Must modify the state for error if the modification fails', () async {
    when(repository.fetchTodos()).thenThrow(Exception());
    expect(controller.start(), HomeState.start);
    await controller.start();
    expect(controller.start(), HomeState.sucess);
    expect(controller.todos.isNotEmpty, true);
  });
}

class TodoRepositoryMock extends Mock implements TodoRepository {}
