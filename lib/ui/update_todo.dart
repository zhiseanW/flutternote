import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/data/model/todo.dart';
import 'package:hello_flutter/data/repository/todo_repo.dart';
import 'package:hello_flutter/navigation.dart';
import 'package:hello_flutter/ui/widgets/text_input_field.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({super.key, required this.id});

  final String id;

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  final repo = TodoRepo();
  String? _titleError;
  String? _descError;

  late int id;

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  initState() {
    super.initState();
    id = int.parse(widget.id);
    getTodoId(id);
  }

  Future<void> getTodoId(int id) async {
    var todo = await repo.getTodoById(id);
    titleController.text = todo?.title ?? "";
    descController.text = todo?.desc ?? "";
  }

  _onClickUpdateTodo() {
    var title = titleController.text;
    var desc = descController.text;

    if (title.isEmpty) {
      setState(() {
        _titleError = "Title cannot be empty";
      });
      return;
    }
    if (desc.isEmpty) {
      setState(() {
        _descError = "Description cannot be empty";
      });
      return;
    }

    var todo = Todo(id: id, title: title, desc: desc);
    debugPrint(todo.toString());
    repo.updateTodo(todo);
    context.pop(true);
  }

  _onClickWelcome() {
    context.pushReplacementNamed(Screens.welcome.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Update Todo")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInputField(
              controller: titleController,
              error: _titleError,
              hintText: "Title",
            ),
            TextInputField(
              controller: descController,
              error: _descError,
              hintText: "Description",
            ),
            SizedBox(
              width: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _onClickUpdateTodo, child: const Text("Update")),
                const SizedBox(
                  width: 16.0,
                ),
                ElevatedButton(
                    onPressed: _onClickWelcome, child: const Text("Welcome"))
              ],
            )
          ],
        ));
  }
}
