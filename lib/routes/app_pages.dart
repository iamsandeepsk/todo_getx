import 'package:get/get.dart';
import 'package:todo_getx/features/todo/view/todo_home.dart';

import '../features/todo/binding/todo_binding.dart';
import 'app_routes.dart';

class AppPages {
  ///
  static const initial = Routes.todoHome;

  ///
  static final routes = [
    GetPage(
      name: Routes.todoHome,
      page: () => const TodoHome(),
      binding: TodoBinding(),
    ),
  ];
}
