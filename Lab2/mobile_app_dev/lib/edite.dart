import 'package:flutter/material.dart';

import 'home.dart';

class Edite extends StatelessWidget {
  const Edite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text("Edit",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton( onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home())); }, icon: Icon(Icons.home,size: 30,),),
          )
        ],
      ),
    );
  }
}
