import 'package:flutter/material.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:estimulo2020/ui/general_widgets/button.dart';
import 'package:estimulo2020/ui/general_widgets/animated_card.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' show pi;

class CardResumoMentoria extends StatelessWidget {
  final VoidCallback onPressed;
  const CardResumoMentoria({this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      onPressed: onPressed,
      spreadRadius: -12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Mentoria",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Seu plano de ação está pronto para ser desenvolvido sem seu negócio, Seu plano de ação está pronto para ser desenvolvido sem seu negócio",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 16),
              MiniRelatorioMentoria(),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Button(
                  title: 'Acessar mentoria',
                  onPressed: () => onPressed(),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniRelatorioMentoria extends StatelessWidget {
  const MiniRelatorioMentoria() : super();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width.round().toDouble();
    double itemWidth =
        ((screenWidth - 16 - 16 - 16 - 16 - 8) / 4).round().toDouble();

    double rotateAngle = -pi / 2;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          color: AppColors.grayF0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: rotateAngle,
                  child: LinearPercentIndicator(
                    width: itemWidth,
                    backgroundColor: AppColors.grayF0,
                    animateFromLastPercent: false,
                    animation: true,
                    lineHeight: itemWidth - 8 - 8,
                    animationDuration: 1000,
                    percent: 0.7,
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: AppColors.todoColor,
                  ),
                ),
                Transform.rotate(
                  angle: rotateAngle,
                  child: LinearPercentIndicator(
                    width: itemWidth,
                    backgroundColor: AppColors.grayF0,
                    animateFromLastPercent: false,
                    animation: true,
                    lineHeight: itemWidth - 8 - 8,
                    animationDuration: 2000,
                    percent: 0.5,
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: AppColors.doingColor,
                  ),
                ),
                Transform.rotate(
                  angle: rotateAngle,
                  child: LinearPercentIndicator(
                    width: itemWidth,
                    backgroundColor: AppColors.grayF0,
                    animateFromLastPercent: false,
                    animation: true,
                    lineHeight: itemWidth - 8 - 8,
                    animationDuration: 2000,
                    percent: 0.2,
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: AppColors.lateTaskColor,
                  ),
                ),
                Transform.rotate(
                  angle: rotateAngle,
                  child: LinearPercentIndicator(
                    width: itemWidth,
                    backgroundColor: AppColors.grayF0,
                    animateFromLastPercent: false,
                    animation: true,
                    lineHeight: itemWidth - 8 - 8,
                    animationDuration: 2000,
                    percent: 0.6,
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: AppColors.doneColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Image.asset('assets/images/mini-relatorio-mentoria.png');
  }
}
