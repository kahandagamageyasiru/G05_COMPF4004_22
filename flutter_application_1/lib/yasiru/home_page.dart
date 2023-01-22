import 'package:flutter/material.dart';
import 'package:flutter_application_1/yasiru/utill/excercise_tile.dart';
import 'package:flutter_application_1/yasiru/utill/excercisetyp.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List excercisetyp = [
    [
      'bent-knee triceps dips',
      true,
    ],
    [
      'jumping jacks',
      false,
    ],
    [
      'lateral lunges',
      false,
    ],
    [
      'Pushup',
      false,
    ],
    [
      'Knee pushup',
      false,
    ],
    [
      'running in place with high knees',
      false,
    ],
    [
      'Russian Twist',
      false,
    ],
    [
      'secondplank',
      false,
    ],
    [
      'squats',
      false,
    ],
    [
      'squats',
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
                excerciseImagePath: 'lib/images/Pushup.gif',
                excerciseName: 'Pushup',
                excerciseDescription:
                    'You can start with 20 push-ups, but do not stick to this number. It is important to keep increasing the number to challenge your body.',
                excerciseTime: '20-100times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'lib/images/secondplank.gif',
                excerciseName: 'secondplank',
                excerciseDescription:
                    'This strengthens your back, chest, shoulders, neck, and abs',
                excerciseTime: '2mins',
              ),
              ExcerciseTile(
                excerciseImagePath: 'lib/images/bent-knee triceps dips.gif',
                excerciseName: 'bent-knee triceps dips',
                excerciseDescription:
                    'tricep dips best ways to tone and tighten the back of the upper arms.',
                excerciseTime: '30 times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'lib/images/jumpingjacks.gif',
                excerciseName: 'jumping jacks',
                excerciseDescription:
                    'It helps you to Jumping helps to build bone strength over time. ',
                excerciseTime: '120 seconds',
              ),
              ExcerciseTile(
                excerciseImagePath: 'lib/images/lateral lunges.gif',
                excerciseName: 'lateral lunges',
                excerciseDescription:
                    'lateral lunges, are a type of bodyweight exercise.',
                excerciseTime: '20 times',
              ),
              ExcerciseTile(
                excerciseImagePath:
                    'lib/images/running in place with high knees.gif',
                excerciseName: 'running in place with high knees',
                excerciseDescription:
                    'improves cardiovascular endurance, burns calories.',
                excerciseTime: '2mins',
              ),
              ExcerciseTile(
                excerciseImagePath: 'lib/images/Russian Twist.gif',
                excerciseName: 'Russian Twist',
                excerciseDescription:
                    'The Russian twist is an effective way to build your core and shoulders.',
                excerciseTime: '40 times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'lib/images/squats.gif',
                excerciseName: 'squats',
                excerciseDescription:
                    'Squats burn calories and might help you lose weight.',
                excerciseTime: '50 times',
              ),
              ExcerciseTile(
                excerciseImagePath: 'lib/images/WalkingLungs.gif',
                excerciseName: 'WalkingLungs',
                excerciseDescription:
                    'Walking lunges strengthen the leg muscles.',
                excerciseTime: '80 times',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
