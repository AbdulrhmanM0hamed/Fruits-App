import 'package:e_commerce/features/home/presentation/view/widgets/best_selling_item.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/best_selling_text.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/custom_list_view.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/grid_view_item.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/custom_home_app_bar.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHomeAppBar(),
                SizedBox(height: 16),
                CustomTextField(),
                SizedBox(height: 16),
                CustomListViewDiscountWidget(),
                SizedBox(height: 8),
                BestSellingText()
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
