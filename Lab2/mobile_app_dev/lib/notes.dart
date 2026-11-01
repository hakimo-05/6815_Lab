import 'package:flutter/material.dart';

import 'detiels.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text("Notes",style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Detiels()));},
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(child: Text('Details',style: TextStyle(fontSize: 30),)),
              ),
            ),
          )
          ],
      ),
    );
  }
}
