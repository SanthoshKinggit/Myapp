// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../cart/checkout_screen.dart';


class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems;
  }

  void removeItem(int index) {
    CartItem item = cartItems[index];
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(
        cartItem: item,
        onRemove: () {
          setState(() {
            cartItems.removeAt(index);
          });
          Navigator.pop(context); // Close the bottom sheet
        },
      ),
    );
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(

        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
       backgroundColor: Theme.of(context).primaryColor,
       centerTitle: true,
        title: const Text('My Cart', style: TextStyle( fontFamily: 'Nunito',color: Colors.white,fontWeight: FontWeight.bold)),
        actions: const [
         ImageIcon(AssetImage("assets/images/service/searchicon.png"),color: Colors.white,),
         SizedBox(width: 10,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                CartItem item = cartItems[index];
                double totalPrice = item.price * item.quantity;

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Left side: Image
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 235, 234, 233),
                            image: DecorationImage(
                              image: AssetImage(item.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Right side: Column for name, price, quantity
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Row 1: Name and Remove Icon
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                       fontFamily: 'Nunito',
                                      color: Color.fromARGB(255, 1, 15, 39),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Theme.of(context).primaryColor,),
                                    onPressed: () => removeItem(index),
                                  ),
                                ],
                              ),
                              // Row 2: Price and Quantity Controls
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${totalPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                       fontFamily: 'Nunito',
                                      color: Color.fromARGB(255, 1, 15, 39),
                                      fontSize: 16,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 235, 234, 233),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove, color: Color.fromARGB(255, 1, 15, 39)),
                                          onPressed: () => decreaseQuantity(index),
                                        ),
                                        Text(
                                          '${item.quantity}',
                                          style: const TextStyle(
                                             fontFamily: 'Nunito',
                                            color: Color.fromARGB(255, 1, 15, 39),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add, color: Color.fromARGB(255, 1, 15, 39)),
                                          onPressed: () => increaseQuantity(index),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle( fontFamily: 'Nunito',color: Color.fromARGB(255, 212, 212, 212)),
                    ),
                    Text(
                      '\$${getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle( fontFamily: 'Nunito',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 15, 39),
                      ),
                    ),
                  ],
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutScreen()),
              );
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  label: const Row(
                    children: [
                      Text('Checkout', style: TextStyle( fontFamily: 'Nunito',color: Colors.white),), 
                      SizedBox(width: 8), 
                      Icon(Icons.arrow_forward_ios, color: Colors.white,), 
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String imageUrl;
  final String name;
  final String size;
  final double price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}

class BottomSheetWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;

  BottomSheetWidget({required this.cartItem, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
  color: Color.fromARGB(255, 252, 248, 248),
     borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15), // Top-left corner radius
      topRight: Radius.circular(15), // Top-right corner radius
    ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Remove from cart?",
            style: TextStyle( fontFamily: 'Nunito',fontSize: 18, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 1, 15, 39)),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Border radius for the card
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(cartItem.imageUrl, width: 50, height: 50),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem.name, style: const TextStyle( fontFamily: 'Nunito',fontSize: 16,color: Color.fromARGB(255, 1, 15, 39))),
                        Text('\$${cartItem.price.toStringAsFixed(2)}', style: const TextStyle( fontFamily: 'Nunito',fontSize: 14,color: Color.fromARGB(255, 1, 15, 39))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
         
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 231, 229, 229),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Border radius for the button
                    ),
                  ),
                  child: const Text('Cancel', style: TextStyle( fontFamily: 'Nunito',color: Color.fromARGB(255, 1, 15, 39)),),
                ),
              ),
           const SizedBox(width: 5,),
              Expanded(
                child: ElevatedButton(
                  onPressed: onRemove,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                             
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Border radius for the button
                    ),
                  ),
                  child: const Text('Remove', style: TextStyle( fontFamily: 'Nunito',color: Colors.white),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
