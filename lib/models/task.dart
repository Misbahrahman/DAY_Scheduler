class Task {

  Task({this.label, this.checked = false});

  final String? label;
  bool checked;

  void changeChecked() {
    checked = !checked;
  }
}