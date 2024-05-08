class TaskDescription {
  String title, datetime;
  TaskDescription({required this.title, required this.datetime});

  TaskDescription.fromJson(Map<String, dynamic> json)
  : title = json['title'],
    datetime = json['datetime'];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "datetime": datetime,
    };
  }
}
