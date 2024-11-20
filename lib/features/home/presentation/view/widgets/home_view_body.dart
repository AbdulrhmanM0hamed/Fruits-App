import 'package:e_commerce/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomHomeAppBar(),
            
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16,),
            
          ),
          
         
          SliverToBoxAdapter(
            child: CustomTextField(),
            
          ),
        ],
      ),
    );
  }
}
