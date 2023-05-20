import 'package:flutter/material.dart';
import 'package:learning_app2/constants.dart';
import 'package:learning_app2/home.dart';
import 'package:learning_app2/sem/pdfviewer.dart';
import 'package:learning_app2/sem/sem1.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learning_app2/download/check_permission.dart';
import 'package:learning_app2/download/directory_path.dart';
import 'package:learning_app2/sem/syncpdfviewer.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as Path;


// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CoursePage(),
//     );
//   }
// }




class CoursePage extends StatefulWidget {
  final Course course;

  const CoursePage({Key? key, required this.course}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  bool isPermission = false;
  var checkAllPermissions = CheckPermission();

  checkPermission() async {
    var permission = await checkAllPermissions.isStoragePermission();
    if (permission) {
      setState(() {
        isPermission = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  // Create ask permission if there is no permission body: isPermission
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.courseName),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.course.ppt.length,
        itemBuilder: (context, index) {
          final pptName = widget.course.ppt[index];
          return Card(
            child: TileList(
              fileUrl: pptName.link,
              title: pptName.pptTitle,
            ),
          );
        },
      ),
    );
  }
}


class TileList extends StatefulWidget {
  TileList({Key? key, required this.fileUrl, required this.title}) : super(key: key);
  final String fileUrl;
  final String title;

  @override
  State<TileList> createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  bool dowloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String filePath;
  late CancelToken cancelToken;
  var getPathFile = DirectoryPath();

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    setState(() {
      dowloading = true;
      progress = 0;
    });

    try {
      await Dio().download(widget.fileUrl, filePath,
          onReceiveProgress: (count, total) {
            setState(() {
              progress = (count / total);
            });
          }, cancelToken: cancelToken);
      setState(() {
        dowloading = false;
        fileExists = true;
      });
    } catch (e) {
      print(e);
      setState(() {
        dowloading = false;
      });
    }
  }

  cancelDownload() {
    cancelToken.cancel();
    setState(() {
      dowloading = false;
    });
  }

  checkFileExit() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
  }

  openfile(String link) {

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PDFView(link:link),
          ),
    );
    // OpenFile.open(filePath);
    // print("fff $filePath");
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fileName = Path.basename(widget.fileUrl);
    });
    checkFileExit();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.grey.shade100,
      child: ListTile(
          title: Text(widget.title),
          leading: IconButton(
              onPressed: () {
                fileExists && dowloading == false
                    ? openfile(pptName.link)
                    : cancelDownload();
              },
              icon: fileExists && dowloading == false
                  ? const Icon(
                Icons.window,
                color: Colors.green,
              )
                  : const Icon(Icons.close)),
          trailing: IconButton(
              onPressed: () {
                fileExists && dowloading == false
                    ? openfile(widget.fileUrl)
                    : startDownload();
              },
              icon: fileExists
                  ? const Icon(
                Icons.save,
                color: Colors.green,
              )
                  : dowloading
                  ? Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 3,
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.blue),
                  ),
                  Text(
                    "${(progress * 100).toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
                  : const Icon(Icons.download))),
    );
  }
}
