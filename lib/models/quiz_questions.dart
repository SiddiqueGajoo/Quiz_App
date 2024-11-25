class QuizQuestion {
  const QuizQuestion(this.text,this.answers);
  final String text;
  final List <String> answers;
  List <String> getShuffledAnswers(){
    final shuffledList = List.of(answers);
    //of method gives the copy of original list and shuffle method shuffle the order of the answers
    shuffledList.shuffle();
    return shuffledList;
  }
}