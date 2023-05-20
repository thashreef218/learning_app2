import 'package:flutter/material.dart';
import 'package:learning_app2/constants.dart';
import 'package:learning_app2/sem/sem1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App name',
      home: Builder(builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;

        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  color: kBlueLightColor,
                ),
              ),
              SafeArea(

                child: Container(
                  margin:EdgeInsets.only(top:size.height * 0.25),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              children: [
                                Semester(
                                  semesterNum: 1,
                                  press: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){

                                      return Sem1();
                                    }),
                                    );
                                  },
                                ),
                                Semester(
                                  semesterNum: 2,
                                  press: () {},
                                ),
                                Semester(
                                  semesterNum: 3,
                                  press: () {},
                                ),
                                Semester(
                                  semesterNum: 4,
                                  press: () {},
                                ),
                                Semester(
                                  semesterNum: 5,
                                  press: () {},
                                ),
                                Semester(
                                  semesterNum: 6,
                                  press: () {},
                                ),
                                Semester(
                                  semesterNum: 7,
                                  press: () {},
                                ),
                                Semester(
                                  semesterNum: 8,
                                  press: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class Semester extends StatelessWidget {
  final int semesterNum;

  final  Function() press;

  const Semester({
    Key? key,
    required this.press,
    required this.semesterNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          margin: EdgeInsets.all(10),
          width: constraint.maxWidth / 2 - 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment:Alignment.center ,
                  child: Text(
                    "SEMESTER $semesterNum",
                    // style:Theme.of(context).textTheme.subtitle,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
