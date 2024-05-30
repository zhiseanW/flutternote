class Todo {
  final int? id;
  final String title, desc;

  static String name = "todos";

  Todo({this.id, required this.title, required this.desc});

  Map<String, dynamic> toMap() {
    return {"title": title, "desc": desc};
  }

  @override
  String toString() {
    return "Todo($id, $title, $desc)";
  }

  Todo copy({int? id, String? title, String? desc}) {
    return Todo(
        id: id ?? this.id, title: title ?? this.title, desc: desc ?? this.desc);
  }

  static Todo fromMap(Map<String, dynamic> map) {
    return Todo(id: map["id"], title: map["title"], desc: map["desc"]);
  }
}
