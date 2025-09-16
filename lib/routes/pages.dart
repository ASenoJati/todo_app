import 'package:get/get.dart';
import 'package:todo_app/bindings/HomeBinding.dart';
import 'package:todo_app/bindings/LoginBinding.dart';
import 'package:todo_app/bindings/TodoBinding.dart';
import 'package:todo_app/pages/AddTodoPage.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/pages/LoginPage.dart';
import 'package:todo_app/pages/ProfilePage.dart';
import 'package:todo_app/pages/TodoPage.dart';
import 'package:todo_app/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.todoPage,
      page: () => TodoPage(),
      binding: TodoBinding(),
    ),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(
      name: AppRoutes.addTodoPage,
      page: () => AddTodoPage(),
      binding: HomeBinding(),
    ),
  ];
}
