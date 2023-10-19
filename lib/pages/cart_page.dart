import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/buttons.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/themes/colours.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to the shop
    final shop = context.read<Shop>();

    // remove from the cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColour,
        appBar: AppBar(
          backgroundColor: primaryColour,
          elevation: 0,
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Customer Cart
            Expanded(
              child: value.cart.isEmpty
                  ? Center(
                      child: Text(
                        "Cart is empty. Add from the menu.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        // get food from the cart
                        final Food food = value.cart[index];

                        // get the food's name
                        final String foodName = food.name;

                        // get the food's price
                        final String foodPrice = food.price;

                        // return list tile
                        return Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 146, 85, 81)),
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  foodName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              'Rs. ${foodPrice}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => removeFromCart(food, context),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // Pay Button
            if (value.cart.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(
                  text: "Pay Now",
                  onTap: () {},
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
