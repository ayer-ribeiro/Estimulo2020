import 'dart:ui';
import 'package:estimulo2020/model/trilha.dart';
import 'package:estimulo2020/ui/trilha/widgets/aula_widget.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:estimulo2020/model/aula.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:estimulo2020/api/api.dart';

class ModuloTrilhaPage extends StatefulWidget {
  ModuloTrilhaPage({@required this.trilha}) : super();
  final Trilha trilha;

  @override
  _ModuloTrilhaPageState createState() =>
      _ModuloTrilhaPageState(trilha: trilha);
}

class _ModuloTrilhaPageState extends State<ModuloTrilhaPage> {
  _ModuloTrilhaPageState({@required this.trilha}) : super();
  final Trilha trilha;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    var items = Api().fetchAulas(trilha.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: AppColors.textColor,
        ),
        title: Text(
          trilha.title,
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
      ),
      body: FutureBuilder<List<Aula>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            //return Container(color: Colors.purple); // : show loading widget
          }
          if (snapshot.hasError) {
            //return Container(color: Colors.red); // show error widget
          }
          List<Aula> aulas = snapshot.data ?? [];
          return LiveList(
            padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0),
            itemCount: aulas.length,
            itemBuilder: (context, index, animation) {
              Aula aula = aulas[index];

              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(animation),
                  child: AulaWidget(aula: aula),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(left: 16, bottom: 16, top: 0, right: 16),
                child: Column(
                  children: [
                    Divider(
                      color: AppColors.gray97,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
