import 'dart:ui';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:estimulo2020/ui/home/widgets/card_resumo_mentoria.dart';
import 'package:estimulo2020/ui/home/widgets/card_resumo_acompanhamento.dart';
import 'package:estimulo2020/ui/home/widgets/card_resumo_trilha.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onTapMentoria;
  final VoidCallback onTapAcompanhamento;
  final VoidCallback onTapTrilha;

  HomePage({
    this.onTapMentoria,
    this.onTapAcompanhamento,
    this.onTapTrilha,
  }) : super();
  @override
  _HomePageState createState() => _HomePageState(
        onTapMentoria: onTapMentoria,
        onTapAcompanhamento: onTapAcompanhamento,
        onTapTrilha: onTapTrilha,
      );
}

class _HomePageState extends State<HomePage> {
  final VoidCallback onTapMentoria;
  final VoidCallback onTapAcompanhamento;
  final VoidCallback onTapTrilha;

  _HomePageState({
    this.onTapMentoria,
    this.onTapAcompanhamento,
    this.onTapTrilha,
  }) : super();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              border: Border.all(
                width: 0,
                color: Colors.white,
              ),
              largeTitle: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
              ),
            )
          ];
        },
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CardResumoMentoria(
                      onPressed: () => {
                        onTapMentoria(),
                      },
                    ),
                    SizedBox(height: 24),
                    CardResumoAcompanhamento(
                      onPressed: () => {
                        onTapAcompanhamento(),
                      },
                    ),
                    SizedBox(height: 24),
                    CardResumoTrilha(
                      onPressed: () => {
                        onTapTrilha(),
                      },
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
