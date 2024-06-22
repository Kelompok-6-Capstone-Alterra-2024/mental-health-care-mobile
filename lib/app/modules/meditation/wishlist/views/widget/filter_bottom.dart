import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

import '../../../../../../constant/constant.dart';
import '../../controllers/wishlist_controller.dart';
import '../components/category_button.dart';

class FilterBottomSheet extends GetView<WishlistController> {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 247,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
          color: Neutral.light4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter',
                style: semiBold.copyWith(fontSize: 16, color: Neutral.dark1),
              ),
              const Gap(11),
              Text(
                'Pilih kategori meditasi',
                style: regular.copyWith(fontSize: 16, color: Neutral.dark3),
              ),
              const Gap(16),
              Row(
                children: [
                  CategoryButton(category: 'music'),
                  const Gap(8),
                  CategoryButton(category: 'articles'),
                  const Gap(8),
                  CategoryButton(category: 'storys'),
                ],
              ),
              const Gap(16),
              Container(
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                  color: Primary.mainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.back();
                    controller.updateSelectedCategory(
                        controller.selectedCategory.value);
                  },
                  child: Text(
                    'Pilih',
                    style:
                        semiBold.copyWith(fontSize: 16, color: Neutral.light4),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
