
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //initialize firebase App

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height:270,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/background.png'),fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left:30,
                    width: 50,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/light-1.png')
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 40,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/light-2.png')
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 20,
                    width: 80,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('images/clock.png')
                          )
                      ),
                    ),
                  ),


                       Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Center(
                          child: Text("Talkr",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                    ),

                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .3),
                            blurRadius: 20.0,
                            offset: Offset(0,10)
                          )
                        ]                      ),
                      child: Column(
                        children: [
                          Container(
                            //padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              //border: Border(bottom: BorderSide(color: Colors.grey[100]))
                            ),

                            height: 70,
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email or Username',
                                hintStyle: TextStyle(color: Colors.grey[600])
                              ),
                            ),
                          ),
                          Container(
                            //padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey[600])
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(

                      margin: EdgeInsets.symmetric(vertical: 30),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 10),
                            Color.fromRGBO(143, 148, 251, 2),
                          ]
                        )
                      ),
                      child: Container(


                        child: RawMaterialButton(
                          fillColor: Colors.blue,
                          //fillColor: const Color(0xFF0069FE),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: () async {
                            User? user = await loginUsingEmailPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context);
                            print(user);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => ProfileScreen()));
                            }
                          },
                          child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Forgot Password ?',
                    ),
                  ],
                ),
            ),
          ]
        ),
      ),

    ); 
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}