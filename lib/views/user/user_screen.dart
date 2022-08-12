import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("User Screen"),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(height: 40, width: 200, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
