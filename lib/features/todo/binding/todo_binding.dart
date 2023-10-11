import 'package:get/get.dart';
import 'package:todo_getx/features/todo/view_model/todo_view_model.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}
