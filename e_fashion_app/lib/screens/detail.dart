import 'package:e_fashion_app/model/base_model.dart';
import 'package:e_fashion_app/screens/method/add_to_cart.dart';
import 'package:e_fashion_app/utils/constants.dart';
import 'package:e_fashion_app/widgets/reusable_button.dart';
import 'package:e_fashion_app/widgets/reusable_text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class Details extends StatefulWidget {
  Details(
      {super.key, required this.data, required this.isCameFromMostPopularPart});
  final BaseModel data;
  final bool isCameFromMostPopularPart;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedSize = 3;
  int selectedColors = 2;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    BaseModel current = widget.data;

    return Scaffold(
      extendBodyBehindAppBar: true, // used to fit screen image in appbar
      appBar: _builAppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  /// Top Image
                  Hero(
                    tag: widget.isCameFromMostPopularPart
                        ? current.imageUrl
                        : current.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(current.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.11,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradient,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            /// Product Info
            FadeIn(
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            current.name,
                            style:
                                textTheme.displaySmall?.copyWith(fontSize: 26),
                          ),
                          ReUsableTextForDetails(
                            text: current.price.toString(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            current.stars.toString(),
                            style: textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${current.review}K+ review",
                            style: textTheme.headlineSmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            /// select size Text
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
              child: Text(
                "Select size",
                style: textTheme.displaySmall,
              ),
            ),

            /// Animated container to select the size of the outfits

            FadeIn(
              duration: const Duration(milliseconds: 600),
              child: SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.08,
                // color: Colors.amber,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (context, index) {
                      var current = sizes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = index;
                          });
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.all(10.0),
                          duration: const Duration(milliseconds: 200),
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                            color: selectedSize == index
                                ? primarColor
                                : Colors.transparent,
                            border: Border.all(
                              color: primarColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              current,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: selectedSize == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            /// select color
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
              child: Text(
                "Select Color",
                style: textTheme.displaySmall,
              ),
            ),

            /// selecting colors
            ///

            FadeIn(
              duration: const Duration(milliseconds: 700),
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.08,
                // color: Colors.amber,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      var current = colors[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColors = index;
                          });
                        },
                        child: AnimatedContainer(
                          margin: EdgeInsets.all(10.0),
                          duration: Duration(milliseconds: 200),
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                            color: current,
                            border: Border.all(
                              color: selectedColors == index
                                  ? primarColor
                                  : Colors.transparent,
                              width: selectedColors == index ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            FadeIn(
              duration: Duration(milliseconds: 800),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ReUsableButton(
                    text: "Add to cart",
                    onTap: () {
                      AddToCart.addToCart(current, context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

// it is the transparent appbar in the details section of when the image is clicked
  AppBar _builAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
