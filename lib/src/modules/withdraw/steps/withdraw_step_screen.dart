import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:passaqui/src/modules/withdraw/welcome/withdraw_welcome_screen.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/navigation/navigation_handler.dart';
import '../../../shared/widget/text_button.dart';
import '../../home/home_page.dart';

class WithdrawStepsScreen extends StatefulWidget {
  static const String route = "/withdraw-how-to";

  const WithdrawStepsScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawStepsScreen> createState() => _WithdrawStepsScreenState();
}

class _WithdrawStepsScreenState extends State<WithdrawStepsScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.height >= 740;
  }

  List<WithdrawStepItem> steps = [
    WithdrawStepItem(
      step: 1,
      title: "1. Libere o seu Saque-Aniversário",
      image: "assets/images/withdraw/withdraw_one.png",
      backgroundImage: "assets/images/withdraw/withdraw_back_logo.svg",
      number: "assets/images/withdraw/1.png",
      description:
      "Preencha suas informações e aguarde nosso contato.\n\nNossa equipe está à sua disposição para apoiar seus objetivos financeiros.",
    ),
    WithdrawStepItem(
      step: 2,
      title: "2. Logue no aplicativo do FGTS",
      image: "assets/images/withdraw/withdraw_two.png",
      backgroundImage: "assets/images/withdraw/withdraw_back_logo.svg",
      number: "assets/images/withdraw/2.png",
      description:
      "Digite seus dados e clique em entrar;\n\nCaso seja seu primeiro acesso, clique em cadastre-se e siga o passo a passo da Caixa.",
    ),
    WithdrawStepItem(
      step: 3,
      title: "3. No menu inicial",
      image: "assets/images/withdraw/withdraw_three.png",
      backgroundImage: "assets/images/withdraw/withdraw_back_logo.svg",
      number: "assets/images/withdraw/3.png",
      description: "Clique na opção “Saque-Aniversário do FGTS”.",
    ),
    WithdrawStepItem(
      step: 4,
      title: "4. Confirme em autorizar e optar pelo Saque-Aniversário",
      image: "assets/images/withdraw/withdraw_four.png",
      backgroundImage: "assets/images/withdraw/withdraw_back_logo.svg",
      number: "assets/images/withdraw/4.png",
      description:
      "Clique no aceite para optar pelo Saque-Aniversário. \n\nConfirme e clique em “Continuar”, a Caixa vai pedir para cadastrar seu banco e opções de como quer sacar. Siga os passos indicados até a sua solicitação ser processada com sucesso!",
    ),
    WithdrawStepItem(
      step: 5,
      title: "5. Autorizando o banco BMP",
      image: "assets/images/withdraw/withdraw_five.png",
      backgroundImage: "assets/images/withdraw/withdraw_back_logo.svg",
      number: "assets/images/withdraw/5.png",
      description:
      "Tudo certo com a opção do Saque FGTS, você precisa autorizar o banco a consultar seus dados e limite liberado pela Caixa;\n\nNovamente no menu principal, clique no botão “Autorizar bancos a consultarem seu FGTS”.",
    ),
    WithdrawStepItem(
      step: 6,
      title: "6. Autorize o Saque-Aniversário",
      image: "assets/images/withdraw/withdraw_six.png",
      backgroundImage: "assets/images/withdraw/withdraw_back_logo.svg",
      number: "assets/images/withdraw/6.png",
      description:
      "Clique em Empréstimo Saque Aniversário na seta que indica a direita; \n\nNa sequência clique em visualizar o termo;\n\nClique no aceite e no botão continuar.",
    ),
    WithdrawStepItem(
      step: 7,
      title: "7. Procure o Banco BMP Sociedade de crédito direto S.A",
      image: "assets/images/withdraw/withdraw_seven.png",
      backgroundImage: "assets/images/withdraw/withdraw_back_logo.svg",
      number: "assets/images/withdraw/7.png",
      description:
      "Digite BMP em buscar banco; \nSeleciona o Banco BMP;\nClique em continuar;\nClique em confirmar seleção.\n\nPronto, você autorizou o BMP!\nDentro de 24 horas entre no Aplicativo e solicite seu empréstimo!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool largeScreen = isLargeScreen(context);

    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: [
          SizedBox(height: largeScreen ? 48 : 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: GestureDetector(
                  onTap: () {
                    DIService()
                        .inject<NavigationHandler>()
                        .navigate(WithdrawWelcomeScreen.route);
                  },
                  child: const Icon(Icons.chevron_left,
                      color: Color(0xFFA8CA4B), size: 34),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  "Como realizar a contratação?",
                  style: TextStyle(
                    fontSize: largeScreen ? 22 : 18,
                    color: Color(0xFF136048),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: largeScreen ? 22 : 2),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return steps[index];
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: largeScreen ? 78 : 24,
                  vertical: largeScreen ? 48 : 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PassaquiTextButton(
                    isLeading: true,
                    label: "Anterior",
                    textColor: Color(0xFF1E1E1E),
                    arrowColor: Color(0xFF126049),
                    fontSize: largeScreen ? 14 : 12,
                    onTap: () {
                      if (_pageController.page?.toInt() != 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  PassaquiTextButton(
                    label: "Próxima",
                    textColor: Color(0xFF1E1E1E),
                    fontSize: largeScreen ? 22 : 16,
                    fontWeight: FontWeight.w500,
                    arrowColor: Color(0xFF126049),
                    onTap: () {
                      int? lastPage = _pageController.page?.toInt();
                      if (lastPage == steps.length - 1) {
                        DIService()
                            .inject<NavigationHandler>()
                            .navigate(HomeScreen.route);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WithdrawStepItem extends StatelessWidget {
  final int step;
  final String title;
  final String image;
  final String backgroundImage;
  final String number;
  final String description;

  const WithdrawStepItem({
    required this.step,
    required this.title,
    required this.image,
    required this.backgroundImage,
    required this.number,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32),
          Stack(
            children: [
              // Background image
              SvgPicture.asset(
                backgroundImage,
                height: 340,
                color: Colors.white,
              ),
              // Main image
              Positioned.fill(
                child: Image.asset(
                  image,
                  height: 330,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              // Number image positioned to the right of the main image
              Positioned(
                right: 12,
                top: 44,
                child: Image.asset(
                  number,
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1E1E1E),
                  fontFamily: 'Inter',
                  height: 1.4,
                ),
                children: _buildDescription(description, step),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildDescription(String description, int step) {
    final List<String> boldTexts = [
      "clique aqui e veja como autorizar",
      "Autorizar bancos a consultarem seu FGTS",
      "visualizar o termo",
      "continuar"
    ];

    const boldStyle = TextStyle(fontWeight: FontWeight.bold);
    const regularStyle = TextStyle(fontWeight: FontWeight.normal);

    List<String> stepBoldTexts = [];
    if (step == 1) {
      stepBoldTexts.add(boldTexts[0]);
    } else if (step == 5) {
      stepBoldTexts.add(boldTexts[1]);
    } else if (step == 6) {
      stepBoldTexts.add(boldTexts[2]);
      stepBoldTexts.add(boldTexts[3]);
    }

    List<TextSpan> textSpans = [];
    String remainingText = description;

    for (String boldText in stepBoldTexts) {
      List<String> splitText = remainingText.split(boldText);
      for (int i = 0; i < splitText.length - 1; i++) {
        textSpans.add(TextSpan(text: splitText[i], style: regularStyle));
        textSpans.add(TextSpan(text: boldText, style: boldStyle));
      }
      remainingText = splitText.last;
    }

    textSpans.add(TextSpan(text: remainingText, style: regularStyle));
    return textSpans;
  }
}
