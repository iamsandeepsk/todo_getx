class TodoModel {
  final String title;
  final String subTitle;
  final int id;

  

  TodoModel({required this.title, required this.subTitle, required this.id});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json["title"],
      subTitle: json["subTitle"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = title;
    map['subTitle'] = subTitle;
    map['id'] = id;
    return map;
  }
}
