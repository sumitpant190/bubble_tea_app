import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //heading
                    Text(
                      'Your Cart',
                      style: TextStyle(fontSize: 20),
                    ),

                    //list of Cart items
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.cart.length,
                          itemBuilder: (context, index) {
                            //get individual drink in the cart first
                            Drink drink = value.cart[index];

                            //return as a nice tile
                            return DrinkTile(
                              drink: drink,
                              onTap: () => removeFromCart(drink),
                              trailing: Icon(Icons.delete),
                            );
                          }),
                    ),

                    // pay button
                    MaterialButton(
                      child: Text(
                        'Pay',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.brown,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ));
  }
}
