import 'package:estimulo2020/api/api.dart';
import 'package:estimulo2020/ui/general_widgets/button.dart';
import 'package:estimulo2020/ui/general_widgets/formulario_widget.dart';
import 'package:estimulo2020/ui/mentoria/widgets/task_widget.dart';
import 'package:estimulo2020/model/task.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class InicioMentoriaPage extends StatefulWidget {
  InicioMentoriaPage() : super();
  @override
  _InicioMentoriaPageState createState() => _InicioMentoriaPageState();
}

class _InicioMentoriaPageState extends State<InicioMentoriaPage> {
  int state = 0;

  void nextWidget() {
    setState(() {
      state++;
    });
  }

  Widget getCurrentWidget() {
    if (state == 0) {
      return getOnBoardingBody();
    } else if (state == 1) {
      return getFormularioBody();
    } else if (state == 2) {
      return getOnHoldingBody();
    } else {
      return getTasksBody();
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
                'Mentoria Prime',
              ),
            )
          ];
        },
        body: Container(
          child: getCurrentWidget(),
        ),
      ),
    );
  }

  Widget getOnBoardingBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/info-view-image.png',
            fit: BoxFit.contain,
            height: 150,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Com a mentoria, sua empresa receberá uma orientação de uma empresa certificada, identificando fragilidades que podem afetar sua empresa e criando planos de ação para melhorar o seu negócio.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Button(
            backgroundColor: AppColors.secondaryColor,
            title: 'Começar Mentoria Prime',
            onPressed: () => {nextWidget()},
          )
        ],
      ),
    );
  }

  Widget getOnHoldingBody() {
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
            child: RaisedButton(
              elevation: 0,
              highlightColor: Colors.transparent,
              color: Colors.transparent,
              onPressed: () {
                nextWidget();
              },
              child: Text(
                'Recebemos seu formulário. Aguarde o planejamento do seu plano de ação para proseguir :)',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getFormularioBody() {
    return Formulario(
      items: Api().fetchMentoriaFormulario(),
      onFinished: (resposta) {
        nextWidget();
      },
    );
  }

  Widget getTasksBody() {
    List<Task> tasks = Api().fetchTasks();
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskWidget(
          task: tasks[index],
        );
      },
      itemCount: tasks.length,
    );
  }
}
