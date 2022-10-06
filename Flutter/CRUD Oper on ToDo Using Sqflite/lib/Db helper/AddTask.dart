import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/Homepage.dart';
import 'package:to_do/InputField.dart';
import 'package:to_do/Themes.dart';
import 'package:to_do/task.dart';
import 'package:to_do/taskController.dart';

import 'Themes.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = "10:20";
  int remindme = 5;
  List<int> remindlist = [5, 10, 15, 20];
  String Repeat = "None";
  List<String> repeatlist = ["None", "Daily", "Weekly", "Monthly"];
  int selectedindex = 0;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final taskController _taskController = Get.put(taskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Appbar(),
      body: Container(
        margin: EdgeInsets.only(top: 10, right: 20, left: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Add Task",
              style: HeadingStyle,
            ),
            InputField(
              title: "Title",
              hint: "Enter task title",
              controller: titleController,
            ),
            InputField(
              title: "Note",
              hint: "Enter your note",
              controller: noteController,
            ),
            InputField(
              title: "Date",
              hint: DateFormat.yMd().format(selectedDate),
              widget: IconButton(
                onPressed: () {
                  getDatefromUser();
                },
                icon: Icon(Icons.calendar_today_outlined),
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InputField(
                      title: "Start Time",
                      hint: startTime,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          getTimeFromUser(true);
                        },
                      )),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: InputField(
                      title: "End Time",
                      hint: endTime,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          getTimeFromUser(false);
                        },
                      )),
                ),
              ],
            ),
            InputField(
                title: "Remind",
                hint: "$remindme five minutes early",
                widget: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(
                    height: 0,
                  ),
                  style: subHeadingStyle,
                  items: remindlist.map<DropdownMenuItem<String>>(
                    (int value) {
                      return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()));
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      remindme = int.parse(value!);
                    });
                  },
                )),
            InputField(
                title: "Repeat",
                hint: Repeat,
                widget: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(
                    height: 0,
                  ),
                  style: subHeadingStyle,
                  items: repeatlist.map<DropdownMenuItem<String>>(
                    (String? value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value!,
                              style: TextStyle(
                                color: Colors.grey,
                              )));
                    },
                  ).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      Repeat = newvalue!;
                    });
                  },
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      Text(
                        "Color",
                        style: InputFieldStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Wrap(
                          children: List<Widget>.generate(3, (int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: CircleAvatar(
                              child: index == selectedindex
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Container(),
                              radius: 14,
                              backgroundColor: index == 0
                                  ? Color(0xFF4e5ae8)
                                  : index == 1
                                      ? Colors.pink
                                      : Colors.yellow,
                            ),
                          ),
                        );
                      }))
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () => _validateData(),
                    child: Container(
                      width: 120,
                      height: 40,
                      child: Center(
                          child: Text(
                        "Create Task",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bluish,
                      ),
                    ),
                  ),
                ])
          ]),
        ),
      ),
    );
  }

  _Appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: bluish,
      leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios, size: 25),
          onTap: () {
            Get.back();
          }),
      actions: [
        Icon(Icons.person, size: 25),
      ],
    );
  }

  getDatefromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );
    if (_pickerDate != null) {
      setState(() {
        selecteddate = _pickerDate;
      });
    }
  }

  getTimeFromUser(bool isStartTime) async {
    var pickedtime = await _showtimepicker();
    String formatedTime = pickedtime.format(context);
    if (pickedtime == null) {
      print("Time cancelled");
    } else if (isStartTime == true) {
      setState(() {
        startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        endTime = formatedTime;
      });
    }
  }

  _showtimepicker() async {
    return showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay(
            hour: int.parse(startTime.split(":")[0]),
            minute: int.parse(startTime.split(":")[1].split(" ")[0])));
  }

  _validateData() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are Required",
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.pink,
        icon: Icon(
          Icons.warning_amber_rounded,
          color: Colors.pink,
        ),
      );
    }
  }

  _addTaskToDb() async {
    int? value = await _taskController.addTask(
        Task: task(
      title: titleController.text,
      note: noteController.text,
      isCompleted: 0,
      date: DateFormat.yMd().format(selectedDate),
      startTime: startTime,
      endTime: endTime,
      Color: 1,
      remind: remindme,
      repeat: Repeat,
    ));

  }
}
