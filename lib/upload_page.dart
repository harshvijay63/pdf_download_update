import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:lottie/lottie.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  bool _isUploading = false;

  Future<void> uploadFile() async {
    setState(() {
      _isUploading = true;
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']); // for only pdf file selection

    if (result != null) {
      File file = File(result.files.single.path!);
      var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:3000/upload')); // server
      request.files.add(await http.MultipartFile.fromPath('pdfFile', file.path));
      var response = await request.send();

      setState(() {
        _isUploading = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File uploaded successfully!")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to upload file.")));
      }
    } else {
      setState(() {
        _isUploading = false;
      });
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload PDF")),



      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isUploading ? Lottie.asset('assets/upload_animation.json', width: 150) : Container(),
            ElevatedButton(
              onPressed: uploadFile,

              child: Text('Select and Upload PDF'),


            ),
          ],
        ),
      ),
    );
  }
}
