// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //customize sweet
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double pearlsValue = 0.5;

  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  void customizePearls(double newValue) {
    setState(() {
      pearlsValue = newValue;
    });
  }

  //add to cart
  void addToCart() {
    //firstly, add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    //direct user back to shop page
    Navigator.pop(context);

    //let user know that it has been successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Successfully added to cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body: Column(children: [
        //drink image
        Image.asset(widget.drink.imagePath),

        //sliders to customize drink
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //sweetness slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Text('Sweet'),
                    width: 100,
                  ),
                  Expanded(
                    child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value)),
                  )
                ],
              ),

              //ice slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text('Ice'),
                  ),
                  Expanded(
                    child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value)),
                  )
                ],
              ),

              //pearls slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: Text('Pearls')),
                  Expanded(
                    child: Slider(
                        value: pearlsValue,
                        label: pearlsValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearls(value)),
                  )
                ],
              ),
            ],
          ),
        ),

        //add to cart button
        MaterialButton(
          onPressed: addToCart,
          child: Text(
            'Add to cart',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.brown,
        )
      ]),
    );
  }
}
