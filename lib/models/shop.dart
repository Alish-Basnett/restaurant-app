import 'package:flutter/material.dart';
import 'package:restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  // food menu list
  final List<Food> _foodMenu = [
    // sushi1
    Food(
        name: "Sushi",
        price: "370",
        imagePath: "images/sushi.png",
        rating: "4.8",
        description:
            "Immerse yourself in the world of Japanese culinary mastery with our diverse sushi offerings. From meticulously rolled sushi rolls to melt-in-your-mouth sashimi and delectable nigiri, our sushi menu is a journey of flavors and textures. Crafted with the freshest ingredients, our sushi is a harmonious balance of taste and presentation, making it a must-try for both sushi enthusiasts and newcomers."),

    // pizza
    Food(
        name: "Pizza",
        price: "650",
        imagePath: "images/pizza.png",
        rating: "4.9",
        description:
            "Elevate your taste buds with our artisanal pizzas that blend tradition with creativity. Our pizzas are lovingly prepared, featuring a crisp, golden crust, and an array of mouthwatering toppings. From the timeless Margherita to inventive specialty combinations, our pizza menu offers a slice of Italy for every palate. Experience the joy of indulging in a perfect pizza made just for you."),

    // noodles
    Food(
        name: "Noodles",
        price: "230",
        imagePath: "images/noodles.png",
        rating: "4.5",
        description:
            "Discover the world of noodle delight with our tantalizing noodle dishes. From stir-fried creations to rich, brothy bowls, our noodle menu offers a diverse range of flavors and textures that are sure to captivate your taste buds. Prepared with the freshest ingredients and a touch of culinary magic, our noodle dishes are a satisfying culinary journey for every palate."),

    // burger
    Food(
        name: "Burger",
        price: "360",
        imagePath: "images/burger.png",
        rating: "4.4",
        description:
            "Treat yourself to the ultimate burger experience at our restaurant. Our gourmet burgers are a testament to quality, using locally sourced beef, expert seasoning, and the finest toppings. Whether you crave a classic cheeseburger or prefer daring flavor combinations, our menu has a burger to satisfy your every craving. It's a burger lover's paradise."),

    // fried-potatoes
    Food(
        name: "French Fries",
        price: "250",
        imagePath: "images/fried-potatoes.png",
        rating: "4.7",
        description:
            "Satisfy your craving for the perfect side dish with our French fries. Hand-cut from premium potatoes, our fries are fried to golden perfection and seasoned with a secret blend of spices that keeps you coming back for more. They're the ideal accompaniment to any meal, delivering that timeless, addictive crunch that makes each bite a joy."),

    // ramen
    Food(
        name: "Ramen",
        price: "370",
        imagePath: "images/ramen.png",
        rating: "4.5",
        description:
            "Embark on a savory adventure with our authentic ramen bowls. Crafted with meticulous attention to detail, our ramen features slow-cooked broths, tender slices of meat, and perfectly cooked noodles. From traditional tonkotsu to innovative fusion creations, our ramen menu promises a soul-warming experience that brings the rich flavors of Japan to your table."),

    // sandwich
    Food(
        name: "Sandwich",
        price: "350",
        imagePath: "images/sandwich.png",
        rating: "4.3",
        description:
            "Experience the epitome of sandwich perfection at our establishment. Our sandwiches are a tribute to simplicity and taste, prepared with high-quality ingredients and a touch of culinary finesse. Whether you crave a classic deli sandwich or a gourmet creation, our sandwich menu offers a variety of options to satisfy every craving, all served between slices of freshly baked bread."),

    // fish-and-chips
    Food(
        name: "Fish & Chips",
        price: "420",
        imagePath: "images/fish-and-chips.png",
        rating: "4.9",
        description:
            "Savor the seaside tradition of fish and chips, perfected in our kitchen. Our fish is enveloped in a crispy, golden batter that locks in the moist and flaky goodness, while our hand-cut chips are seasoned to perfection. Enjoy this timeless duo as a standalone treat or with the addition of traditional condiments, offering a taste of classic comfort food that's always a crowd-pleaser.")
  ];

  // customer cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from the cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
