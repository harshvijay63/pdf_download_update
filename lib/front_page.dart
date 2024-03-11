import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'upload_page.dart';
import 'download_page.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black, Colors.black
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 3,
                  child: Lottie.asset('assets/animation/new_animation.json', frameRate: FrameRate.max),
                ), // assets/animation/Welcome_animation.json
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'Welcome to PDF Tool',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Easily upload or download your PDF files',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPage())),
                        child: Text('Upload PDF', style: TextStyle(fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadPage())),
                        child: Text('Download PDF', style: TextStyle(fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.deepPurpleAccent,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
