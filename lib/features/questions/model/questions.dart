class Question {
  final int? id, answer;
  final String? question;
  final String? number;
  final List<String>? options;
  final List<int>? poll;
  Question(
      {this.id,
      this.question,
      this.answer,
      this.number,
      this.options,
      this.poll});
}
