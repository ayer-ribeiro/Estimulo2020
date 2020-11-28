import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/cupertino.dart';

enum TaskStatus { TODO, DOING, DONE, DELAYED }

class Task {
  Task(
    this.what,
    this.why,
    this.where,
    this.when,
    this.who,
    this.how,
    this.houMuch,
    this.status,
  );

  List<String> getStatusList() {
    return [
      getTaskStatusStringFromStatus(TaskStatus.TODO),
      getTaskStatusStringFromStatus(TaskStatus.DOING),
      getTaskStatusStringFromStatus(TaskStatus.DONE),
    ];
  }

  String getTaskStatusString() {
    return getTaskStatusStringFromStatus(this.status);
  }

  String getTaskStatusStringFromStatus(TaskStatus status) {
    if (status == TaskStatus.DOING) {
      return "Em execução";
    }

    if (status == TaskStatus.DONE) {
      return "Concluído";
    }

    if (status == TaskStatus.DELAYED) {
      return "Atrasado";
    }

    return "A fazer";
  }

  void setStatusFromString(String taskText) {
    if (taskText == "Em execução") {
      status = TaskStatus.DOING;
      return;
    }

    if (taskText == "Concluído") {
      status = TaskStatus.DONE;
      return;
    }

    if (taskText == "Atrasado") {
      status = TaskStatus.DELAYED;
      return;
    }

    status = TaskStatus.TODO;
  }

  Color getColorFromStatus() {
    if (this.status == TaskStatus.DOING) {
      return AppColors.doingColor;
    }

    if (this.status == TaskStatus.DONE) {
      return AppColors.doneColor;
    }

    if (this.status == TaskStatus.DELAYED) {
      return AppColors.lateTaskColor;
    }

    return AppColors.todoColor;
  }

  TaskStatus status;

  // What (o que será feito?)
  String what;

  // Why (por que será feito?)
  String why;

  // Where (onde será feito?)
  String where;

  // When (quando será feito?)
  String when;

  // Who (por quem será feito?)
  String who;

  // How (como será feito?)
  String how;

  // How much(quanto vai custar?)
  String houMuch;
}
