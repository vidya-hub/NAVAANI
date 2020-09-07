// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hideden_drawer_flutter/LoginPage.dart';
// import 'package:hideden_drawer_flutter/main.dart';

// class UserManagement {
//   Widget handleAuth() {
//     print('hiii');

//     return StreamBuilder(
//       stream: FirebaseAuth.instance.onAuthStateChanged,
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           return HomePage();
//         }
//         return LoginPage();
//       },
//     );
//   }

//   signOut(BuildContext context) {
//     FirebaseAuth.instance.signOut();
//   }
// }
