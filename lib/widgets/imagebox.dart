import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({Key? key}) : super(key: key);

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  // final picker = ImagePicker();
  // late XFile _imageFile;
  // Future pickImage() async {
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: ImageSource.gallery);
  //   var path = await FlutterAbsolutePath.getAbsolutePath(pickedFile);
  //   setState(() {
  //     _imageFile = XFile(pickedFile.path);
  //   });
  // }

  // Future uploadImageToFirebase(BuildContext context) async {
  //   String fileName = basename(widget._imageFile.path);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          color: const Color.fromARGB(255, 179, 250, 167),
          height: MediaQuery.of(context).size.height / 3,
          child: const Center(child: Text("No Image yet!")),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Add Image"),
        ),
      ],
    );
  }
}
