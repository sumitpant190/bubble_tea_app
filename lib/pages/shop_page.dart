import 'package:bubble_tea_app/models/shop.dart';
import 'package:bubble_tea_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/drink_tile.dart';
import '../models/drink.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //user selected a drnk , go to order page
  void goToOrderPage(Drink drink) {
    //navigate to order page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          drink: drink,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    //heading
                    Text(
                      'Bubble Tea Shop',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //list of drinks for sale
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.shop.length,
                          itemBuilder: (context, index) {
                            //get individual drink from shop first
                            Drink individualDrink = value.shop[index];

                            // return that drink as a nice tile
                            return DrinkTile(
                              drink: individualDrink,
                              onTap: () => goToOrderPage(individualDrink),
                              trailing: Icon(Icons.arrow_forward),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ));
  }
}
