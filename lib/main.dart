import 'package:flutter/material.dart';
import 'package:login_page/generated/sign_up.dart';
import 'package:login_page/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login': (context) => const  Mylogin()},
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           //title: Text('Background Image Example'),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/image.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Center(
//             // child: Text('Hello World'),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class Main_page extends StatefulWidget {
//   const Main_page({super.key});
//
//   @override
//   State<Main_page> createState() => _Main_pageState();
// }
//
// class _Main_pageState extends State<Main_page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }

