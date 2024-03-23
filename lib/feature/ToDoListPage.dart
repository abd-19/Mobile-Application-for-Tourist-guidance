// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ToDoListpage extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoListpage> {
  List<TaskItem> toDoItems = [];

  @override
  void initState() {
    super.initState();
    loadToDoList();
  }

  void loadToDoList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      toDoItems = TaskItem.listFromJson(prefs.getStringList('toDoItems') ?? []);
    });
  }

  void saveToDoList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('toDoItems', TaskItem.listToJson(toDoItems));
  }

  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          onTaskAdded: (newTask) {
            setState(() {
              toDoItems.add(newTask);
              saveToDoList();
            });
          },
        );
      },
    );
  }

  void clearCompletedTasks() {
    setState(() {
      toDoItems.removeWhere((task) => task.isCompleted);
      saveToDoList();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoItems.removeAt(index);
      saveToDoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'TO-DO',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 241, 240, 240),
              fontWeight: FontWeight.bold,
              fontFamily: 'PT Sans',
            ),
          ),
        ),
        backgroundColor: Color(0xff008fa0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
              child: ListView.builder(
                itemCount: toDoItems.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(toDoItems[index].toString()),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart ||
                          direction == DismissDirection.startToEnd) {
                        // Swiped to delete
                        deleteTask(index);
                      }
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: TaskTile(
                      taskItem: toDoItems[index],
                      onCheckboxChanged: (value) {
                        setState(() {
                          toDoItems[index].isCompleted = value!;
                          saveToDoList();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffd9d9d9),
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: clearCompletedTasks,
                tooltip: 'Clear Completed',
                heroTag: "btn1",
                child: Icon(Icons.delete),
                backgroundColor: Color(0xff008fa0),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              FloatingActionButton(
                onPressed: showAddTaskDialog,
                tooltip: 'Add Task',
                heroTag: "btn2",
                child: Icon(Icons.add),
                backgroundColor: Color(0xff008fa0),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  final ValueChanged<TaskItem> onTaskAdded;

  AddTaskDialog({required this.onTaskAdded});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  String newTask = '';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(labelText: 'Task'),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null && pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff008fa0)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Due Date: ${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff3b3b3b),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (newTask.isNotEmpty) {
              widget.onTaskAdded(TaskItem(task: newTask, date: selectedDate));
              Navigator.of(context).pop();
            }
          },
          child: Text('Add Task'),
        ),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  final TaskItem taskItem;
  final ValueChanged<bool?> onCheckboxChanged;

  TaskTile({required this.taskItem, required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: taskItem.isCompleted ? Colors.grey : Colors.white,
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskItem.isCompleted,
              onChanged: onCheckboxChanged,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskItem.task,
                  style: TextStyle(
                    fontSize: 18,
                    color: taskItem.isCompleted
                        ? const Color(0xff3d3d3d)
                        : Colors.black,
                    decoration: taskItem.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                Text(
                  'Due Date: ${taskItem.formattedDate}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff3b3b3b),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem {
  String task;
  DateTime date;
  bool isCompleted;

  TaskItem({required this.task, required this.date, this.isCompleted = false});

  String get formattedDate {
    return '${date.year}/${date.month}/${date.day}';
  }

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      task: json['task'],
      date: DateTime.parse(json['date']),
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  static List<TaskItem> listFromJson(List<String> jsonList) {
    return jsonList.map((json) => TaskItem.fromJson(jsonDecode(json))).toList();
  }

  static List<String> listToJson(List<TaskItem> items) {
    return items.map((item) => jsonEncode(item.toJson())).toList();
  }
}
