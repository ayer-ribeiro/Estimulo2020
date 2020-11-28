import 'package:estimulo2020/model/task.dart';
import 'package:estimulo2020/model/trilha.dart';
import 'package:estimulo2020/model/aula.dart';
import 'package:estimulo2020/ui/general_widgets/formulario_widget.dart';

class Api {
  Future<List<Trilha>> fetchTrilhas() async {
    return Future.delayed(
      Duration(milliseconds: 1500),
      () => [
        Trilha(
          id: "1",
          imageUrl:
              "https://brasil.softlinegroup.com/uploads/cke/81/fd/25/Imagem36.jpg",
          title: "Módulo financeiro",
          description:
              "Saber gerenciar o setor financeiro é um fator chave para o sucesso da empresa. O resumo financeiro é um como um exame da saúde financeira da sua empresa!",
          progress: 0.5,
        ),
        Trilha(
          id: "2",
          imageUrl:
              "https://www.agendor.com.br/blog/wp-content/uploads/2015/06/automacao-de-marketing.png",
          title: "Módulo de marketing",
          description:
              "Marketing ou mercadologia ou, mais raramente, mercância, é a arte de explorar, criar e entregar valor para satisfazer as necessidades do mercado. São usados produtos ou serviços que possam interessar aos consumidores.",
          progress: 0.9,
        ),
        Trilha(
          id: "3",
          imageUrl:
              "https://institutodotrabalhador.org/wp-content/uploads/2018/07/o-que-e-gestao-de-recursos-humanos-800x533-1.jpg",
          title: "Gestão de pessoas",
          description:
              "Gestão de Pessoas ou Administração de Recursos Humanos é a aplicação de um conjunto de conhecimentos e técnicas administrativas especializadas no gerenciamento das relações das pessoas.",
          progress: 0.7,
        )
      ],
    );
  }

  Future<List<Aula>> fetchAulas(String moduloId) async {
    return Future.delayed(
      Duration(milliseconds: 200),
      () => [
        Aula(
          videoUrl: "https://www.youtube.com/watch?v=ra6s0kxsFWI",
          thumbnail: "http://i3.ytimg.com/vi/ra6s0kxsFWI/hqdefault.jpg",
          title: "Juros simples",
          description:
              "O juros simples é calculado com base em um valor fixado chamado de capital inicial.",
        ),
        Aula(
          videoUrl: "https://www.youtube.com/watch?v=-n8_IZbVAyw",
          thumbnail: "http://i3.ytimg.com/vi/-n8_IZbVAyw/hqdefault.jpg",
          title: "Juros compostos",
          description:
              "uros compostos é a adição de juros à soma principal de um empréstimo ou depósito, ou seja, juros sobre juros.",
        ),
        Aula(
          videoUrl: "https://www.youtube.com/watch?v=AaYm5Ny_Awg",
          thumbnail: "http://i3.ytimg.com/vi/AaYm5Ny_Awg/hqdefault.jpg",
          title: "Sistema de amortização constante",
          description:
              "O sistema de amortização constante é uma forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo.",
        )
      ],
    );
  }

  List<FormularioItem> fetchMentoriaFormulario() {
    return [
      FormularioItem(
        titulo: "Qual é sua principal fonte de receita?",
        type: ItemFormularioType.CampoAberto,
      ),
      FormularioItem(
        titulo: "Quantos funcionários existem na empresa?",
        type: ItemFormularioType.Objetiva,
        opcoes: [
          "De 1 a 5 funcionários",
          "De 6 a 20 funcionários",
          "De 21 a 50 funcionários",
          "De 51 a 100 funcionários",
          "Mais de 100 funcionários",
        ],
      )
    ];
  }

  List<FormularioItem> fetchAcompanhamentoFormulario() {
    return [
      FormularioItem(
        titulo:
            "Qual sua expectativa em relação à aquisição de clientes após o plano de ação?",
        type: ItemFormularioType.CampoAberto,
      ),
      FormularioItem(
        titulo:
            "Sua empresa conseguiu atingir a meta de redução de gastos com eletricidade?",
        type: ItemFormularioType.Objetiva,
        opcoes: [
          "A meta foi atingida",
          "A meta não foi atingida",
          "A meta ficou próximo de ser atingida.",
        ],
      ),
      FormularioItem(
        titulo: "Conte sobe sua expirência com o novo setor de marketing",
        type: ItemFormularioType.CampoAberto,
      ),
      FormularioItem(
        titulo:
            "Quanto seu engajamento na página do Instagram aumentou depois das novas metodologias?",
        type: ItemFormularioType.Objetiva,
        opcoes: [
          "O engajamento diminiu",
          "Não mudou",
          "Aumentou em até 5%",
          "Aumentou entre 5% e 10%",
          "Aumentou mais de 10%",
        ],
      ),
    ];
  }

  List<Task> fetchTasks() {
    return [
      Task(
        "Adicionar uma bio mais atrativa no Instagram",
        "Aumentar engajamento no Instagram",
        "Redes sociais",
        "Prazo: 20 de dezembro de 2020",
        "Time de Social media",
        "Benchmarking em concorrentes",
        "1 dia",
        TaskStatus.TODO,
      ),
      Task(
        "Programar desligamento automático dos PC's",
        "Reduzir gastos com eletricidade",
        "Escritório",
        "Prazo: 15 de dezembro de 2020",
        "Time de TI",
        "Criar um Bash script",
        "2 dias",
        TaskStatus.TODO,
      ),
      Task(
        "Consertar sensores das lâmpadas",
        "Reduzir gastos com eletricidade",
        "Escritório",
        "Prazo: 2 de dezembro de 2020",
        "Time de TI",
        "Criar um Bash script",
        "2 dias",
        TaskStatus.DONE,
      ),
      Task(
        "Planejar Stories para os feriados do ano",
        "Aumentar engajamento no Instagram",
        "Redes sociais",
        "Prazo: 18 de dezembro de 2020",
        "Time de Social media",
        "Benchmarking em concorrentes",
        "1 dia",
        TaskStatus.TODO,
      ),
      Task(
        "Enviar mensagem para seguidores pouco engajados",
        "Aumentar engajamento no Instagram",
        "Redes sociais",
        "Prazo: 1 de dezembro de 2020",
        "Time de Social media",
        "Usar ferramentas do Instagram",
        "5 dias",
        TaskStatus.DELAYED,
      ),
    ];
  }
}
