import 'package:estimulo2020/ui/general_widgets/progress_bar.dart';
import 'package:estimulo2020/ui/general_widgets/animated_card.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:estimulo2020/model/trilha.dart';

class TrilhaWidget extends StatefulWidget {
  TrilhaWidget({
    @required this.trilha,
    @required this.onPressed,
  }) : super();

  final VoidCallback onPressed;
  final Trilha trilha;

  _TrilhaWidgetState createState() => _TrilhaWidgetState(
        trilha: trilha,
        onPressed: onPressed,
      );
}

class _TrilhaWidgetState extends State<TrilhaWidget>
    with TickerProviderStateMixin {
  _TrilhaWidgetState({
    @required this.trilha,
    @required this.onPressed,
  }) : super();

  final VoidCallback onPressed;
  final Trilha trilha;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      onPressed: () {
        onPressed();
      },
      spreadRadius: -24,
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    trilha.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        trilha.title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(trilha.description),
                      SizedBox(height: 16),
                      ProgressBar(
                        animationDuration: 1200,
                        percent: trilha.progress,
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
