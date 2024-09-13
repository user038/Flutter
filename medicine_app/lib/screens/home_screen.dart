import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _gridItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7'
  ];

  int getWidthCategory(double width) {
    if (width > 1200) {
      return 5;
    } else if (width > 600) {
      return 3;
    } else {
      return 2;
    }
  }

  final List<String> imgList = [
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=10',
    'https://picsum.photos/250?image=11',
    'https://picsum.photos/250?image=12',
    'https://picsum.photos/250?image=13',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 89, 211, 160)),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 123, 175, 155),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                expandedHeight: 278,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Material(
                        elevation: 10,
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 8, 133, 112),
                                Color.fromARGB(255, 89, 211, 160)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    CircleAvatar(),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('Hi Joe \nGood Morning'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          //print(width);
                                        },
                                        icon: const Icon(Icons.directions,
                                            size: 30)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.notifications,
                                          size: 30,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 89, 211, 160)),
                        child: CarouselSlider(
                          items: imgList
                              .map((item) => Material(
                                elevation: 40,
                                borderRadius: const BorderRadius.all(Radius.circular(30)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      // border: Border(bottom: BorderSide(width: 10)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Image.network(item,
                                      fit: BoxFit.contain, width: 1000),
                                ),
                              ))
                              .toList(),
                          options: CarouselOptions(
                            height: 100,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 89, 211, 160)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.map((url) {
                            int index = imgList.indexOf(url);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Color.fromRGBO(0, 0, 0, 0.9)
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 89, 211, 160),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                toolbarHeight: 110,
                pinned: true,
                flexibleSpace: Container(
                  height: 120,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 123, 175, 155),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(32.0),
                    child: Container(),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 20),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getWidthCategory(width),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Card(
                        color: Colors.white,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(_gridItems[index]),
                        ),
                      );
                    },
                    childCount: _gridItems.length,
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
