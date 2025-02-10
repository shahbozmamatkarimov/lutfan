import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        // title:
        //     Text("Mening buyurtmalarim", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: [
            Tab(text: "Yetkazilmoqda"),
            // Tab(text: "Kutilmoqda"),
            // Tab(text: "Yetkazilgan"),
            Tab(text: "Hammmasi"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ActiveOrdersTab(),
          AllOrdersTab(),
        ],
      ),
    );
  }
}

class ActiveOrdersTab extends StatelessWidget {
  final List<Order> orders = [
    Order(
        id: "#11736446",
        date: "Kecha",
        total: "2 330 000 so‘m",
        address: "Toshkent sh, Mirzo Tursunzoda 42 A"),
    Order(
        id: "#11736446",
        date: "Bugun",
        total: "2 330 000 so‘m",
        address: "Toshkent sh, Mirzo Tursunzoda 42 A"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index]);
      },
    );
  }
}

class AllOrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Barcha buyurtmalar bu yerda ko'rsatiladi"));
  }
}

class OrderCard extends StatefulWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.order.id,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          OrderDetailRow(label: "Yetkazish sanasi", value: widget.order.date),
          OrderDetailRow(
              label: "Topshirilgan joy", value: widget.order.address),
          OrderDetailRow(
              label: "Umumiy summa", value: widget.order.total, isBold: true),
        ],
      ),
    );
  }
}

class OrderDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  OrderDetailRow(
      {required this.label, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class OrderItemTile extends StatelessWidget {
  final OrderItem item;

  OrderItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child:
            Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(item.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Store: ${item.store}", style: TextStyle(color: Colors.purple)),
          SizedBox(height: 4),
          Text("${item.quantity} × ${item.price}"),
        ],
      ),
    );
  }
}

// Models
class Order {
  final String id;
  final String date;
  final String total;
  final String address;
  final List<OrderItem> items;

  Order(
      {required this.id,
      required this.date,
      required this.total,
      required this.address,
      this.items = const []});
}

class OrderItem {
  final String name;
  final String store;
  final String price;
  final String image;
  final int quantity;

  OrderItem(
      {required this.name,
      required this.store,
      required this.price,
      required this.image,
      required this.quantity});
}
