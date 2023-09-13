

import 'package:e_fashion_app/data/app_data.dart';
import 'package:e_fashion_app/main_wrapper.dart';
import 'package:e_fashion_app/model/base_model.dart';
import 'package:e_fashion_app/utils/constants.dart';
import 'package:e_fashion_app/widgets/reusableCartRow.dart';
import 'package:e_fashion_app/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  /// calculate the Total Price
  double calculatetotalPrice() {
    double total = 0.0;
    if (itemsOncart.isEmpty) {
      total = 0.0;
    } else {
      for (BaseModel data in itemsOncart) {
        total = total + data.price * data.value;
      }
    }
    return total;
  }

  /// Calculate Shipping
  double calculateShipping() {
    double shipping = 0.0;
    if (itemsOncart.isEmpty) {
      shipping = 0.0;
      return shipping;
    } else if (itemsOncart.length <= 4) {
      shipping = 25.99;
      return shipping;
    } else {
      shipping = 88.99;
      return shipping;
    }
  }

  /// calculate sub total price
  int calculateSubTotal() {
    int subTotal = 0;
    if (itemsOncart.isEmpty) {
      subTotal = 0;
    } else {
      for (BaseModel data in itemsOncart) {
        subTotal = subTotal + data.price.round();
        subTotal = subTotal - 160;
      }
    }
    return subTotal < 0 ? 0 : subTotal;
  }

  /// delete current slected Item from list
  void onDelete(BaseModel date) {
    setState(() {
      if (itemsOncart.length == 1) {
        itemsOncart.clear();
      } else {
        itemsOncart.removeWhere((element) => element.id == date.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              // color: Colors.red,
              width: size.width,
              height: size.height * 0.6,
              child: itemsOncart.isNotEmpty
                  ?

                  /// List is not Empty:
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: itemsOncart.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var current = itemsOncart[index];
                        return Container(
                          margin: EdgeInsets.all(5),
                          width: size.width,
                          height: size.height * 0.28,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Product Image
                              Container(
                                margin: EdgeInsets.all(5.0),
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          current.imageUrl,
                                        ),
                                        fit: BoxFit.cover),
                                    color: Colors.purple,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Color.fromARGB(61, 0, 0, 0),
                                      ),
                                    ]),
                              ),

                              SizedBox(
                                height: size.height * 0.01,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.52,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            current.name,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                onDelete(current);
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                              ))
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "€",
                                          style: textTheme.titleSmall?.copyWith(
                                            fontSize: 22,
                                            color: primarColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: current.price.toString(),
                                              style: textTheme.titleSmall
                                                  ?.copyWith(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    Text(
                                      "Size = ${sizes[3]}",
                                      style: textTheme.titleSmall?.copyWith(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: size.height * 0.058,
                                      ),
                                      width: size.width * 0.4,
                                      height: size.height * 0.04,
                                      // color: Colors.deepPurpleAccent,
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(4.0),
                                            width: size.width * 0.065,
                                            height: size.height * 0.045,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                )),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onTap: () {
                                                setState(() {
                                                  if (current.value > 1) {
                                                    current.value--;
                                                  } else {
                                                    onDelete(current);
                                                    current.value = 1;
                                                  }
                                                });
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                size: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.02),
                                            child: Text(
                                              current.value.toString(),
                                              style: textTheme.titleSmall
                                                  ?.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(4.0),
                                            width: size.width * 0.065,
                                            height: size.height * 0.045,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onTap: () {
                                                setState(() {
                                                  current.value >= 0
                                                      ? current.value++
                                                      : null;
                                                });
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                size: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
                  :

                  /// List is empty
                  Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.42,
                          width: size.width * 0.8,
                          child: Image(
                            image: AssetImage(
                                'assets/images/new/pexels-harsh-raj-gond-1485031.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Text(
                          "Your cart is empty right now :(",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        FadeIn(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainWrapper(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
            ),

            /// Product Prices
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                width: size.width,
                height: size.height * 0.36,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 12.0),
                  child: Column(
                    children: [
                      FadeIn(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Promo/Student Code or Vouchers",
                              style: textTheme.displaySmall
                                  ?.copyWith(fontSize: 16),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      FadeIn(
                          duration: const Duration(milliseconds: 400),
                          child: ReusableCartForRow(
                              price: calculatetotalPrice().toDouble(),
                              text: 'Sub Total')),
                      FadeIn(
                        duration: Duration(milliseconds: 450),
                        child: ReusableCartForRow(
                            price: calculateShipping(), text: 'Shipping'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      FadeIn(
                        duration: Duration(milliseconds: 500),
                        child: ReusableCartForRow(
                            price: calculatetotalPrice(), text: 'Total'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ReUsableButton(
                            text: 'CheckOut',
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Cart(),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "My Cart",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            LineIcons.user,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
