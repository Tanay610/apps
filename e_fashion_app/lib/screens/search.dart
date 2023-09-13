import 'package:e_fashion_app/model/base_model.dart';
import 'package:e_fashion_app/screens/detail.dart';
import 'package:e_fashion_app/screens/method/add_to_cart.dart';
import 'package:e_fashion_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:faded_widget/faded_widget.dart';
import 'package:e_fashion_app/utils/app_theme.dart';
import 'package:e_fashion_app/utils/constants.dart';
import '../data/app_data.dart';
import 'package:faded_widget/faded_widget.dart';
import 'package:line_icons/line_icons.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    itemsOnSearch = mainList;
  }

  onSearchFunc(String search) {
    setState(() {
      itemsOnSearch = mainList
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              /// Search TextField
              FadeIn(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) => onSearchFunc(value),
                      style: textTheme.displaySmall?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 20,
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          },
                          icon: Icon(Icons.close),
                        ),
                        hintStyle: textTheme.displaySmall?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                        hintText: "e.g.Casual Jeans",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              Expanded(
                child: itemsOnSearch != mainList
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.63, crossAxisCount: 2),
                        itemCount: itemsOnSearch.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          BaseModel current = itemsOnSearch[index];
                          return FadeIn(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Details(
                                      data: mainList[index],
                                      isCameFromMostPopularPart: false,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: size.height * 0.02,
                                    left: size.height * 0.01,
                                    right: size.height * 0.01,
                                    child: Builder(builder: (context) {
                                      return Hero(
                                        tag: current.id,
                                        child: Container(
                                          width: size.width * 0.5,
                                          height: size.height * 0.3,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage(current.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                                color:
                                                    Color.fromARGB(61, 0, 0, 0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  Positioned(
                                    bottom: size.height * 0.021,
                                    child: Text(
                                      current.name,
                                      style: textTheme.displayMedium,
                                    ),
                                  ),
                                  Positioned(
                                    // bottom: size.height * 0.0001,
                                    top: size.height * 0.363,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "€",
                                        style: textTheme.bodyLarge?.copyWith(
                                          color: primarColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: current.price.toString(),
                                            style:
                                                textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: size.height * 0.01,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: primarColor,
                                      child: IconButton(
                                        onPressed: () {
                                          AddToCart.addToCart(current, context);
                                        },
                                        icon: Icon(LineIcons.addToShoppingCart),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FadeIn(
                            duration: Duration(milliseconds: 200),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/result-not-found-1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const FadeIn(
                            duration: Duration(milliseconds: 250),
                            child: Text(
                              "No Results Found :(",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
