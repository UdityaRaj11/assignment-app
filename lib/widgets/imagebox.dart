import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({Key? key}) : super(key: key);

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  // ignore: prefer_typing_uninitialized_variables
  var _image;
  bool savebuttonpressed = false;
  bool _isUploading = false;
  var _uploadedFileURL;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future uploadImage() async {
    setState(() {
      _isUploading = true;
    });

    var storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    var uploadTask = storageReference.putFile(_image);
    await uploadTask.whenComplete;
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        _isUploading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: getImage,
          child: _isUploading
              ? const CircularProgressIndicator()
              : _uploadedFileURL != null
                  ? Image.network(
                      _uploadedFileURL,
                      height: 200,
                      width: 200,
                    )
                  : _image == null
                      ? Container(
                          color: const Color.fromARGB(255, 132, 217, 134),
                          height: MediaQuery.of(context).size.height / 2.5,
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: const Center(
                            child: Text(
                              'Tap here to select Image!!',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height / 2.5,
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(_image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
        ),
      ],
    );
  }
}
