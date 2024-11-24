import 'package:ecommerce/presentation/ui/utils/app_colors.dart';
import 'package:ecommerce/presentation/ui/widgets/color_picker.dart';
import 'package:ecommerce/presentation/ui/widgets/product_image_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildProductDetails(),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndSpecification(),
                const SizedBox(height: 4),
                _buildRatingAndReview(),
                const SizedBox(height: 8),
                ColorPicker(
                  colors: const [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.black,
                    Colors.white,
                  ],
                  onColorSelected: (color) {},
                ),
                const SizedBox(height: 8),
                SizePicker(
                  sizes: const [
                    'S',
                    'M',
                    'L',
                    'XL',
                    'XXL',
                  ],
                  onSizeSelected: (String selectedSize) {},
                ),
                const SizedBox(height: 16),
                _buildDescriptionSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          '....................................................',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }

  Widget _buildNameAndSpecification() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'Macbook Air M3 (8/256) 2024',
            style: Theme.of(context).textTheme.titleMedium,
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

  Widget _buildRatingAndReview() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '3',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Reviews',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.themeColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$120',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
