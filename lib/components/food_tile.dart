import 'package:flutter/material.dart';
import '../models/food.dart';
import 'package:restaurant/themes/colours.dart';

class FoodTile extends StatefulWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({Key? key, required this.food, required this.onTap})
      : super(key: key);

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: foodTileBg,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(right: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              widget.food.imagePath, // Access food using widget.
              height: 140,
            ),

            const SizedBox(height: 18),

            // text

            Text(
              widget.food.name,
              style: const TextStyle(
                  color: maroon, fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 42),

            // price & rating

            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price
                  Text(
                    'Rs. ${widget.food.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  Row(children: [
                    // rating
                    const Icon(
                      Icons.star,
                      color: starColour,
                    ),
                    Text(
                      widget.food.rating,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )
                  ])
                ],
              ),
            ),

            // const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
