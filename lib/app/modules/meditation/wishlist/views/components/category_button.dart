import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constant/constant.dart';
import '../../controllers/wishlist_controller.dart';

class CategoryButton extends GetView<WishlistController> {
  final String category;

  const CategoryButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.updateSelectedCategory(category);
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: controller.selectedCategory.value == category
                ? Primary.mainColor
                : Neutral.light3,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Neutral.dark2),
          ),
          child: Text(
            category,
            style: medium.copyWith(
              fontSize: 12,
              color: controller.selectedCategory.value == category
                  ? Neutral.light4
                  : Neutral.dark2,
            ),
          ),
        ),
      ),
    );
  }
}
