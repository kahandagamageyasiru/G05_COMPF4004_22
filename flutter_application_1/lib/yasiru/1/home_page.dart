import 'package:flutter/material.dart';
import 'package:flutter_application_1/yasiru/1/utill/excercise_tile.dart';
import 'package:flutter_application_1/yasiru/utill/excercisetyp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/yasiru/2/home_page.dart';
import 'package:flutter_application_1/yasiru/home_page.dart';
import 'package:flutter_application_1/navidu/paymentgateway/social_sharing/social_sharing_member.dart';
import 'package:flutter_application_1/navidu/paymentgateway/subscription_screen.dart';


class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  final List excercisetyp = [
    [
      'bear crawl',
      true,
    ],
    [
      'Dead bug',
      false,
    ],
    [
      'diamond pushups',
      false,
    ],
    [
      'pullups',
      false,
    ],
    [
      'Reverse crunch',
      false,
    ],
  ];
  void excerciseTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < excercisetyp.length; i++) {
        excercisetyp[i][1] = false;
      }
      excercisetyp[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),

       drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'Beginner Workout',
                  style: TextStyle(color: Colors.white,
                   fontSize: 17, 
                   fontWeight: FontWeight.bold),
                  ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage2()),
                  );
                },
              ),
              ListTile(
                title: Text('Intermediate Workout',
                style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage3()),
                  );
                },
              ),
              ListTile(
                title: Text('Advance Workout',
                style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold
                ),),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage1()),
                  );
                },
              ),
              ListTile(
              title: Text('Member Social Sharing',
              style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagesListScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Subscription Plan',
              style: TextStyle(color: Colors.white, 
                fontSize: 17,
                fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionPage()),
                );
              },
            ),
            ],
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Success usually comes to those who are too busy to be looking for it.",
            style: GoogleFonts.bebasNeue(
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          'Excercises For Intermediates',
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            color: Colors.amber,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: excercisetyp.length,
            itemBuilder: (context, index) {
              return ExcerciseTyp(
                excerciseType: excercisetyp[index][0],
                isselected: excercisetyp[index][1],
                onTap: () {
                  excerciseTypeSelected(index);
                },
              );
            },
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ExcerciseTile(
                excerciseImagePath: 'assets/images/pullups.gif',
                excerciseName: 'pullups',
                excerciseDescription:
                    'pull-ups strengthen and sculpt your shoulders.',
                excerciseTime: '20-100times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/Reverse crunch.gif',
                excerciseName: 'Reverse crunch',
                excerciseDescription:
                    'The reverse crunch primarily works your rectus abdominis (your “six-pack”). The primary function of this muscle is to flex your trunk and spine.',
                excerciseTime: '2mins',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/diamond pushups.gif',
                excerciseName: 'diamond pushups',
                excerciseDescription:
                    'It can help you build muscle in your arms and prepare you for other exercises that use your triceps, like the close grip bench press or pull-up.',
                excerciseTime: '30 times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/Dead bug.gif',
                excerciseName: 'Dead bug',
                excerciseDescription:
                    'dead bug works a ton of muscles in your core, including your transverse abdominis , rectus abdominis',
                excerciseTime: '120 seconds',
              ),
              ExcerciseTile(
                excerciseImagePath: 'assets/images/bear crawl.gif',
                excerciseName: 'bear crawl',
                excerciseDescription:
                    'A Bear Crawl is a bodyweight mobility exercise.',
                excerciseTime: '120 seconds',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
