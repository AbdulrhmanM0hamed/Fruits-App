import 'package:e_commerce/features/home/presentation/view/widgets/bottom_nav_bar.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:e_commerce/features/products/produt.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,),
        child: CustomBottomNavBar(pageController: _pageController),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
            });
          },
          children: [
            HomeViewBody(),
            ProdutPage(),
           
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // تأكد من إغلاق الـ PageController عندما لا تحتاجه
    _pageController.dispose();
    super.dispose();
  }
}
