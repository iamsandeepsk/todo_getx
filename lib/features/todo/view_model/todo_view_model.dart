import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/features/todo/model/todo_model.dart';

import '../repo/todo_repository.dart';

class TodoController extends GetxController {
  ///
  final TodoRepository _todoRepository = TodoRepository.instance;

  ///
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController subTitleTextEditingController = TextEditingController();

  /// TO DO LIST
  var totoList = List<TodoModel>.empty(growable: true).obs;

  ///
  var isLoading = false.obs;

  ///
  clearTextFields() {
    titleTextEditingController.clear();
    subTitleTextEditingController.clear();
  }

  ///
  setTextFields({required String title, required String subTitle}) {
    titleTextEditingController.text = title;

    subTitleTextEditingController.text = subTitle;
  }

  ///
  @override
  void onInit() {
    super.onInit();

    ///
    getTodo();
  }

  ///
  Future<bool> addTodo() async {
    ///
    setLoading(value: true);

    try {
      ///
      var result = await _todoRepository.addTodo(
        title: titleTextEditingController.text.trim(),
        subTitle: subTitleTextEditingController.text.trim(),
      );

      ///
      log("Result addTodo $result");

      ///
      if (result != 0) {
        ///
        totoList.add(
          TodoModel(
            title: titleTextEditingController.text.trim(),
            subTitle: subTitleTextEditingController.text.trim(),
            id: result,
          ),
        );
      }

      return true;
    } catch (sd) {
      log("Error TodoController addTodo $sd");
      return false;
    } finally {
      ///
      setLoading(value: false);
    }
  }

  ///
  Future<bool> updateTodo({
    required int id,
    required int index,
  }) async {
    ///
    setLoading(value: true);

    try {
      ///
      var result = await _todoRepository.editTodo(
        title: titleTextEditingController.text.trim(),
        subTitle: subTitleTextEditingController.text.trim(),
        id: id,
      );

      ///
      log("Result edit Todo $result");

      ///
      if (result > 0) {
        ///
        totoList[index] = TodoModel(
          title: titleTextEditingController.text.trim(),
          subTitle: subTitleTextEditingController.text.trim(),
          id: id,
        );
      }

      return true;
    } catch (sd) {
      log("Error TodoController addTodo $sd");
      return false;
    } finally {
      ///
      setLoading(value: false);
    }
  }

  ///
  Future<void> getTodo() async {
    ///
    setLoading(value: true);

    try {
      ///
      var list = await _todoRepository.getTodo();

      ///
      log("Result getTodo $list");

      ///
      if (list.isNotEmpty) {
        ///
        List<TodoModel> tempList = List<TodoModel>.empty(growable: true);

        ///
        for (int lc = 0; lc < list.length; lc++) {
          ///
          tempList.add(
            TodoModel(
              title: list[lc]['title'],
              subTitle: list[lc]['subTitle'],
              id: list[lc]['id'],
            ),
          );
        }
        totoList.addAll(tempList);
      }
    } catch (sd) {
      log("Error TodoController getTodo $sd");
    } finally {
      ///
      setLoading(value: false);
    }
  }

  ///
  Future<void> deleteTodo({required int id, required int index}) async {
    ///
    setLoading(value: true);
    try {
      var result = await _todoRepository.deleteTodo(
        id: id,
      );

      log("Result delete Todo $result");

      if (result > 0) {
        totoList.removeAt(index);
      }
    } catch (sd) {
      log("Error TodoController deleteTodo $sd");
    } finally {
      ///
      setLoading(value: false);
    }
  }

  ///
  setLoading({required bool value}) {
    isLoading.value = value;
  }
}
