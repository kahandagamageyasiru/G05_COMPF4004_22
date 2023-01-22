import 'package:flutter/material.dart';
import 'package:flutter_application_11/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexx = 0;
  List category = ['All', 'Lunch', 'Dinner', 'Breackfast'];
  List categoryname = ['dinner', 'lunch', 'dinner', 'fast'];
  List food = [
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pizza', 'steak', 'pasta', 'burger'],
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pancake', 'egg', 'banana', 'egg'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'Popular catehory',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'ro',
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                indexx = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: index == 0 ? 4 : 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: indexx == index
                                    ? Colors.amber
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: indexx == index
                                        ? Colors.amber
                                        : Colors.transparent,
                                    offset: indexx == index
                                        ? Offset(1, 1)
                                        : Offset(0, 0),
                                    blurRadius: indexx == index ? 7 : 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17),
                                  child: Text(
                                    category[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: indexx == index
                                          ? Colors.black
                                          : Colors.black,
                                      fontFamily: 'ro',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'ro',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => Recipe()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Icon(Icons.favorite_border)],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/${categoryname[indexx]}${index}.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            food[indexx][index],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'ro',
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '100 min',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'ro',
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.black, size: 15),
                                  Text(
                                    '4.2',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: 'ro',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: 4,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 270,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
