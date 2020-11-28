import 'package:flutter/material.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:estimulo2020/ui/general_widgets/button.dart';
import 'package:estimulo2020/ui/general_widgets/progress_bar.dart';
import 'package:estimulo2020/ui/general_widgets/animated_card.dart';

class CardResumoTrilha extends StatelessWidget {
  final VoidCallback onPressed;
  const CardResumoTrilha({this.onPressed}) : super();

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
                  "Trilha de capacitação",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "A trilha de capacitação é uma acervo de cursos direcionados na capacitação do empreendedor para melhorar seu negócio.",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 16),
                ProgressBar(
                  percent: 0.35,
                  animationDuration: 1000,
                ),
                SizedBox(height: 8),
                Text(
                  "35% concluído",
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Button(
                  title: 'Acessar trilha',
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

// class ProgressBar extends StatelessWidget {
//   const ProgressBar() : super();

//   @override
//   Widget build(BuildContext context) {
//     return LinearPercentIndicator(
//       backgroundColor: AppColors.grayF0,
//       animation: true,
//       lineHeight: 16.0,
//       animationDuration: 2000,
//       percent: 0.3,
//       linearStrokeCap: LinearStrokeCap.roundAll,
//       progressColor: AppColors.secundaryColor,
//     );
//   }
// }
