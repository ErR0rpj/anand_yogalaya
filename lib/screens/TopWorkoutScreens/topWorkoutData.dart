
import 'package:anand_yogalaya/screens/TopWorkoutScreens/workout.dart';
import 'package:anand_yogalaya/utils/const.dart';


final _workout1 = Workout(
    imageUrl: 'assets/images/yoga_1.png',
    name: 'Aasaans',
    time: 45,
    exercises: '45 Exercises',
    color: primary
);

final _workout2 = Workout(
    imageUrl: 'assets/images/yoga_2.png',
    name: 'Daily Yoga',
    time: 30,
    exercises: '30 Exercises',
    color: kPrimaryRed
);

final _workout3 = Workout(
    imageUrl: 'assets/images/yoga_3.png',
    name: 'Meditation',
    time: 20,
    exercises: '20 Exercises',
    color: kPrimaryPurple
);

final List<Workout> workouts = [_workout1,_workout3,_workout2];
