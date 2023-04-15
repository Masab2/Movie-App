import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/Components/custombtn.dart';
import 'package:movie_app/LoginView/loginPage.dart';
import 'package:movie_app/utils/Toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final _formfeild = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

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
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Create Your Account',
                style: TextStyle(
                    color: Color(0xff690B08),
                    fontSize: 25,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 30),
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
                      'Username',
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
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        fillColor: Color(0xff292C39),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter the username';
                        } else if (value.length <= 3) {
                          return 'your username must be 4 character long';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
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
                          return 'please enter the email';
                        } else if (!value.endsWith('.com')) {
                          return 'please enter the email in proper format';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
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
              title: 'Sign Up',
              ontap: () async {
                try {
                  if (_formfeild.currentState!.validate()) {
                    auth
                        .createUserWithEmailAndPassword(
                            email: emailcontroller.text.toString(),
                            password: passwordcontroller.text.toString())
                        .then((value) async {
                      final user = auth.currentUser;
                      final displayname = usernamecontroller.text.toString();
                      await user?.updateDisplayName(displayname);
                      CustomToast().toast('Account Created Successfully ');
                    }).onError((error, stackTrace) {
                      CustomToast().toast(error.toString());
                    });
                  }
                } on FirebaseAuthException catch (e) {
                  CustomToast().toast(e.message ?? 'An error occured');
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
              const Text("Already have an Account ?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: const Text('Login'))
            ],
          ),
        ],
      ),
    );
  }
}
