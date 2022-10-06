class task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? Color;
  int? remind;
  String? repeat;

  task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.Color,
    this.remind,
    this.repeat,
  });

  Map<String, dynamic> tojson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.note;
    data['isCompleted'] = this.isCompleted;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['Color'] = this.Color;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;

    return data;
  }

  task.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    Color = json['Color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }
}
