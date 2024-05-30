import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import 'package:hello_flutter/ui/Counter.dart';
import 'package:hello_flutter/ui/add_todo.dart';
import 'package:hello_flutter/ui/dummy.dart';
import 'package:hello_flutter/ui/home.dart';
import 'package:hello_flutter/ui/login.dart';
import 'package:hello_flutter/ui/register.dart';
import 'package:hello_flutter/ui/update_todo.dart';
import 'package:hello_flutter/ui/welcome.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);

  final _routerConfig = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
          name: Screens.login.name,
          path: "/login",
          builder: (context, state) => const Login()),
      GoRoute(
          name: Screens.register.name,
          path: "/register",
          builder: (context, state) => const Register()),
      GoRoute(
          name: Screens.home.name,
          path: "/home",
          builder: (context, state) => const Home()),
      GoRoute(
          name: Screens.addTodo.name,
          path: "/add_todo",
          builder: (context, state) => const AddTodo()),
      GoRoute(
          name: Screens.updateTodo.name,
          path: "/update_todo/:id",
          builder: (context, state) =>
              UpdateTodo(id: state.pathParameters["id"] ?? "0")),
      GoRoute(
          name: Screens.welcome.name,
          path: "/welcome",
          builder: (context, state) => const Welcome()),
      GoRoute(
          name: Screens.dummy.name,
          path: "/dummy",
          builder: (context, state) => const Dummy()),
      GoRoute(
          name: Screens.counter.name,
          path: "/counter",
          builder: (context, state) => const Counter()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Hello Flutter",
      routerConfig: _routerConfig,
    );
  }
}

enum Screens {
  home,
  register,
  login,
  addTodo,
  updateTodo,
  welcome,
  dummy,
  counter
}
