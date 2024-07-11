import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/widgets/add_button.dart';
import 'package:myapp/widgets/size_button.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline),
        ),
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        _productImage(context),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        _productDetails(context),
      ],
    );
  }

  Widget _productImage(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.40,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(product.image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _productDetails(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
          horizontal: MediaQuery.sizeOf(context).width * 0.05,
        ),
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productTitleAndReviews(),
              _productPrice(context),
              _productDescription(context),
              _sizeSelector(context),
              _addToCartButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productTitleAndReviews() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          product.name,
          textScaler: const TextScaler.linear(1.4),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '⭐ ${product.rating.toString()}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }

  Widget _productPrice(BuildContext context) {
    return Text(
      '\$${product.price.toString()}',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _productDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.05,
      ),
      child: Text(product.description),
    );
  }

  Widget _sizeSelector(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: const Text('Select a size'),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizeButton(size: 8),
            SizeButton(size: 9),
            SizeButton(
              size: 10,
              isSelected: true,
            ),
            SizeButton(size: 11),
            SizeButton(size: 14),
          ],
        ),
      ],
    );
  }

  Widget _addToCartButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.02,
      ),
      child: AddButton(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.05,
      ),
    );
  }
}
