class CacheData {
  static int questionLevel = 0;

  void setQuestionLevel(int? level) {
    questionLevel = level!;
  }

  int getQuestionLevel() {
    return questionLevel;
  }
}
