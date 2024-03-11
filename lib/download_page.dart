import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:lottie/lottie.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  bool _isDownloading = false;
  String? _localFilePath;

  Future<void> downloadFile() async {
    setState(() {
      _isDownloading = true;
    });

    var url = 'http://10.0.2.2:3000/download?filename=Harsh-Vijay(MCA).pdf'; // server location
    var response = await http.get(Uri.parse(url));
    var documentDirectory = await getApplicationDocumentsDirectory();
    File file = File('${documentDirectory.path}/Harsh-Vijay(MCA).pdf');
    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      _isDownloading = false;
      _localFilePath = file.path; // Save the file path
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Download PDF")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isDownloading
                ? Lottie.asset('assets/download_animation.json', width: 150) // animation getting

                : _localFilePath == null
                ? Container()
                : ElevatedButton(
              onPressed: () => OpenFile.open(_localFilePath),
              child: Text('Open Downloaded PDF'),
            ),
            ElevatedButton(
              onPressed: downloadFile,
              child: Text('Download Harsh-Vijay(MCA).pdf'),
            ),
          ],
        ),
      ),
    );
  }
}
