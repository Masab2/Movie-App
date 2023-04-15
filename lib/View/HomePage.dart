import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ApiServices/ApiServices.dart';
import 'package:movie_app/Components/custombtn.dart';
import 'package:movie_app/LoginView/loginPage.dart';
import 'package:movie_app/Model/MoviesModel.dart';
import 'package:movie_app/utils/Toast.dart';
import '../Components/CustomNavBar.dart';
import 'CategoryPage.dart';
import 'UserInfoPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  ApiServices services = ApiServices();
  final searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello ${auth.currentUser?.displayName.toString()}",
                      style: const TextStyle(fontSize: 27),
                    ),
                    SizedBox(height: 2,),
                    const Text(
                      "What to watch ?",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserInfoPage(),
                          ));
                    },
                    child: const CircleAvatar(
                      maxRadius: 29.0,
                      child: Image(
                        image: AssetImage('assets/images/moviewheel.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03,
                left: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01,
                right: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01,
                bottom: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01),
            child: TextFormField(
              controller: searchcontroller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: services.fetchdata(),
              builder: (context, AsyncSnapshot<MoviesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data!.tvShows!.length,
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2 / 3.8,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      String moviename = snapshot.data!.tvShows![index].name
                          .toString();
                      if (searchcontroller.text.isEmpty) {
                        return Container(
                          width: 200,
                          height: 200,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Color(0xff292B37),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff292B37).withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 6)
                              ]),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Image(
                                        image: NetworkImage(snapshot.data!
                                            .tvShows![index].imageThumbnailPath
                                            .toString()),
                                        height: 250,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  0.01,
                                            ),
                                            child: Text(
                                              snapshot.data!.tvShows![index]
                                                  .name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  0.01,
                                            ),
                                            child: Text(
                                                snapshot
                                                    .data!.tvShows![index]
                                                    .network
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (moviename.toLowerCase().contains(
                          searchcontroller.text.toLowerCase())) {
                        return Container(
                          width: 200,
                          height: 200,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Color(0xff292B37),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff292B37).withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 6)
                              ]),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Image(
                                        image: NetworkImage(snapshot.data!
                                            .tvShows![index].imageThumbnailPath
                                            .toString()),
                                        height: 250,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  0.01,
                                            ),
                                            child: Text(
                                              snapshot.data!.tvShows![index]
                                                  .name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  0.01,
                                            ),
                                            child: Text(
                                                snapshot
                                                    .data!.tvShows![index]
                                                    .network
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w500)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ),
          )
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
              context, MaterialPageRoute(builder: (context) => UserInfoPage()));
        },
      ),
    );
  }
}
