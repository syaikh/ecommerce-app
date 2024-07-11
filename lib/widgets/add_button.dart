import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final double width, height;

  const AddButton({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: height,
      width: width,
      child: MaterialButton(
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            Text(
              ' Add to cart',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
