import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Components/custombtn.dart';
import 'package:movie_app/LoginView/signUpPage.dart';
import 'package:movie_app/View/HomePage.dart';
import 'package:movie_app/utils/Toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formfeild = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void Login() {
    auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then((value) {
      CustomToast().toast('Login Successfull');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    }).onError((error, stackTrace) {
      CustomToast().toast(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Row(
            children: const [
              SizedBox(
                  height: 80,
                  width: 250,
                  child:
                      Image(image: AssetImage('assets/images/sloganmovie.png')))
            ],
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Login Your Account',
                style: TextStyle(
                    color: Color(0xff690B08),
                    fontSize: 25,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Form(
              key: _formfeild,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.02),
                    child: const Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.02),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        fillColor: Color(0xff292C39),
                        filled: true,
                        prefixIcon: Icon(Icons.alternate_email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter the username';
                        } else if (value.length <= 3){
                          return 'your username must be 4 character long';
                        }else {
                          return null;
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.02),
                    child: const Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.02),
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Color(0xff292C39),
                        filled: true,
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter the password';
                        } else if (value.length <= 4) {
                          return 'password must be 5 character long';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.02),
            child: CustomBtn(
              title: 'Login',
              ontap: () {
                if (_formfeild.currentState!.validate()) {
                  Login();
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an Account ?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ));
                  },
                  child: const Text('Sign Up'))
            ],
          ),
        ],
      ),
    );
  }
}
