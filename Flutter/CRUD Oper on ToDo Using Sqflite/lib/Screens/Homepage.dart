import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/AddTask.dart';
import 'package:to_do/TaskTile.dart';
import 'package:to_do/Themes.dart';
import 'package:to_do/done.dart';
import 'package:to_do/notification_services.dart';
import 'package:to_do/task.dart';
import 'package:to_do/taskController.dart';
import 'package:to_do/widgets/Button.dart';
import 'Pending_taskk.dart';
import 'ThemeServices.dart';
import 'Themes.dart';

DateTime selecteddate = DateTime.now();
var _taskController = Get.put(taskController());

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var notifyHelper;
  
  List<Widget> names=[
    
    Text("All",style: TextStyle(fontSize: 15,color: Colors.white),),
    Text("Completed",style: TextStyle(fontSize: 15,color: Colors.white),),
    Text("Pending",style: TextStyle(fontSize: 15,color: Colors.white),),
  ];
  @override
  void initState() {
    super.initState();

    notifyHelper = NotifiyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         bottomNavigationBar:CurvedNavigationBar(
          height: 60,
       
          color: bluish,
    buttonBackgroundColor:Colors.transparent,
    backgroundColor: Colors.transparent,
          items: names,
          onTap: (index){
              if(index==1){
                setState(() {
                Get.to(done());
              });
              }
               if(index==2){
                setState(() {
                Get.to(Pending_taskk());
              });
              }
          },
          ),
       
        appBar: _Appbar(),
        body: Column(
          children: [
            _addTaskBar(),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: bluish,
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                monthTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                dayTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                onDateChange: (date) {
                  setState(() {
                    selecteddate = date;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Obx(() {
              return ListView.builder(
                itemCount: _taskController.tasklist.length,
                itemBuilder: (_, index) {
                  task taskk = _taskController.tasklist[index];
                  if (taskk.repeat=='Daily') {
                    DateTime date =
                        DateFormat.jm().parse(taskk.startTime.toString());
                    var myTime = DateFormat("HH:mm").format(date);
                    notifyHelper.scheduledNotification(
                        int.parse(myTime.toString().split(":")[0]),
                        int.parse(myTime.toString().split(":")[1]),
                        taskk);
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showBottomSheet(
                                        context, _taskController.tasklist[index]);
                                  },
                                  child:
                                      TaskTile(_taskController.tasklist[index]),
                                )
                              ],
                            ),
                          ),
                        ));
                  }
                  if (taskk.date == DateFormat.yMd().format(selecteddate)) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showBottomSheet(
                                        context, _taskController.tasklist[index]);
                                  },
                                  child:
                                      TaskTile(_taskController.tasklist[index]),
                                )
                              ],
                            ),
                          ),
                        ));
                  } else {
                    return Container();
                  }
                },
              );
            })
            ),
          ],
        ),
      ),
    );
  }

  _Appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor:bluish,
      leading: GestureDetector(
        child: Icon(
           
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 25),
        onTap: () {
          ThemeServices().SwitchTheme();
        },
      ),
      actions: [
        Icon(Icons.person, size: 25),
      ],
    );
  }
}

_showBottomSheet(BuildContext context, task taskk) {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.only(top: 4),
      height: taskk.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? Colors.black : Colors.white,
      child: Column(
        children: [
          Spacer(),
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          taskk.isCompleted == 1
              ? Container()
              : _BottomSheetButton(
                  label: "Task Completed",
                  ontap: () {
                    
                    _taskController.markedCompleted(taskk);
                    Get.back();
                  },
                  clr: bluish,
                  context: context),
          _BottomSheetButton(
              label: "Delete Task",
              ontap: () {
                _taskController.delete(taskk);
                _taskController.Completed_task.remove(taskk);
                _taskController.pending_task.remove(taskk);
                Get.back();
              },
              clr: Colors.red,
              context: context),
          SizedBox(height: 7),
          _BottomSheetButton(
              label: "Cancel",
              ontap: () {
                Get.back();
              },
              clr: Colors.blueGrey,
              context: context),
        ],
      ),
    ),
  );
}

_BottomSheetButton({
  required String label,
  required Function() ontap,
  required Color clr,
  bool isClose = false,
  required BuildContext context,
}) {
  return GestureDetector(

    onTap: ontap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      height: 55,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: isClose == true ? Colors.red : clr),
        borderRadius: BorderRadius.circular(20),
        color: isClose == true ? Colors.red : clr,
      ),
      child: Center(
          child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18),
      )),
    ),
  );
}

_addTaskBar() {
  return Container(
    margin: EdgeInsets.only(right: 20, left: 20, top: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: subHeadingStyle,
          ),
          Text("Today", style: HeadingStyle)
        ]),
      ),
      Button(
          label: "+ Add Task",
          ontap: () async {
            await Get.to(() => AddTask());
            _taskController.getTasks();
          }),
    ]),
  );
}


