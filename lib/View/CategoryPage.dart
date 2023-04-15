import 'package:flutter/material.dart';
import 'package:movie_app/ApiServices/ApiServices.dart';
import 'package:movie_app/Model/MoviesModel.dart';
import 'package:movie_app/View/MovieDetailPage.dart';
import '../Components/CustomNavBar.dart';
import 'HomePage.dart';
import 'UserInfoPage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  ApiServices services = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  'Discover',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: services.fetchdata(),
              builder: (context, AsyncSnapshot<MoviesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.tvShows!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MovieDetail(
                                    image: snapshot.data!.tvShows![index]
                                        .imageThumbnailPath
                                        .toString(),
                                    name: snapshot.data!.tvShows![index].name
                                        .toString(),
                                    network: snapshot
                                        .data!.tvShows![index].network
                                        .toString(),
                                    permalink: snapshot
                                        .data!.tvShows![index].permalink
                                        .toString(),
                                    country: snapshot
                                        .data!.tvShows![index].country
                                        .toString());
                              },
                            ));
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: NetworkImage(snapshot
                                      .data!.tvShows![index].imageThumbnailPath
                                      .toString()),
                                  height: 70,
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Category',
                                style: TextStyle(fontSize: 22),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      );
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
