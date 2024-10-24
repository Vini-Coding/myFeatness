import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfeatness/app/core/components/general_text_button_widget.dart';
import 'package:myfeatness/app/features/forms/ui/components/home_card_widget.dart';
import 'package:myfeatness/app/features/forms/ui/forms_page.dart';
import 'package:myfeatness/app/features/home/model/article.dart';
import 'package:myfeatness/app/features/home/provider/home_provider.dart';
import 'package:lottie/lottie.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key, required this.provider});
  final HomeProvider provider;

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  @override
  void initState() {
    widget.provider.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF3333),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
      body: Visibility(
        visible: !widget.provider.isLoading,
        replacement: Center(
          child: Lottie.asset(
            'assets/lottie/loading.json', // Caminho da animação
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
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
              Center(
                child: Text(
                  '${(widget.provider.userProfile?.result ?? 0).toStringAsFixed(2).replaceAll(
                        '.',
                        ',',
                      )} kcal',
                  style: const TextStyle(
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
                  'Com base na TMB sabemos que você deve consumir esse número de calorias. Existem diversas fórmulas para calcular a TMB, mas uma das mais usadas é a equação de Harris-Benedict, que leva em conta o sexo, a idade, o peso e a altura da pessoa.',
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
                onTap: () => Navigator.of(context).pushNamed(
                  FormsPage.routeName,
                ),
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
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Article artigo = widget.provider.articles[index];
                    return HomeCardWidget(
                      title: artigo.title,
                      description: artigo.content,
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 15);
                  },
                  itemCount: widget.provider.articles.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
