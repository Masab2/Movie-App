import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  String image, name, network, permalink, country;

  MovieDetail({
    Key? key,
    required this.image,
    required this.name,
    required this.network,
    required this.permalink,
    required this.country,
  }) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.4,
                child: Image(
                  image: NetworkImage(widget.image.toString()),
                  height: 550,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Text(
            'Description',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Name : ',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Network : ',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Permalink :  ',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Country : ',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.network.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.permalink.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.country.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
