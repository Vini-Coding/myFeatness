import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myfeatness/app/features/home/ui/home_page.dart';
import 'package:myfeatness/app/features/intro/store/intro_store.dart';
import 'package:myfeatness/app/features/intro/ui/components/intro_dots_indicator.dart';
import 'package:myfeatness/app/features/intro/ui/components/intro_page_widget.dart';

class IntroPage extends StatefulWidget {
  static const routeName = "intro";
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  IntroStore store = IntroStore();

  Future<void> goToHome() async {
    // SharedPreferences preferences =
    //     Injector.appInstance.get<SharedPreferences>();
    // preferences.setBool("isFirstEntry", false);
    // Navigator.of(context).pushReplacementNamed(HomePage.routeName);
  }

  @override
  void dispose() {
    store.value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: store,
          builder: (context, pagestore, child) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pagestore,
                    itemCount: store.introContent.length,
                    onPageChanged: (newIndex) {
                      store.newPageIndex(newIndex);
                    },
                    itemBuilder: (context, index) => IntroPageWidget(
                      title: store.introContent[index].title,
                      assetImage: store.introContent[index].assetImage,
                      description: store.introContent[index].description,
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: store.pageIndex,
                  builder: (context, pageIndex, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Visibility(
                        visible: pageIndex != 1,
                        replacement: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: goToHome,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "CALCULAR",
                                      style: textTheme.displaySmall!.copyWith(
                                        //    color: colorScheme.background,
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: goToHome,
                              child: Text(
                                "Pular",
                                style: textTheme.bodySmall,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            ...List.generate(
                              store.introContent.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(4),
                                child: IntroDotsIndicatorWidget(
                                  isActive: index == pageIndex,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                pagestore.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              child: const FaIcon(FontAwesomeIcons.arrowRight),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
