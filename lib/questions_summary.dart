import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: data['user_answer'] == data['correct_answer']? Colors.cyan:
                    Color.fromARGB(255, 242, 31, 248),
                    child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 239, 225, 246),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),)
                  ,const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (data['question'] as String),
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          (data['user_answer'] as String),
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 195, 140, 232),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text((data['correct_answer'] as String),
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 124, 140, 241),
                              fontWeight: FontWeight.bold
                            )),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
