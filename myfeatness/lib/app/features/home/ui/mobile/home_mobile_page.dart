import 'package:flutter/material.dart';
import 'package:myfeatness/app/core/components/general_text_button_widget.dart';
import 'package:myfeatness/app/features/forms/ui/components/home_card_widget.dart';
import 'package:myfeatness/app/features/home/provider/home_provider.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key, required this.provider});
  final HomeProvider provider;

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF3333),
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            text: 'My',
            style: TextStyle(
              fontFamily: 'Staatliches',
              color: Color(0xFF2E314D),
              fontSize: 25,
            ),
            children: [
              TextSpan(
                text: 'FEATNESS',
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  color: Color(0xFFFFFFFF),
                  fontSize: 25,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Olá, você tem que ingerir',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF2E314D),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Center(
                child: Text(
                  '30948 kcal',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    color: Color(0xFFFF3333),
                    fontSize: 85,
                    height: 1,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Com base no cálculo de lorem ipsum dolor site amet Com base no cálculo de lorem ipsum dolor site amet, Com base no cálculo de lorem ipsum dolor site amet Com base no cálculo de lorem ipsum dolor site ame.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF2E314D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              GeneralTextButtonWidget(
                onTap: () {},
                text: 'RECALCULAR',
                width: 500,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Confira',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF2E314D),
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: ' artigos',
                          style: TextStyle(
                            color: Color(0xFFFF3333),
                          ),
                        ),
                        TextSpan(
                          text: ' sobre logo abaixo:',
                          style: TextStyle(
                            color: Color(0xFF2E314D),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              HomeCardWidget(
                title: 'ARTIGO 1 - TÍTULO DO ARTIGO',
                description: 'Descrição do artigo',
                onTap: () {},
              ),
              const SizedBox(height: 15),
              HomeCardWidget(
                title: 'ARTIGO 1 - TÍTULO DO ARTIGO',
                description: 'Descrição do artigo',
                onTap: () {},
              ),
              const SizedBox(height: 15),
              HomeCardWidget(
                title: 'ARTIGO 1 - TÍTULO DO ARTIGO',
                description: 'Descrição do artigo',
                onTap: () {},
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
