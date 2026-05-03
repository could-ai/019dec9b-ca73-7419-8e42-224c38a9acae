import 'package:flutter/material.dart';
import '../models/smm_models.dart';
import '../theme.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static final List<Order> dummyOrders = [
    Order(
      id: 'ORD-8472',
      packageId: 'ig_fol_1',
      link: 'https://instagram.com/myprofile',
      quantity: 5000,
      totalPrice: 12.50,
      status: OrderStatus.inProgress,
      date: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Order(
      id: 'ORD-8451',
      packageId: 'tk_view_1',
      link: 'https://tiktok.com/@myprofile/video/1234',
      quantity: 10000,
      totalPrice: 1.00,
      status: OrderStatus.completed,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Order(
      id: 'ORD-8320',
      packageId: 'yt_sub_1',
      link: 'https://youtube.com/c/mychannel',
      quantity: 500,
      totalPrice: 7.50,
      status: OrderStatus.pending,
      date: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    Order(
      id: 'ORD-8105',
      packageId: 'ig_like_1',
      link: 'https://instagram.com/p/12345',
      quantity: 2000,
      totalPrice: 4.00,
      status: OrderStatus.cancelled,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1.0,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              isScrollable: true,
              labelColor: AppTheme.primaryColor,
              unselectedLabelColor: AppTheme.textSecondary,
              indicatorColor: AppTheme.primaryColor,
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'In Progress'),
                Tab(text: 'Completed'),
                Tab(text: 'Pending'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrderList(context, dummyOrders),
                  _buildOrderList(context, dummyOrders.where((o) => o.status == OrderStatus.inProgress).toList()),
                  _buildOrderList(context, dummyOrders.where((o) => o.status == OrderStatus.completed).toList()),
                  _buildOrderList(context, dummyOrders.where((o) => o.status == OrderStatus.pending).toList()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, List<Order> orders) {
    if (orders.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: AppTheme.textSecondary),
            SizedBox(height: 16),
            Text(
              'No orders found',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _buildOrderCard(context, orders[index]);
      },
    );
  }

  Widget _buildOrderCard(BuildContext context, Order order) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (order.status) {
      case OrderStatus.pending:
        statusColor = Colors.orange;
        statusText = 'Pending';
        statusIcon = Icons.hourglass_empty;
        break;
      case OrderStatus.inProgress:
        statusColor = Colors.blue;
        statusText = 'In Progress';
        statusIcon = Icons.sync;
        break;
      case OrderStatus.completed:
        statusColor = AppTheme.secondaryColor;
        statusText = 'Completed';
        statusIcon = Icons.check_circle_outline;
        break;
      case OrderStatus.cancelled:
        statusColor = Colors.red;
        statusText = 'Cancelled';
        statusIcon = Icons.cancel_outlined;
        break;
    }

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.id,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: statusColor.withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 12, color: statusColor),
                      const SizedBox(width: 4),
                      Text(
                        statusText,
                        style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Package ID: ${order.packageId}', // In a real app, map this to the package name
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              order.link,
              style: const TextStyle(color: Colors.blue, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quantity', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(
                      NumberFormat.compact().format(order.quantity),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Charge', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(
                      '\$${order.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Date', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(
                      DateFormat('MMM d, yyyy').format(order.date),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
