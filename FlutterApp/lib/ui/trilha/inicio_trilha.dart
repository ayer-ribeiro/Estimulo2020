import 'package:auto_animated/auto_animated.dart';
import 'package:estimulo2020/api/api.dart';
import 'package:estimulo2020/model/trilha.dart';
import 'package:estimulo2020/ui/general_widgets/formulario_widget.dart';
import 'package:estimulo2020/ui/trilha/modulo_trilha.dart';
import 'package:estimulo2020/ui/trilha/widgets/trilha_widget.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class InicioTrilhaPage extends StatefulWidget {
  InicioTrilhaPage() : super();
  @override
  _InicioTrilhaPageState createState() => _InicioTrilhaPageState();
}

class _InicioTrilhaPageState extends State<InicioTrilhaPage> {
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
              largeTitle: Text(
                'Trilha de Capacitação',
              ),
            )
          ];
        },
        body: getOnBoardingBody(),
      ),
    );
  }

  Widget getOnBoardingBody() {
    var items = Api().fetchTrilhas();

    return FutureBuilder<List<Trilha>>(
      future: items,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //https://pub.dev/packages/flutter_spinkit
          return SpinKitRing(
            color: AppColors.secondaryColor,
            size: 70.0,
          );
        }
        if (snapshot.hasError) {
          //return Container(color: Colors.red); // show error widget
        }
        List<Trilha> trilhas = snapshot.data ?? [];
        return LiveList(
          padding: EdgeInsets.only(left: 0, top: 16, right: 0, bottom: 0),
          itemCount: trilhas.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 8);
          },
          itemBuilder: (context, index, animation) {
            Trilha trilha = trilhas[index];

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(animation),
                child: TrilhaWidget(
                  trilha: trilha,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModuloTrilhaPage(
                          trilha: trilha,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
