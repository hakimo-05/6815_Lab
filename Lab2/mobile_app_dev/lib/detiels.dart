import 'package:flutter/material.dart';

import 'edite.dart';
import 'home.dart';

class Detiels extends StatelessWidget {
  const Detiels({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text("Detiels",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton( onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home())); }, icon: Icon(Icons.home,size: 30,),),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Edite()));},
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(child: Text('Edit',style: TextStyle(fontSize: 30),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
