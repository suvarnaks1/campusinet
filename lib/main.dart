import 'package:campusconnection/RoleSelectionScreen.dart';
import 'package:campusconnection/students/CustomAnimatedBottomBar.dart';
import 'package:campusconnection/students/student_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // ബ്ലാക്ക് ബാക്ക്ഗ്രൗണ്ട്
        primaryColor: const Color(0xFF1B2A4E), // ഡാർക്ക് ബ്ലൂ
        fontFamily: 'Roboto',
      ),
      home:CustomAnimatedBottomBar(
        selectedIndex: 0,
        onItemSelected: (index) {},
      ),
    );
  }
}



