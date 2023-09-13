import 'package:e_fashion_app/data/app_data.dart';
import 'package:e_fashion_app/model/base_model.dart';
import 'package:e_fashion_app/model/categories_model.dart';
import 'package:e_fashion_app/screens/detail.dart';
import 'package:e_fashion_app/utils/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:faded_widget/faded_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: 0.7

        /// it gives the picture in between a view of the right ones and left ones
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //text widgets at the top
              FadeIn(
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Find your ",
                            style: theme.displayLarge,
                            children: [
                              TextSpan(
                                text: "Style",
                                style: theme.bodyLarge?.copyWith(
                                  color: primarColor,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                      RichText(
                        text: const TextSpan(
                            text: "Be more beautiful with our ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "Suggestion :)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),

              // Container

              /// Categories
              FadeIn(
                duration: Duration(milliseconds: 300),
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: size.width,
                  height: size.height * 0.14,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (ctx, index) {
                        CategoriesModel current = categories[index];
                        return Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(current.imageUrl),
                              ),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              Text(
                                current.title,
                                style: theme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),

              /// Body
              FadeIn(
                duration: Duration(
                  milliseconds: 500,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: size.height * 0.45,
                  width: size.width,
                  child: PageView.builder(
                      controller: _controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: mainList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(
                                      data: mainList[index],
                                      isCameFromMostPopularPart: false),
                                ),
                              );
                            },
                            child: view(index, theme, size));
                      }),
                ),
              ),

              /// Most Popular Text
              FadeIn(
                duration: Duration(milliseconds: 700),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular",
                        style: theme.displaySmall,
                      ),
                      Text(
                        "See all",
                        style: theme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),

              /// Most Popular Content
              FadeIn(
                duration: const Duration(milliseconds: 800),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.44,
                  // color: Colors.yellow,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.63, crossAxisCount: 2),
                    itemCount: mainList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      BaseModel current = mainList[index];
                      return GestureDetector(
                        onTap: () {
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(
                                      data: mainList[index],
                                      isCameFromMostPopularPart: true),
                                ),
                              );
                        },
                        child: Column(
                          children: [
                            Hero(
                              tag:current.imageUrl,
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.3,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                    image: AssetImage(current.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      color: Color.fromARGB(61, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                current.name,
                                style: theme.displayMedium,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "€",
                                style: theme.bodyLarge?.copyWith(
                                  color: primarColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: current.price.toString(),
                                    style: theme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0.0;
        if (_controller.position.haveDimensions) {
          value = index.toDouble() - (_controller.page ?? 0);
          value = (value * 0.04).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: 3.14 * value,
          child: _buildCards(size, mainList[index], theme),
        );
      },
    );
  }

  Padding _buildCards(Size size, BaseModel data, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Hero(
            tag: data.id,
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromARGB(61, 0, 0, 0)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              data.name,
              style: theme.displayMedium,
            ),
          ),
          RichText(
            text: TextSpan(
              text: "€",
              style: theme.bodyLarge?.copyWith(
                color: primarColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: data.price.toString(),
                  style: theme.bodyLarge?.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
