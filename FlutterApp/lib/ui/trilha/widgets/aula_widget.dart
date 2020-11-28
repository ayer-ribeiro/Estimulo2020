import 'package:estimulo2020/ui/general_widgets/animated_card.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:estimulo2020/model/aula.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class AulaWidget extends StatefulWidget {
  AulaWidget({
    @required this.aula,
    // @required this.onPressed,
  }) : super();

  // final VoidCallback onPressed;
  final Aula aula;

  _AulaWidgetState createState() => _AulaWidgetState(
        aula: aula,
        // onPressed: onPressed,
      );
}

class _AulaWidgetState extends State<AulaWidget> with TickerProviderStateMixin {
  _AulaWidgetState({
    @required this.aula,
    // @required this.onPressed,
  }) : super();

  // final VoidCallback onPressed;
  final Aula aula;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
        child: Column(
          children: [
            AnimatedCard(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        aula.thumbnail,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/play-button.png',
                        fit: BoxFit.contain,
                        height: 56,
                      )
                    ],
                  ),
                ),
                spreadRadius: -100,
                onPressed: () {
                  FlutterYoutube.playYoutubeVideoByUrl(
                    autoPlay: true,
                    apiKey: "AIzaSyAAF6NRUWtUzEipr5rr8UWB_3AD2qUaNOM",
                    videoUrl: aula.videoUrl,
                  );
                }),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Text(
                    aula.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(aula.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
