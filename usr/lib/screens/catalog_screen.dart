import 'package:flutter/material.dart';
import '../models/smm_models.dart';
import '../theme.dart';

class ServiceCatalogScreen extends StatelessWidget {
  const ServiceCatalogScreen({super.key});

  static const List<PlatformCategory> categories = [
    PlatformCategory(
      id: 'ig',
      name: 'Instagram',
      iconCode: 'f034d', // Needs mapping to actual FontAwesome or similar if needed. Using standard icons for now.
      gradientColors: [Color(0xFF833AB4), Color(0xFFFD1D1D), Color(0xFFF56040)],
    ),
    PlatformCategory(
      id: 'tk',
      name: 'TikTok',
      iconCode: 'tiktok',
      gradientColors: [Color(0xFF000000), Color(0xFF25F4EE)],
    ),
    PlatformCategory(
      id: 'yt',
      name: 'YouTube',
      iconCode: 'youtube',
      gradientColors: [Color(0xFFFF0000), Color(0xFFCC0000)],
    ),
    PlatformCategory(
      id: 'fb',
      name: 'Facebook',
      iconCode: 'facebook',
      gradientColors: [Color(0xFF1877F2), Color(0xFF0C5A9E)],
    ),
  ];

  static const List<ServicePackage> popularPackages = [
    ServicePackage(
      id: 'ig_fol_1',
      platformId: 'ig',
      title: 'Instagram Followers [HQ]',
      description: 'High quality real looking profiles. Instant start.',
      price: 2.50,
      deliveryTime: '1-3 Hours',
      minQuantity: 100,
      maxQuantity: 10000,
    ),
    ServicePackage(
      id: 'tk_view_1',
      platformId: 'tk',
      title: 'TikTok Views [Fast]',
      description: 'Super fast views for TikTok videos.',
      price: 0.10,
      deliveryTime: 'Instant',
      minQuantity: 1000,
      maxQuantity: 1000000,
    ),
    ServicePackage(
      id: 'yt_sub_1',
      platformId: 'yt',
      title: 'YouTube Subscribers',
      description: 'Non-drop YouTube subscribers.',
      price: 15.00,
      deliveryTime: '1-2 Days',
      minQuantity: 100,
      maxQuantity: 5000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMM Boosting Global'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, User!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Boost Your Social Media',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  _buildBalanceCard(context),
                  const SizedBox(height: 32),
                  Text(
                    'Platforms',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildPlatformCard(context, categories[index]);
                },
                childCount: categories.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Packages',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: _buildPackageCard(context, popularPackages[index]),
                );
              },
              childCount: popularPackages.length,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Available Balance',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '\$124.50',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Add Funds'),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformCard(BuildContext context, PlatformCategory category) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: category.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: category.gradientColors.last.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.campaign, // Placeholder icon
              color: Colors.white,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard(BuildContext context, ServicePackage package) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        package.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '\$${package.price.toStringAsFixed(2)} / 1K',
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPackageStat(Icons.timer_outlined, package.deliveryTime),
                _buildPackageStat(Icons.shopping_cart_outlined, 'Min: ${package.minQuantity}'),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    minimumSize: Size.zero,
                  ),
                  child: const Text('Buy'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageStat(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppTheme.textSecondary),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}
