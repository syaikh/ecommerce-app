import 'package:flutter/material.dart';
import 'package:myapp/data.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/pages/product_page.dart';
import 'package:myapp/widgets/brand_button.dart';
import 'package:myapp/widgets/product_card.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _topBar(context),
            _title(),
            _searchField(context),
            _categoriesList(context),
            _productsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=62'),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Discover\n',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Get the best sneakers here',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.08,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.04,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.search,
            color: Colors.black26,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search your favorites',
                hintStyle: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesList(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: BrandButton(brand: brands[index], isSelected: index == 1),
          );
        },
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return WaterDropNavBar(
      backgroundColor: Colors.white,
      bottomPadding: MediaQuery.sizeOf(context).height * 0.02,
      waterDropColor: Theme.of(context).colorScheme.primary,
      selectedIndex: 1,
      onItemSelected: (index) {},
      barItems: [
        BarItem(
          filledIcon: Icons.home,
          outlinedIcon: Icons.home_outlined,
        ),
        BarItem(
            filledIcon: Icons.shopping_bag,
            outlinedIcon: Icons.shopping_bag_outlined),
      ],
    );
  }

  Widget _productsGrid(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ProductCard(
            product: product,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
              vertical: MediaQuery.sizeOf(context).height * 0.02,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductPage(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
