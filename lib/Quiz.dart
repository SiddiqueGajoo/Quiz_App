import 'package:flutter/material.dart';
import 'package:pracrice/questions_screen.dart';
import 'package:pracrice/result_screen.dart';
import 'package:pracrice/start_screen.dart';

import 'data/questions.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';
  // one Way to change the screen
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = 'Question-screen';
  // }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Question-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'Question-screen';
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Another Way to change the screen
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'Question-screen'){
      screenWidget = Questions(onSelectAnswer: chooseAnswer,);
    }
    if (activeScreen == 'result-screen'){
      screenWidget = ResultScreen(chosenAnswer: selectedAnswers,
          onRestart: restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 82, 12, 134),
                    Color.fromARGB(255, 118, 15, 194),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: screenWidget
            // another way
            // activeScreen == 'start_screen'
            //  ? StartScreen(switchScreen)
            //  : const Questions(),
          )),
    );
  }
}
