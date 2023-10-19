import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/buttons.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/pages/food_details_page.dart';
import 'package:restaurant/themes/colours.dart';
import 'package:restaurant/components/food_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to the food item detail page
  void navigateToFoodDetails(int index) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 220, 220),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            color: maroon,
          ),
          title: const Text(
            "Kathmandu",
            style: TextStyle(color: maroon),
          ),
          actions: [
            // cart button
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cartpage');
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: maroon,
                ))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promo banner
            Container(
              decoration: BoxDecoration(
                color: primaryColour, // the primaryColour from the theme
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // promo message
                      const Text(
                        "Get 30% off using promo code!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      MyButton(
                        text: "Redeem",
                        onTap: () {},
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'images/sushi.png',
                    height: 100,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Search here.."),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Food Menu",
                style: TextStyle(
                    color: maroon, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // popular food
            Expanded(
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToFoodDetails(index),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            // popular foods
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 243),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "images/sushi1.png",
                        height: 60,
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Salmon Sushi",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rs. ${420}',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),

                      // Heart Icon
                    ],
                  ),
                  const Icon(
                    Icons.favorite_outline,
                    color: Colors.grey,
                    size: 28,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
