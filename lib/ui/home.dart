import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/data/model/todo.dart';
import 'package:hello_flutter/data/repository/todo_repo.dart';
import 'package:hello_flutter/navigation.dart';
import 'package:provider/provider.dart';
import 'package:hello_flutter/provider/counter_provider.dart';
import 'package:hello_flutter/ui/widgets/custom_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TodoRepo repo = TodoRepo();
  var todos = [];

  @override
  initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    var items = await repo.getAllTodos();
    setState(() {
      todos = items;
    });
  }

  void _onClickAddTodo() async {
    Object? shouldRefresh = await context.pushNamed(Screens.addTodo.name);
    debugPrint("got a value from next screen: $shouldRefresh");
    if (shouldRefresh == true) {
      _refresh();
    }
  }

  _onClickTodoItem(int id) async {
    Object? shouldRefresh = await context.pushNamed(Screens.updateTodo.name,
        pathParameters: {"id": id.toString()});
    if (shouldRefresh == true) {
      _refresh();
    }
  }

  _onClickDeleteTodo(int id) {
    TodoRepo().deleteTodo(id);
    _refresh();
  }

  _navigateToCounter() {
    context.pushNamed(Screens.counter.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home ${context.watch<CounterProvider>().count}"),
        backgroundColor: Colors.blue.shade200,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickAddTodo,
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _onClickTodoItem(todos[index].id),
                        onLongPress: () => _onClickDeleteTodo(todos[index].id),
                        child: TodoItem(
                            key: Key("key_$index"), todo: todos[index]),
                      )),
            ),
            ElevatedButton(
                onPressed: () => _navigateToCounter(),
                child: const Text("Go to Counter"))
          ],
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue.shade200,
        margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/suisei.png",
              width: 160.0,
              height: 120.0,
            ),
            CustomText(text: todo.title, fontSize: 20.0),
            const SizedBox(
              height: 8.0,
            ),
            CustomText(text: todo.desc),
          ],
        ));
  }
}
