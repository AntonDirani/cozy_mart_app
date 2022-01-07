import 'package:cozy_mart_0/Screens/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:like_button/like_button.dart';

class Body extends StatelessWidget {
  final Product? product;

  const Body({this.product});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.42),
                  padding: EdgeInsets.only(
                    top: size.height * 0.1,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: "Price\n"),
                                TextSpan(
                                  text: '\$${product!.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: "Quantity\n"),
                                  TextSpan(
                                    text: '${product!.quantity}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20 / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          '${product!.description}',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      SizedBox(height: 20 / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: "Phone Number: \n"),
                                  TextSpan(
                                    text: '${product!.phoneNumber}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const LikeButton(
                            size: 40,
                            likeCount: 0,
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xFFFF7EDF),
                              dotSecondaryColor: Color(0xFFFBA6FF),
                              dotThirdColor: Color(0xFFFF7EDF),
                              dotLastColor: Color(0xFFFBA6FF),
                            ),
                            circleColor: CircleColor(
                                start: Color(0xFFFBA6FF),
                                end: Color(0xFFFF7EDF)),
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.add_comment,
                                size: 40,
                                color: Color(0xFFBE93D4),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return Wrap(
                                      children: [
                                        MyComment(),
                                      ],
                                    );
                                  },
                                );
                              }),
                        ],
                      ),
                      SizedBox(height: 20 / 2),

                      //AddToCart(product: product)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      /*Text(
                        product!.title,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),*/
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Hero(
                              tag: "${product!.id}",
                              child: product!.image != null
                                  ? Image.file(product!.image!)
                                  : Text('No Image'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
