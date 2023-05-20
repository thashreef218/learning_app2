import 'package:flutter/material.dart';
import 'package:learning_app2/constants.dart';
import 'package:learning_app2/home.dart';
import 'package:learning_app2/sem/course.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sem1(),
    );
  }
}

class Course {
  final String courseName;
  final List<Ppts> ppt;
  final List<Qps> qps;
  Course({
    required this.courseName,required this.ppt,required this.qps
});
}



class Ppts {
  final String pptTitle;
  final String link;
  Ppts({
    required this.pptTitle,required this.link
});
}

class Qps{
  final String qpName;
  final String qpLink;
  Qps({
    required this.qpName, required this.qpLink
});
}



class Sem1 extends StatefulWidget {
  const Sem1({Key? key}) : super(key: key);

  @override
  _Sem1State createState() => _Sem1State();
}

class _Sem1State extends State<Sem1> {
  final List<Course> courses = [
    Course(courseName: 'Thermal Engineering',
        ppt: [
      Ppts(pptTitle: 'Presentation 1', link: 'https://www.africau.edu/images/default/sample.pdf'),
      Ppts(pptTitle: 'Presentation 2', link: 'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf'),
      Ppts(pptTitle: 'Presentation 3', link: 'http://www.pdf995.com/samples/pdf.pdf'),
      Ppts(pptTitle: 'Presentation 4', link: 'https://ppt1'),
      Ppts(pptTitle: 'Presentation 5', link: 'https://ppt1'),
    ],
        qps: [
          Qps(qpName: 'Question Paper 1', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 2', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 3', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 4', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 5', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 6', qpLink: 'https://qp1'),
        ]),

    Course(courseName: 'Supply chain Management',
        ppt: [
          Ppts(pptTitle: 'Presentation 1', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 2', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 3', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 4', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 5', link: 'https://ppt1'),
        ],
        qps: [
          Qps(qpName: 'Question Paper 1', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 2', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 3', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 4', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 5', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 6', qpLink: 'https://qp1'),
        ]),

    Course(courseName: 'Material Science',
        ppt: [
          Ppts(pptTitle: 'Presentation 1', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 2', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 3', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 4', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 5', link: 'https://ppt1'),
        ],
        qps: [
          Qps(qpName: 'Question Paper 1', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 2', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 3', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 4', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 5', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 6', qpLink: 'https://qp1'),
        ]),

    Course(courseName: 'Solid Mechanics',
        ppt: [
          Ppts(pptTitle: 'Presentation 1', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 2', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 3', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 4', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 5', link: 'https://ppt1'),
        ],
        qps: [
          Qps(qpName: 'Question Paper 1', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 2', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 3', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 4', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 5', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 6', qpLink: 'https://qp1'),
        ]),

    Course(courseName: 'Fluid Mechanics',
        ppt: [
          Ppts(pptTitle: 'Presentation 1', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 2', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 3', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 4', link: 'https://ppt1'),
          Ppts(pptTitle: 'Presentation 5', link: 'https://ppt1'),
        ],
        qps: [
          Qps(qpName: 'Question Paper 1', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 2', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 3', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 4', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 5', qpLink: 'https://qp1'),
          Qps(qpName: 'Question Paper 6', qpLink: 'https://qp1'),
        ])






  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appName),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course=courses[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    child: Icon(Icons.ac_unit_rounded),
                  ),
                  title: Text(course.courseName),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoursePage(course: course),//from final course=corses[index];
                    ));
                  },
                ),
              );
            }));
  }
}
