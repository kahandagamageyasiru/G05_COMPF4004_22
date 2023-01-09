import 'package:flutter/material.dart';
import 'package:flutter_application_8/utill/coffee_tile.dart';
import 'package:flutter_application_8/utill/excercisetyp.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List excercisetyp = [
    [
      'Bridge',
      true,
    ],
    [
      'Bicycle crunch',
      false,
    ],
    [
      'Side-lying hip abduction',
      false,
    ],
    [
      'Stationary lunge',
      false,
    ],
    [
      'Knee pushup',
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
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
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
          'Excercises For Beginners',
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
              CoffeTile(
                excerciseImagePath: 'lib/images/Knee pushup.gif',
                excerciseName: 'Knee pushup',
                excerciseDescription:
                    'From is you can get chest, shoulders and arms a quality workout',
                excerciseTime: '10 times',
              ),
              CoffeTile(
                excerciseImagePath: 'lib/images/Bicycle crunch.gif',
                excerciseName: 'Bicycle crunch',
                excerciseDescription:
                    'It helps you to engage a wide range of muscle groups.',
                excerciseTime: '120 seconds',
              ),
              CoffeTile(
                excerciseImagePath: 'lib/images/Side-lying hip abduction.gif',
                excerciseName: 'lying hip abduction',
                excerciseDescription:
                    'Helps the hips and knee area of your body.',
                excerciseTime: '20 times',
              ),
              CoffeTile(
                excerciseImagePath: 'lib/images/Bridge.gif',
                excerciseName: 'Bridge',
                excerciseDescription:
                    'A bridge exercise isolates and strengthens your gluteus (butt) muscles.',
                excerciseTime: '20 times',
              ),
              CoffeTile(
                excerciseImagePath: 'lib/images/Stationary lunge.gif',
                excerciseName: 'Stationary lunge',
                excerciseDescription:
                    'Stationary lunges target your glutes, quadriceps, and hamstrings.',
                excerciseTime: '20 times',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
