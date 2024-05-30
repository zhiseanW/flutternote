import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.purple,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Flexible(
            child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.green,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Flexible(
                child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ],
            )),
          ],
        )),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
