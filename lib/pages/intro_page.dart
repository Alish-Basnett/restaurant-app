import 'package:flutter/material.dart';
import 'package:restaurant/components/buttons.dart';
// import 'package:restaurant/pages/menu_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 55),

            // Restaurant's name
            const Text(
              "Hamro Restaurant",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),

            // Icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("images/kitchen.png"),
            ),

            const SizedBox(
              height: 45,
            ),

            // Title
            const Text(
              "THE TASTE OF AUTHENTIC FOOD!",
              style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Sub-title
            const Text(
              "Feel the taste of most popular foods from anywhere anytime.",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 227, 227, 227),
                height: 2,
              ),
            ),

            const SizedBox(
              height: 75,
            ),

            // Get started button
            MyButton(
              text: "Get Started",
              onTap: () {
                // to go to the menu page

                Navigator.pushNamed(context, '/menupage');
              },
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
