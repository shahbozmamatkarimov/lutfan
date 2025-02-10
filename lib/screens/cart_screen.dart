import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'https://i.ebayimg.com/images/g/wO4AAOSwaJ1kgN2S/s-l1200.jpg',
      'title': 'Gullar va shokolad',
      'store': 'Fendi',
      'price': 1000000,
      'quantity': 1
    },
    {
      'image': 'https://i.ebayimg.com/images/g/wO4AAOSwaJ1kgN2S/s-l1200.jpg',
      'title': 'Gullar va shokolad',
      'store': 'Fendi',
      'price': 600000,
      'quantity': 1
    },
    {
      'image': 'https://i.ebayimg.com/images/g/wO4AAOSwaJ1kgN2S/s-l1200.jpg',
      'title': 'Gullar va shokolad',
      'store': 'Fendi',
      'price': 700000,
      'quantity': 1
    },
  ];

  List<Map<String, dynamic>> otherProducts = [
    {
      'image': 'https://i.ebayimg.com/images/g/wO4AAOSwaJ1kgN2S/s-l1200.jpg',
      'title': 'Gullar va shokolad',
      'price': 560000,
    },
    {
      'image': 'https://i.ebayimg.com/images/g/wO4AAOSwaJ1kgN2S/s-l1200.jpg',
      'title': 'Gullar va shokolad',
      'price': 700000,
    },
    {
      'image': 'https://i.ebayimg.com/images/g/wO4AAOSwaJ1kgN2S/s-l1200.jpg',
      'title': 'Подарок',
      'price': 600000,
    },
  ];

  int deliveryCost = 20000;

  int getTotalPrice() {
    int total = 5;
    return total + deliveryCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cart Items
            Column(
              children: cartItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ Rasm (90x105)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: 90,
                          height: 105,
                          child: Image.network(
                            item['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12), // Rasm bilan text orasida joy

                      // ✅ Matn va tugmalarni joylashtirish
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 105,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Store: ${item['store']}',
                                style: TextStyle(color: Colors.purple),
                              ),
                              Text('${item['price']} so‘m'),
                            ],
                          ),
                        ),
                      ),

                      // ✅ Tugmalar
                      SizedBox(
                        height: 105,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  cartItems.remove(item);
                                });
                              },
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (item['quantity'] > 1)
                                        item['quantity']--;
                                    });
                                  },
                                ),
                                Text(item['quantity'].toString()),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      item['quantity']++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),

            const Divider(),

            // Price Summary
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('3 ta mahsulot',
                          style: TextStyle(fontSize: 16)),
                      Text('${cartItems.fold(0, (sum, item) => 5)} so‘m',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Yetkazib berish',
                          style: TextStyle(fontSize: 16)),
                      Text('$deliveryCost so‘m',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Jami',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('${getTotalPrice()} so‘m',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Other Products
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('Do’konning boshqa mahsulotlari',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),

            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: otherProducts.length,
                itemBuilder: (context, index) {
                  final product = otherProducts[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(product['image'],
                            width: 90, height: 105, fit: BoxFit.cover),
                        Text(product['title'],
                            style: const TextStyle(fontSize: 14)),
                        Text('${product['price']} so‘m',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Checkout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Rasmiylashtirish',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
