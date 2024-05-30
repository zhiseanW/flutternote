import 'package:flutter/material.dart';
import 'package:hello_flutter/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Provider")),
      body: Center(
        child: Text("${context.watch()<CounterProvider>().count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.watch<CounterProvider>().increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
