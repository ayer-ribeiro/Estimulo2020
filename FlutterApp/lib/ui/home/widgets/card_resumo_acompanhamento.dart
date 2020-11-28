import 'package:flutter/material.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:estimulo2020/ui/general_widgets/button.dart';
import 'package:estimulo2020/ui/general_widgets/animated_card.dart';

class CardResumoAcompanhamento extends StatelessWidget {
  final VoidCallback onPressed;
  const CardResumoAcompanhamento({this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      onPressed: onPressed,
      spreadRadius: -12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Acompanhamento",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Preecnha o formulário de acompanhamento do negócio para melhor seu negócio.",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 8),
                Button(
                  title: 'Acessar acompanhamento',
                  onPressed: () => onPressed(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
