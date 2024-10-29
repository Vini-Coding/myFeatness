import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:myfeatness/app/core/components/general_text_button_widget.dart';
import 'package:myfeatness/app/features/home/models/article.dart';
import 'package:myfeatness/app/features/home/providers/forms_provider.dart';
import 'package:myfeatness/app/features/home/providers/home_provider.dart';
import 'package:myfeatness/app/features/home/ui/components/custom_dropdown_form_field_widget.dart';
import 'package:myfeatness/app/features/home/ui/components/custom_text_form_field_widget.dart';
import 'package:myfeatness/app/features/home/ui/components/home_card_widget.dart';
import 'package:provider/provider.dart';

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({
    super.key,
    required this.provider,
  });
  final HomeProvider provider;

  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final List<String> _sexOptions = ['Masculino', 'Feminino'];
  final List<String> _levelOptions = [
    'Sedentário',
    'Levemente ativo',
    'Moderadamento ativo',
    'Muito ativo',
  ];
  final List<String> _goalOptions = ['Perda de peso', 'Ganho de peso'];

  void _clearTextControllers() {
    _weightController.clear();
    _heightController.clear();
    _ageController.clear();
    _ageController.clear();
  }

  @override
  void initState() {
    widget.provider.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FormsProvider formsProvider = context.watch<FormsProvider>();

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
      drawer: Drawer(
        
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextFormFieldWidget(
                            title: 'INSIRA SEU PESO',
                            suffixText: 'kg',
                            controller: _weightController,
                            onChanged: (value) {
                              if (value != null) {
                                formsProvider
                                    .updateWeight(double.tryParse(value) ?? 0);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira seu peso.';
                              } else if (double.tryParse(value) == null ||
                                  double.tryParse(value)! < 2) {
                                return 'Por favor, insira um valor válido como 70.5';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormFieldWidget(
                            title: 'INSIRA SUA ALTURA',
                            suffixText: 'm',
                            controller: _heightController,
                            onChanged: (value) {
                              if (value != null) {
                                formsProvider
                                    .updateHeight(double.tryParse(value) ?? 0);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira sua altura.';
                              } else if (double.tryParse(value) == null ||
                                  double.tryParse(value)! == 0) {
                                return 'Por favor, insira um valor válido como 1.75';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormFieldWidget(
                            title: 'INSIRA SUA IDADE',
                            suffixText: 'anos',
                            controller: _ageController,
                            onChanged: (value) {
                              if (value != null) {
                                formsProvider
                                    .updateAge(int.tryParse(value) ?? 0);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira sua idade.';
                              } else if (int.tryParse(value) == null ||
                                  int.tryParse(value)! == 0) {
                                return 'Por favor, insira um valor inteiro válido como 20';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomDropdownFormFieldWidget(
                            title: 'INSIRA SEU SEXO',
                            selectionOptions: _sexOptions,
                            onChanged: (value) {
                              if (value != null) {
                                formsProvider.updateSex(value);
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Por favor, selecione seu sexo';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomDropdownFormFieldWidget(
                            title:
                                'INSIRA A FREQUÊNCIA COM QUE VOCÊ FAZ ATIVIDADE FÍSICA',
                            selectionOptions: _levelOptions,
                            onChanged: (value) {
                              if (value != null) {
                                formsProvider.updateLevel(value);
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Por favor, selecione a frequência.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomDropdownFormFieldWidget(
                            title: 'INSIRA SEU OBJETIVO',
                            selectionOptions: _goalOptions,
                            onChanged: (value) {
                              if (value != null) {
                                formsProvider.updateGoal(value);
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Por favor, selecione seu objetivo';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          GeneralTextButtonWidget(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                await formsProvider.calculateAndSaveProfile();
                                await widget.provider.loadData();
                                _clearTextControllers();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Color(0xFFFF3333),
                                    content: Text(
                                      'Por favor, preencha os campos corretamente',
                                    ),
                                  ),
                                );
                              }
                            },
                            text: "CALCULAR",
                            width: double.maxFinite,
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 100),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
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
                        child: Align(
                          alignment: Alignment.centerLeft,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
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
                            textAlign: TextAlign.start,
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
                            publishDate: DateFormat('dd/MM/yyyy')
                                .format(artigo.publishedDate),
                            content: artigo.content,
                            tags: artigo.tags,
                            isMobile: false,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
