import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Pagina Usuário"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/registrationUserPage');
            },
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
