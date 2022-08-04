import 'package:get/get.dart';
import '../models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoController extends GetxController{
  var isLoading = false;
  var taskList = <TaskModel>[];

  Future<void> addTodo(String task, bool done, String id) async {
    await FirebaseFirestore.instance
        .collection('todos')
        .doc(id != '' ? id : null)
        .set(
      {
        'task': task,
        'isDone': done,
      },
      SetOptions(merge: true),
    ).then(
          (value) => getData(),
    );
  }

  Future<void> getData() async {
    try {
      QuerySnapshot _taskSnap = await FirebaseFirestore.instance
          .collection('todos')
          .orderBy('task')
          .get();

      taskList.clear();

      for (var item in _taskSnap.docs) {
        taskList.add(
          TaskModel(item.id, item['task'], item['isDone']),
        );
      }
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteTask(String id) {
    FirebaseFirestore.instance.collection('todos').doc(id).delete();
  }

}