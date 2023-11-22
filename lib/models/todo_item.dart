class TodoItem {
  String title;
  bool completed;

  TodoItem(this.title, this.completed);

  void setTitle(String newTitle) => title = newTitle;
  void setCompleted(bool? val) => completed = val ?? true;
}
