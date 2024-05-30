import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/data/model/todo.dart';
import 'package:hello_flutter/data/repository/todo_repo.dart';
import 'package:hello_flutter/ui/widgets/text_input_field.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final repo = TodoRepo();

  String? _titleError;

  String? _descError;

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  _onClickAddTodo() {
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

    var todo = Todo(title: title, desc: desc);
    repo.addTodo(todo);
    context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/suisei.png"),
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextInputField(
            controller: titleController,
            error: _titleError,
            hintText: "Title",
          ),
          TextInputField(
              controller: descController,
              error: _descError,
              hintText: "Description"),
          SizedBox(
            width: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: _onClickAddTodo, child: const Text("Add")),
            ],
          )
        ]),
      ),
    );
  }
}
