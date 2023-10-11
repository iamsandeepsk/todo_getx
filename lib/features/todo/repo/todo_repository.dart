import 'dart:developer';

import '../../../service/database/database.dart';

class TodoRepository {
  ///
  TodoRepository._();

  ///
  static TodoRepository get instance => TodoRepository._();

  ///
  final DbService _dbService = DbService.instance;

  ///
  Future<int> addTodo({required String title, required String subTitle}) async {
    try {
      return await _dbService.insert(title: title, subTitle: subTitle);
    } catch (sd) {
      log("Error TodoRepository addTodo $sd ");
      rethrow;
    }
  }

  ///
  Future<int> deleteTodo({required int id}) async {
    try {
      return await _dbService.delete(id: id);
    } catch (sd) {
      log("Error TodoRepository deleteTodo $sd ");
      rethrow;
    }
  }

  ///
  Future<int> editTodo({
    required String title,
    required String subTitle,
    required int id,
  }) async {
    try {
      return await _dbService.update(title: title, subTitle: subTitle, id: id);
    } catch (sd) {
      log("Error TodoRepository editTodo $sd ");
      rethrow;
    }
  }

  ///
  Future<List<Map<String, dynamic>>> getTodo() async {
    try {
      return await _dbService.read();
    } catch (sd) {
      log("Error TodoRepository getTodo $sd ");
      rethrow;
    }
  }
}
