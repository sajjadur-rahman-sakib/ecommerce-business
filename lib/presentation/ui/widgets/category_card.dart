import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/presentation/ui/screens/product_list_screen.dart';
import 'package:ecommerce/presentation/ui/widgets/widgets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductListScreen(
            categoryName: categoryModel.categoryName ?? '',
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.computer,
              size: 48,
              color: AppColors.themeColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            categoryModel.categoryName ?? '',
            style: const TextStyle(
              color: AppColors.themeColor,
            ),
          )
        ],
      ),
    );
  }
}
