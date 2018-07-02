import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {

  @override
  _UploadPageState createState() => new _UploadPageState();

}

class _UploadPageState extends State<UploadPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('读图上传图片'),
          ),
          body: new Center(
              child: null
          ),
        ),
    );
  }

}