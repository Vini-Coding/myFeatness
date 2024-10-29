import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfeatness/app/core/components/general_text_button_widget.dart';
import 'package:myfeatness/app/features/home/ui/components/home_card_widget.dart';
import 'package:myfeatness/app/features/home/models/article.dart';
import 'package:myfeatness/app/features/home/providers/home_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:myfeatness/app/features/home/ui/mobile/forms_mobile_page.dart';

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
        toolbarHeight: 70,
        title: RichText(
          text: const TextSpan(
            text: 'My',
            style: TextStyle(
              fontFamily: 'Staatliches',
              color: Color(0xFF2E314D),
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'FEATNESS',
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  color: Color(0xFFFFFFFF),
                  fontSize: 30,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.provider.userProfile?.result != null
                      ? 'Olá, você tem que ingerir:'
                      : 'Descubra sua TMB aqui',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF2E314D),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Visibility(
                visible: widget.provider.userProfile?.result != null,
                child: Center(
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
              ),
              const SizedBox(height: 10),
              const Text(
                'Com base na TMB (Taxa Metabólica Basal) sabemos que você deve consumir esse número de calorias. Existem diversas fórmulas para calcular a TMB, mas uma das mais usadas é a equação de Harris-Benedict, que leva em conta o sexo, a idade, o peso e a altura da pessoa.',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF2E314D),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              GeneralTextButtonWidget(
                onTap: () => Navigator.of(context).pushNamed(
                  FormsMobilePage.routeName,
                ),
                text: widget.provider.userProfile == null
                    ? 'CALCULAR'
                    : 'RECALCULAR',
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Confira',
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF2E314D),
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        const TextSpan(
                          text: ' artigos',
                          style: TextStyle(
                            color: Color(0xFFFF3333),
                          ),
                        ),
                        const TextSpan(
                          text: ' sobre ',
                          style: TextStyle(
                            color: Color(0xFF2E314D),
                          ),
                        ),
                        if (widget.provider.userProfile?.goal != null)
                          TextSpan(
                            text:
                                "${widget.provider.userProfile!.goal!.toLowerCase()} ",
                            style: const TextStyle(
                              color: Color(0xFFFF3333),
                            ),
                          ),
                        const TextSpan(
                          text: 'logo abaixo:',
                          style: TextStyle(
                            color: Color(0xFF2E314D),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Article artigo = widget.provider.articles[index];
                  return HomeCardWidget(
                    title: artigo.title,
                    author: artigo.author,
                    imageUrl: artigo.imageUrl,
                    publishDate:
                        DateFormat('dd/MM/yyyy').format(artigo.publishedDate),
                    content: artigo.content,
                    tags: artigo.tags,
                    isMobile: true,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemCount: widget.provider.articles.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
