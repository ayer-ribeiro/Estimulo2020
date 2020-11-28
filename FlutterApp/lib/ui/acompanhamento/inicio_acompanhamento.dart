import 'package:estimulo2020/api/api.dart';
import 'package:estimulo2020/ui/general_widgets/button.dart';
import 'package:estimulo2020/ui/general_widgets/formulario_widget.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class InicioAcompanhamentoPage extends StatefulWidget {
  InicioAcompanhamentoPage() : super();
  @override
  _InicioAcompanhamentoPageState createState() =>
      _InicioAcompanhamentoPageState();
}

class _InicioAcompanhamentoPageState extends State<InicioAcompanhamentoPage> {
  int state = 0;

  void nextWidget() {
    setState(() {
      state++;
    });
  }

  Widget getCurrentWidget() {
    if (state == 0) {
      return getBeginBody();
    } else if (state == 1) {
      return getFormularioBody();
    } else {
      return getFormReceivedBody();
    }
  }

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
                'Feedback',
              ),
            )
          ];
        },
        body: getCurrentWidget(),
      ),
    );
  }

  Widget getBeginBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/info-view-image.png',
            fit: BoxFit.contain,
            height: 150,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Preecnha o formulário de acompanhamento do negócio para melhor seu negócio.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Button(
            backgroundColor: AppColors.secondaryColor,
            title: 'Preencher formulário',
            onPressed: () => {nextWidget()},
          )
        ],
      ),
    );
  }

  Widget getFormularioBody() {
    return Formulario(
      items: Api().fetchAcompanhamentoFormulario(),
      onFinished: (resposta) {
        nextWidget();
      },
    );
  }

  Widget getFormReceivedBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/info-view-image.png',
            fit: BoxFit.contain,
            height: 150,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Obrigado por preencher o formulário.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
