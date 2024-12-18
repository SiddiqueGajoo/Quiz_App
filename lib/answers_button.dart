import 'package:flutter/material.dart';
class AnswersButton extends StatelessWidget {
  const AnswersButton({super.key,required this.answerText, required this.onTap()});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(onPressed: onTap,style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
      ), child:  Text(answerText,textAlign: TextAlign.center,)),
    );;
  }
}

