// import 'package:flutter/material.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
//
// class PDFView extends StatefulWidget {
//   final String link;
//
//   PDFView({required this.link});
//
//   @override
//   _PDFViewState createState() => _PDFViewState();
// }
//
// class _PDFViewState extends State<PDFView> {
//   bool _isLoading = true;
//   PDFDocument? document;
//
//   @override
//   void initState() {
//     super.initState();
//     loadDocument();
//   }
//
//   loadDocument() async {
//     document = await PDFDocument.fromURL(widget.link);
//
//     setState(() => _isLoading = false);
//   }
//
//   changePDF() async {
//     setState(() => _isLoading = true);
//
//     document = await PDFDocument.fromURL(widget.link);
//
//     setState(() => _isLoading = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         drawer: Drawer(
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 36),
//               ListTile(
//                 title: Text('Load from URL'),
//                 onTap: () {
//                   changePDF();
//                 },
//               ),
//             ],
//           ),
//         ),
//         appBar: AppBar(
//           title: const Text('FlutterPluginPDFViewer'),
//         ),
//         body: Center(
//             child: _isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : PDFViewer(document: document)),
//       ),
//     );
//   }
// }
