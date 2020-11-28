import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedCard extends StatefulWidget {
  AnimatedCard({
    @required this.child,
    @required this.spreadRadius,
    @required this.onPressed,
  }) : super();

  final Widget child;
  final double spreadRadius;
  final VoidCallback onPressed;

  _AnimatedCardState createState() => _AnimatedCardState(
        child: child,
        spreadRadius: spreadRadius,
        onPressed: onPressed,
      );
}

class _AnimatedCardState extends State<AnimatedCard>
    with TickerProviderStateMixin {
  _AnimatedCardState({
    @required this.child,
    @required this.spreadRadius,
    @required this.onPressed,
  }) : super();

  final Widget child;
  final double spreadRadius;
  final VoidCallback onPressed;

  var cardScale = 1.0;
  var shadowBlur = 24.0;
  AnimationController _scaleAnimationController;
  AnimationController _shadowDistanceAnimationController;

  @override
  void initState() {
    _scaleAnimationController = AnimationController(
      // Se der erro aqui, faça os seguinte passos:
      // Rode no terminal:
      // flutter upgrade
      // flutter pub get
      // flutter clean
      // Depois a IDE e abra novamente
      vsync: this,
      lowerBound: -1.0,
      upperBound: -0.95,
      duration: Duration(milliseconds: 200),
    );
    _scaleAnimationController.addListener(() {
      setState(() {
        cardScale = _scaleAnimationController.value * -1;
      });
    });

    _shadowDistanceAnimationController = AnimationController(
      // Se der erro aqui, faça os seguinte passos:
      // Rode no terminal:
      // flutter upgrade
      // flutter pub get
      // flutter clean
      // Depois a IDE e abra novamente
      vsync: this,
      lowerBound: -24,
      upperBound: -16,
      duration: Duration(milliseconds: 200),
    );
    _shadowDistanceAnimationController.addListener(() {
      setState(() {
        shadowBlur = _shadowDistanceAnimationController.value * -1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    _shadowDistanceAnimationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _scaleAnimationController.forward(from: -cardScale);
          _shadowDistanceAnimationController.forward(from: -shadowBlur);
        });
      },
      onTapUp: (details) {
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            _scaleAnimationController.reverse();
            _shadowDistanceAnimationController.reverse();
          });
        });
      },
      onTapCancel: () {
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            _scaleAnimationController.reverse();
            _shadowDistanceAnimationController.reverse();
          });
        });
      },
      onTap: () {
        onPressed();
      },
      child: Transform.scale(
        scale: cardScale,
        child: Container(
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                offset: Offset.fromDirection(pi / 2, 8),
                spreadRadius: spreadRadius,
                color: AppColors.black50,
                blurRadius: shadowBlur,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
