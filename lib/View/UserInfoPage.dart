import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Components/CustomListtile.dart';
import 'package:movie_app/Components/CustomNavBar.dart';
import 'package:movie_app/Components/custombtn.dart';
import 'package:movie_app/LoginView/loginPage.dart';

import 'CategoryPage.dart';
import 'HomePage.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: const Image(
                  image: AssetImage('assets/images/moviewheel.png'))),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: const Image(
                  image: AssetImage('assets/images/sloganmovie.png'))),
          const SizedBox(
            height: 10,
          ),
          CustomList(
              icon: const Icon(
                Icons.key,
                color: Colors.black,
              ),
              value: 'UID',
              subvalue: '${auth.currentUser?.uid.toString()}'),
          CustomList(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              value: 'Username',
              subvalue: '${auth.currentUser?.displayName.toString()}'),
          CustomList(
              icon: const Icon(
                Icons.email,
                color: Colors.black,
              ),
              value: 'Email',
              subvalue: '${auth.currentUser?.email.toString()}'),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.08),
            child: CustomBtn(
              title: 'Log Out',
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
        tap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(),
              ));
        },
        onchaged: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserInfoPage(),
              ));
        },
      ),
    );
  }
}
