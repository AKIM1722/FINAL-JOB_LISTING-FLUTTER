import 'package:flutter/material.dart';
import 'package:job_listing/home_page.dart';
import 'package:job_listing/profile_page.dart';
import 'package:job_listing/jobs_page.dart';

void main() => runApp(JobNavigatorApp());

class JobNavigatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/jobs': (context) => JobsPage(),
      },
    );
  }
}
