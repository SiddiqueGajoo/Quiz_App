

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pracrice/questions_summary.dart';

import 'data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,
    required this.chosenAnswer,
    required this.onRestart,});

  final void Function()onRestart;
  final List<String> chosenAnswer;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions Correct',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 239, 225, 246),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              label: Text('Restart Quiz',
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 239, 225, 246),
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
