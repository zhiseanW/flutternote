import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_flutter/ui/widgets/custom_text.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(
          child: Column(
        children: [
          const CustomText(text: "Welcome to Flutter Dev"),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
              onPressed: () => {context.pop()}, child: const Text("Back"))
        ],
      )),
    );
  }
}
