import 'package:flutter/material.dart';
import '../model/intro.dart';

class IntroStore extends ValueNotifier<PageController> {
  IntroStore() : super(PageController(initialPage: 0));
  ValueNotifier<int> pageIndex = ValueNotifier(0);

  void newPageIndex(int newIndex) {
    pageIndex.value = newIndex;
  }

  final List<Intro> introContent = [
    Intro(
      title: "BEM-VINDO AO MYFEATNESS",
      assetImage: "assets/vectors/introview1.png",
      description:
          "No MyFeatness você descobre quantas calorias precisa ingerir de forma simples e prática.",
    ),
    Intro(
      title: "INSIRA OS DADOS, OBTENHA O RESULTADO",
      assetImage: "assets/vectors/introview2.png",
      description:
          "Insira dados como peso, altura, idade, gênero, objetivo, etc. e confira quantas calorias precisa ingerir diariamente.",
    ),
    Intro(
      title: "APRENDA MAIS E MELHORE SUA FORMA",
      assetImage: "assets/vectors/introview3.png",
      description:
          "Leia nossos artigos recomendados e utilize a informação do seu resultado para melhorar na sua vida Fitness.",
    ),
  ];
}
