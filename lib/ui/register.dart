import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _name = "";
  var _email = "";
  var _pass = "";
  var _confirmPass = "";

  _onNameChanged(value) {
    setState(() {
      _name = value;
    });
  }

  _onEmailChanged(value) {
    setState(() {
      _email = value;
    });
  }

  _onPassChanged(value) {
    setState(() {
      _pass = value;
    });
  }

  _onConfirmPassChanged(value) {
    setState(() {
      _confirmPass = value;
    });
  }

  _onClickRegister() {
    if (_name == "Bryan" &&
        _email == "bryan@gmail.com" &&
        _pass == "pass" &&
        _confirmPass == "test") {
      context.push("/login");
    } else {
      debugPrint("$_email $_pass");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onNameChanged,
            decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onEmailChanged,
            decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onPassChanged,
            decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: _onConfirmPassChanged,
            decoration: InputDecoration(
                hintText: "Confirm Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _onClickRegister, child: const Text("Register")),
            const SizedBox(
              width: 16.0,
            ),
          ],
        )
      ]),
    );
  }
}
