import 'package:estimulo2020/model/task.dart';
import 'package:estimulo2020/ui/general_widgets/animated_card.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({Key key, @required this.task}) : super(key: key);

  final Task task;
  final _TaskWidgetState state = _TaskWidgetState();

  _TaskWidgetState createState() => state;
}

class _TaskWidgetState extends State<TaskWidget> {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
      child: AnimatedCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.task.what,
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                widget.task.why,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(widget.task.when),
                            ],
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 120,
                          maxWidth: 120,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                String selectedRadio =
                                    widget.task.getTaskStatusString();
                                return AlertDialog(
                                  title: Text(widget.task.what),
                                  content: StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List<Widget>.generate(3,
                                            (int index) {
                                          return Row(
                                            children: [
                                              Radio<String>(
                                                value: widget.task
                                                    .getStatusList()[index],
                                                groupValue: selectedRadio,
                                                onChanged: (String value) {
                                                  setState(() {
                                                    selectedRadio = value;
                                                  });

                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop('dialog');
                                                  widget.state.setState(() {
                                                    widget.task
                                                        .setStatusFromString(
                                                            value);
                                                  });
                                                },
                                              ),
                                              Text(widget.task
                                                  .getStatusList()[index]),
                                            ],
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            color: widget.task.getColorFromStatus(),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                                top: 16,
                                right: 16,
                                bottom: 16,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.task.getTaskStatusString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Atualizar",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(0),
                  elevation: 0,
                  textColor: Colors.white,
                  color: AppColors.primaryColor,
                  onPressed: () {},
                  child: Text(
                    "Ver detalhes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        spreadRadius: -16,
        onPressed: () {},
      ),
    );
  }
}
