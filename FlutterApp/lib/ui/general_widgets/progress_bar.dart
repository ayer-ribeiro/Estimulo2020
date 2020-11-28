import 'package:flutter/material.dart';
import '../../values/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({
    Key key,
    @required this.percent,
    this.animateFromLastPercent = false,
    this.animationDuration = 400,
  }) : super(key: key);

  final double percent;
  final bool animateFromLastPercent;
  final int animationDuration;
  final _ProgressBarState state = _ProgressBarState();

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      backgroundColor: AppColors.grayF0,
      animateFromLastPercent: widget.animateFromLastPercent,
      animation: true,
      lineHeight: 16.0,
      animationDuration: widget.animationDuration,
      percent: widget.percent,
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: AppColors.secondaryColor,
    );
  }
}
