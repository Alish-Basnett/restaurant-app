import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/buttons.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/themes/colours.dart';
import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity count
  int quantityCount = 0;

  // decrement method
  void decrementQuantity() {
    if (quantityCount > 0) {
      setState(() {
        quantityCount--;
      });
    }
  }

  // increment method
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // add to cart method
  addToCart() {
    // add to the cart only if the cart is not empty
    if (quantityCount > 0) {
      // get access to the shop
      final shop = context.read<Shop>();

      // add to the cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text(
            "Successfully Added to Cart!",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: primaryColour,
          actions: [
            // okay button
            IconButton(
                onPressed: () {
                  // pop once to remove the dialog box
                  Navigator.pop(context);
                  // pop again to go to the previous screen
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 111, 111, 111),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView(
                    children: [
                      // image
                      Image.asset(
                        widget.food.imagePath,
                        height: 200,
                      ),

                      const SizedBox(height: 25),

                      // rating
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            widget.food.rating,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      ),

                      const SizedBox(height: 25),

                      // description
                      const Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),

                      const SizedBox(height: 10),

                      // description text
                      Text(
                        widget.food.description,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                            fontSize: 14,
                            height: 1.7),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Positioned widget outside of the Column and Stack
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: primaryColour,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  // price + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        'Rs. ${widget.food.price}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(width: 20),

                      // quantity
                      Row(
                        children: [
                          // minus button
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 180, 75, 70),
                                shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: decrementQuantity,
                            ),
                          ),

                          const SizedBox(
                            width: 5,
                          ),

                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 5,
                          ),

                          // plus button
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 180, 75, 70),
                                shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: incrementQuantity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // add to cart button
                  MyButton(
                    text: "Add to Cart",
                    onTap: addToCart,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
