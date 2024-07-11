import 'package:flutter/material.dart';
import 'package:myapp/models/brand.dart';

class BrandButton extends StatelessWidget {
  final Brand brand;
  final bool isSelected;

  const BrandButton({
    super.key,
    required this.brand,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2668412305.
    double iconSize = MediaQuery.sizeOf(context).width * 0.05;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.03),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.white : Colors.black38,
        ),
        borderRadius: BorderRadius.circular(15),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: iconSize,
            width: iconSize,
            margin: const EdgeInsets.only(right: 10),
            child: Image.network(
              brand.iconURL,
              color: isSelected ? Colors.white : Colors.black38,
            ),
          ),
          Text(
            brand.name,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
