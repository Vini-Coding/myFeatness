import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:myfeatness/app/core/components/general_text_button_widget.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.author,
    required this.publishDate,
    required this.imageUrl,
    required this.content,
    required this.tags,
  });
  final String title;
  final String author;
  final String publishDate;
  final String imageUrl;
  final String content;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    List<String> captalizedTags = tags.map((tag) {
      return tag[0].toUpperCase() + tag.substring(1);
    }).toList();

    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Staatliches',
                      fontSize: 35,
                      color: Color(0xFF2E314D),
                      height: 1,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Image.network(
                    imageUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                          child: Lottie.asset(
                        'assets/lottie/loading.json', // Caminho da animação
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ));
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.circleExclamation,
                            color: Colors.red,
                            size: 15,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Erro ao carregar imagem',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Publicado em $publishDate por $author',
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFFFF3333),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        content,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF2E314D),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GeneralTextButtonWidget(
                    onTap: () => Navigator.pop(context),
                    text: 'FECHAR',
                    width: double.maxFinite,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              height: 170,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/card.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 170,
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xFF2E314D).withOpacity(0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Staatliches',
                      fontSize: 30,
                      color: Color(0xFFFFFFFF),
                      height: 1,
                    ),
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 8),
                    child: Text(
                      'Publicado em $publishDate por $author',
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: captalizedTags.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return IntrinsicWidth(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF3333),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                captalizedTags[index],
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
