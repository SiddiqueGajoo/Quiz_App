import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'answers_button.dart';
import 'data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState() {
    return _QuestionState();
  }
}
class _QuestionState extends State<Questions> {


  var currentQuestionIndex = 0;

  void getQuestions(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex ++;
    });
  }
  @override
  Widget build( context) {
    final currentQuestion = questions[currentQuestionIndex];
    return  Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 17,
                fontWeight: FontWeight.bold
            ),textAlign: TextAlign.center,),const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((item){
              return AnswersButton(answerText: item, onTap:(){
                getQuestions(item);
              } );
            }
            )
          ],
        ),
      ),
    );
  }
}
