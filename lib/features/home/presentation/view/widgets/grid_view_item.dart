import 'package:flutter/material.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/best_selling_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const BestSellingItem();
        },
        childCount: 10, // عدد العناصر
      ),
    );
  }
}