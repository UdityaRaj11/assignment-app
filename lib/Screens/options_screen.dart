import 'package:flutter/material.dart';
import '../widgets/imagebox.dart';
import '../widgets/textbox.dart';
import '../widgets/savebutton.dart';
import './homepage.dart';

class OptionsScreen extends StatefulWidget {
  List<String> selectedOptions;
  OptionsScreen(this.selectedOptions, {Key? key}) : super(key: key);
  static const routeName = '/options-screen';

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  final List<Widget> selectedWidgets = [];

  @override
  Widget build(BuildContext context) {
    final pd = MediaQuery.of(context).size.height;
    final wth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 255, 231),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: pd / 10,
                  ),
                  child: Container(
                    color: const Color.fromARGB(255, 219, 219, 219),
                    margin: EdgeInsets.only(left: wth / 7, right: wth / 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(left: 10, right: 20),
                          color: Colors.white,
                          child: Checkbox(
                            shape: const CircleBorder(
                              side: BorderSide(
                                width: 2.0,
                              ),
                            ),
                            value: widget.selectedOptions.contains('Text Box'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  widget.selectedOptions.add('Text Box');
                                } else {
                                  widget.selectedOptions.remove('Text Box');
                                }
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Text Box',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: pd / 10,
                  ),
                  child: Container(
                    color: const Color.fromARGB(255, 219, 219, 219),
                    margin: EdgeInsets.only(left: wth / 7, right: wth / 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          color: Colors.white,
                          margin: const EdgeInsets.only(left: 10, right: 20),
                          child: Checkbox(
                            shape: const CircleBorder(
                              side: BorderSide(
                                width: 2.0,
                              ),
                            ),
                            value: widget.selectedOptions.contains('Image Box'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  widget.selectedOptions.add('Image Box');
                                } else {
                                  widget.selectedOptions.remove('Image Box');
                                }
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Image Box',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: pd / 10,
                  ),
                  child: Container(
                    color: const Color.fromARGB(255, 219, 219, 219),
                    margin: EdgeInsets.only(left: wth / 7, right: wth / 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          color: Colors.white,
                          margin: const EdgeInsets.only(left: 10, right: 20),
                          child: Checkbox(
                            shape: const CircleBorder(
                              side: BorderSide(
                                width: 2.0,
                              ),
                            ),
                            value:
                                widget.selectedOptions.contains('Save Button'),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  widget.selectedOptions.add('Save Button');
                                } else {
                                  widget.selectedOptions.remove('Save Button');
                                }
                              });
                            },
                          ),
                        ),
                        const Text(
                          'Save Button',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(10),
              primary: Colors.green,
              side: const BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255), width: 2),
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal),
            ),
            child: const Text('Import widgets'),
            onPressed: () {
              setState(
                () {
                  if (widget.selectedOptions.contains('Text Box')) {
                    selectedWidgets.add(const TextBox());
                  }
                  if (widget.selectedOptions.contains('Image Box')) {
                    selectedWidgets.add(const ImageBox());
                  }
                  if (widget.selectedOptions.contains('Save Button')) {
                    selectedWidgets.add(const SaveButton());
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomePage(selectedWidgets, widget.selectedOptions),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
