import 'package:flutter/material.dart';

import 'notes.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Color> colorDrawer=[Colors.indigo, Colors.white];
  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontSize: 30),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo,
        leading: IconButton(onPressed: () { scaffoldKey.currentState!.openDrawer(); }, icon: Icon(Icons.menu,size: 30,),),
      ),
      drawer: Drawer(
        width: 200,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: colorDrawer,begin: AlignmentGeometry.topCenter,end:AlignmentGeometry.bottomEnd),
          ),
          child: Column(
            children: [
              SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> Notes())) ;},
                      child: Row(
                      children: [
                        Icon(Icons.circle,color: Colors.white,size: 10,),
                        SizedBox(width: 5,),
                        Text("Notes",style: TextStyle(color: Colors.white,fontSize: 25),),
                      ],
                    ),
                      style: ButtonStyle(
                       overlayColor: WidgetStatePropertyAll(Colors.grey.shade500),

                      ),
                    ),
                  ),
                ],
              ),
        ),
        ),
    );
  }
}
