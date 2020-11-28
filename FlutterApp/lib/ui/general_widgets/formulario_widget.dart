import 'package:estimulo2020/ui/general_widgets/button.dart';
import 'package:estimulo2020/ui/general_widgets/progress_bar.dart';
import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';

enum ItemFormularioType { Objetiva, CampoAberto }

class FormularioItem {
  FormularioItem({@required this.titulo, @required this.type, this.opcoes})
      : super();

  final String titulo;
  final List<String> opcoes;
  final ItemFormularioType type;
}

class Formulario extends StatefulWidget {
  Formulario({
    @required this.items,
    @required this.onFinished,
  }) : super();

  final List<FormularioItem> items;
  final void Function(String) onFinished;

  @override
  _FormularioState createState() => _FormularioState(
        items: items,
        onFinished: onFinished,
      );
}

class _FormularioState extends State<Formulario> {
  _FormularioState({
    @required this.items,
    @required this.onFinished,
  }) : super();

  final List<FormularioItem> items;
  final void Function(String) onFinished;
  ProgressBar progressBar = ProgressBar(percent: 0.0);

  int _position = 0;

  void proximo() {
    if ((_position + 1) >= items.length) {
      Future.delayed(
          Duration(milliseconds: progressBar.animationDuration + 100), () {
        onFinished("Aqui estará a resposta do formulário");
      });
    }
    setState(() {
      _position++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (_position >= items.length) {
    //   return Container();
    // }

    // progressBar.state.setPercent(_position / items.length);
    // FormularioItem item = items[_position];
    Widget formulario;
    if (_position >= items.length) {
      formulario = Container();
    } else if (items[_position].type == ItemFormularioType.Objetiva) {
      formulario = FormularioItemFechado(
        item: items[_position],
        onFinished: (reposta) {
          proximo();
        },
      );
    } else {
      formulario = FormularioItemAberto(
        item: items[_position],
        onFinished: (reposta) {
          proximo();
        },
      );
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 13, top: 16, right: 13, bottom: 16),
          child: ProgressBar(
            percent: _position / items.length,
            animateFromLastPercent: true,
          ),
        ),
        formulario,
      ],
    );
  }
}

class FormularioItemAberto extends StatefulWidget {
  FormularioItemAberto({
    @required this.item,
    @required this.onFinished,
  }) : super();

  final FormularioItem item;
  final void Function(String) onFinished;

  @override
  _FormularioItemAbertoState createState() => _FormularioItemAbertoState(
        item: item,
        onFinished: onFinished,
      );
}

class _FormularioItemAbertoState extends State<FormularioItemAberto> {
  _FormularioItemAbertoState({
    @required this.item,
    @required this.onFinished,
  }) : super();

  final FormularioItem item;
  final void Function(String) onFinished;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            item.titulo,
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          SizedBox(height: 24),
          Button(
            title: "Próxima",
            backgroundColor: AppColors.secondaryColor,
            onPressed: () {
              onFinished("Resposta por parâmetro");
            },
          ),
        ],
      ),
    );
  }
}

class FormularioItemFechado extends StatefulWidget {
  FormularioItemFechado({
    @required this.item,
    @required this.onFinished,
  }) : super();

  final FormularioItem item;
  final void Function(String) onFinished;

  @override
  _FormularioItemFechadoState createState() => _FormularioItemFechadoState(
        item: item,
        onFinished: onFinished,
      );
}

class _FormularioItemFechadoState extends State<FormularioItemFechado> {
  _FormularioItemFechadoState({
    @required this.item,
    @required this.onFinished,
  }) : super();

  final FormularioItem item;
  final void Function(String) onFinished;

  String _option = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            item.titulo,
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: item.opcoes.length,
          itemBuilder: (context, index) {
            return RadioListTile<String>(
              title: Text(item.opcoes[index]),
              value: item.opcoes[index],
              groupValue: _option,
              onChanged: (String value) {
                setState(() {
                  _option = value;
                });
              },
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Button(
            title: "Próxima",
            backgroundColor: AppColors.secondaryColor,
            onPressed: () {
              onFinished("Resposta por parâmetro");
            },
          ),
        ),
      ],
    );
  }
}
