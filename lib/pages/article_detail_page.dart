import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';
import 'package:pet_app/widgets/sub_title.dart';

import '../widgets/card_article.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/template.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(children: [
            Positioned(
                child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('./assets/article/high_five.png'),
                      fit: BoxFit.cover)),
            )),
            Positioned(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: IconButton(
                  icon: Image.asset('./assets/article/play.png'),
                  onPressed: () {},
                )),
            Positioned(
              left: 0,
              top: 320,
              child: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage('./assets/template.png'),
                        alignment: Alignment.bottomRight)),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 460,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: ListView(
                        children: [
                          const Center(
                            child: Text(
                              'How To Adopt A Dog',
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Column(
                            children: const [
                              ExpandText(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam suscipit risus pulvinar, hendrerit nisi quis, vehicula ante. Morbi ut diam elit. Praesent non justo sodales, auctor lacus id, congue massa. Duis ac odio dui. Sed sed egestas metus. Donec hendrerit velit magna. Vivamus elementum, nulla ac tempor euismod, erat nunc mollis diam, nec consequat nisl ex eu tellus. Curabitur fringilla enim at lorem pulvinar, id ornare tellus aliquam. Cras eget nibh tempor lacus aliquam rutrum.',
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Center(
                              child: SubTitle(
                            title: "Other Articles",
                            size: 20,
                          )),
                          Center(
                            child: InkWell(
                              onTap: () => context.goNamed('article-detail'),
                              child: const CardArticle(
                                title: 'How To Adopt a Cat',
                                pathImage: './assets/home/cat.png',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: (mediaQuery.size.width / 2) - 25,
                top: 330,
                width: 50,
                height: 3,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.grey),
                )),
            Positioned(
                top: 50,
                left: 10,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  child: IconButton(
                    onPressed: () {
                      context.goNamed('home');
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.secondaryColor,
                      size: 30,
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
