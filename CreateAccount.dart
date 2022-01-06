import "package:flutter/material.dart"

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
              padding: EdgeInsets.all(0),
              child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 40),
                      child: Text("Create New Account",style: TextStyle(fontSize: 30,fontFamily: 'SecularOne',fontWeight: FontWeight.bold),),),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                      child: TextField(
                        decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder(), icon: Icon(Icons.lock),),),),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                      child: TextField(
                        decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(), icon: Icon(Icons.mail),),),),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                      child: TextField(decoration: InputDecoration(labelText: "Contact No", border: OutlineInputBorder(), icon: Icon(Icons.phone),),),),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                      child: Text("GENDER",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
                    SizedBox(
                      child: IconButton(
                        color: Colors.deepPurple,
                        onPressed: (){},
                        icon: Icon(Icons.male,size: 30),
                      ),
                    ),
                  ]
              ),
          ),
      ),
    );
  }
}