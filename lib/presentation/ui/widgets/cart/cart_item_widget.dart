import 'package:ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:ecommerce/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title of product',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          _buildColorAndSize(context),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                _buildPriceAndCounter(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorAndSize(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        Text(
          'Color: Black',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey),
        ),
        Text(
          'Size: Large',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPriceAndCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$100',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.themeColor,
              ),
        ),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetsPath.dummyProductImage,
        height: 80,
        width: 80,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}