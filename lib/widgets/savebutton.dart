import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Save"),
      ),
    );
  }
}
