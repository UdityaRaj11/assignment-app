import 'package:assignment_app/Screens/options_screen.dart';
import '../widgets/imagebox.dart';
import '../widgets/textbox.dart';
import '../widgets/savebutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  List<Widget> selectedWidgets;
  List<String> selectedOptions;
  HomePage(this.selectedWidgets, this.selectedOptions, {Key? key})
      : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMessage = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Assignment App')),
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            color: const Color.fromARGB(255, 231, 255, 231),
            margin: EdgeInsets.all(mediaQuery.devicePixelRatio * 5),
            height: mediaQuery.size.height / 1.4,
            width: mediaQuery.size.width,
            child: widget.selectedWidgets.isEmpty
                ? const Center(
                    child: Text('No Widget is Added'),
                  )
                : ListView.builder(
                    itemCount: widget.selectedWidgets.length,
                    itemBuilder: (context, index) {
                      // ignore: unrelated_type_equality_checks
                      if (widget.selectedWidgets[0] is SaveButton &&
                          widget.selectedWidgets.length == 1) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _showMessage
                                ? Container(
                                    height: mediaQuery.size.height / 1.6,
                                    child: const Center(
                                      child: Text('Add More Widgets to Save'),
                                    ),
                                  )
                                : Container(
                                    height: mediaQuery.size.height / 1.6,
                                  ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showMessage = true;
                                });
                              },
                              child: const Center(
                                child: Text('Save'),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return widget.selectedWidgets[index];
                      }
                    }),
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
            onPressed: () {
              setState(
                () {
                  if (widget.selectedWidgets.contains(const TextBox())) {
                    widget.selectedOptions.add('Text Box');
                  }
                  if (widget.selectedWidgets.contains(const ImageBox())) {
                    widget.selectedOptions.add('Image Box');
                  }
                  if (widget.selectedWidgets.contains(const SaveButton())) {
                    widget.selectedOptions.add('Save Button');
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OptionsScreen(widget.selectedOptions),
                    ),
                  );
                },
              );
            },
            child: const Text('Add Widget'),
          ),
        ]),
      ),
    );
  }
}
