import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myfeatness/app/core/components/general_text_button_widget.dart';
import 'package:myfeatness/app/features/forms/provider/forms_provider.dart';
import 'package:myfeatness/app/features/forms/ui/components/custom_dropdown_form_field_widget.dart';
import 'package:myfeatness/app/features/forms/ui/components/custom_text_form_field_widget.dart';
import 'package:myfeatness/app/features/home/ui/home_page.dart';

class FormsMobilePage extends StatefulWidget {
  const FormsMobilePage({
    super.key,
    required this.provider,
  });
  final FormsProvider provider;

  @override
  State<FormsMobilePage> createState() => _FormsMobilePageState();
}

class _FormsMobilePageState extends State<FormsMobilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController =
      TextEditingController(text: '0');
  final TextEditingController _heightController =
      TextEditingController(text: '0');
  final TextEditingController _ageController = TextEditingController(text: '0');
  final List<String> _sexOptions = ['Masculino', 'Feminino'];
  final List<String> _levelOptions = [
    'Sedentário',
    'Levemente ativo',
    'Moderadamento ativo',
    'Muito ativo',
  ];
  final List<String> _goalOptions = ['Perda de peso', 'Ganho de peso'];

  Future<void> goToHome() async {
    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

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
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextFormFieldWidget(
                  title: 'INSIRA SEU PESO',
                  suffixText: 'kg',
                  controller: _weightController,
                  onChanged: (value) {
                    if (value != null) {
                      widget.provider.updateWeight(double.tryParse(value) ?? 0);
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
                const SizedBox(height: 20),
                CustomTextFormFieldWidget(
                  title: 'INSIRA SUA ALTURA',
                  suffixText: 'm',
                  controller: _heightController,
                  onChanged: (value) {
                    if (value != null) {
                      widget.provider.updateHeight(double.tryParse(value) ?? 0);
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
                const SizedBox(height: 20),
                CustomTextFormFieldWidget(
                  title: 'INSIRA SUA IDADE',
                  suffixText: 'anos',
                  controller: _ageController,
                  onChanged: (value) {
                    if (value != null) {
                      widget.provider.updateAge(int.tryParse(value) ?? 0);
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
                const SizedBox(height: 20),
                CustomDropdownFormFieldWidget(
                  title: 'INSIRA SEU SEXO',
                  selectionOptions: _sexOptions,
                  onChanged: (value) {
                    if (value != null) {
                      widget.provider.updateSex(value);
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione seu sexo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomDropdownFormFieldWidget(
                  title:
                      'INSIRA A FREQUÊNCIA COM QUE VOCÊ FAZ ATIVIDADE FÍSICA',
                  selectionOptions: _levelOptions,
                  onChanged: (value) {
                    if (value != null) {
                      widget.provider.updateLevel(value);
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione a frequência.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomDropdownFormFieldWidget(
                  title: 'INSIRA SEU OBJETIVO',
                  selectionOptions: _goalOptions,
                  onChanged: (value) {
                    if (value != null) {
                      widget.provider.updateGoal(value);
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione seu objetivo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                GeneralTextButtonWidget(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.provider.calculateAndSaveProfile();
                      goToHome();
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
