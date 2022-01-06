import 'package:flutter/material.dart';
import 'package:untitled3/main.dart';

void main()
{
  runApp(MaterialApp(
    home: Profile(),
    theme: ThemeData(
      fontFamily: 'Ubuntu',
    ),
  ));
}

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          child: ListView(
            children: [
              Container(
                child: Text("Create New Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
              )

            ],
          ),
        ),
      ),
    );
  }
}