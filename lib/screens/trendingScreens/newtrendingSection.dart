import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/const.dart';

class NewListScreen extends StatefulWidget {
  const NewListScreen({Key? key}) : super(key: key);

  @override
  _NewListScreenState createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
  List<String> NewListTitle = [
    'Top Heart Yoga',
    'Top Meditation',
    'Best Yoga at home',
    'Top Yoga',
    'Top Heart Yoga',
    'Top Meditation',
    'Best Yoga at home',
    'Top Yoga',
  ];
  List<String> NewListViews = [
    '5k',
    '4k',
    '3k',
    '2k',
    '1k',
    '1k',
    '1k',
    '1k',
  ];
  List<String> NewListTime = [
    '15 min ago',
    '25 min ago',
    '35 min ago',
    '45 min ago',
    '55 min ago',
    '65 min ago',
    '75 min ago',
    '85 min ago',

  ];
  List<String> NewImage = [
    'assets/images/yoga_1.png',
    'assets/images/yoga_1.png',
    'assets/images/yoga_1.png',
    'assets/images/yoga_1.png',
    'assets/images/yoga_1.png',
    'assets/images/yoga_1.png',
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: NewListTitle.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: appPadding/2,top: appPadding/3,bottom: appPadding/3),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            width: size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.only(left: appPadding/2,top: appPadding / 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    NewListTitle[index].toString(),//exercise.name,
                                    style: TextStyle(
                                      fontWeight: WORKOUTS_WEIGHT,
                                      color: Colors.black,
                                      fontSize: SUBCATEGORY_EXERCISE_NAME,
                                    ),
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.remove_red_eye_sharp,size: 14,color: Donebutton.withOpacity(0.7),),
                                      Text(NewListViews[index].toString(),style: TextStyle(color: Donebutton.withOpacity(0.7),fontSize: 14),),
                                      SizedBox(
                                        width: size.width * 0.03,
                                      ),
                                      Icon(Icons.timer,size: 14,color: Donebutton.withOpacity(0.7),),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Text(NewListTime[index].toString(),style: TextStyle(color: Donebutton.withOpacity(0.7),fontSize: 14),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            width: size.width * 0.17,
                            height: size.height * 0.085,
                            decoration: BoxDecoration(
                              color: PlayButtonColor,
                              borderRadius: BorderRadius.circular(PLAY_BUTTON_RADIUS),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(TOP_WORKOUT_IMAGE_RADIUS),
                              //   child:  Icon(Icons.play_arrow_outlined,size: VIDEO_ICON_SIZE,color: Donebutton,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
