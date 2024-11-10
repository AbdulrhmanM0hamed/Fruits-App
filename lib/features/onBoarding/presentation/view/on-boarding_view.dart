import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'onBoarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
    PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingItem> items = [
    OnboardingItem(
      bGimage: "assets/images/page_view_item1_background_image.svg" ,
      image: 'assets/images/page_view_item1_image.svg',
      title: 'Welcome to Our App',
      subtitle: 'Discover amazing features and possibilities',
    ),
    OnboardingItem(
      bGimage: "assets/images/page_view_item2_background_image.svg",
      image: 'assets/images/page_view_item2_image.svg',
      title: 'Start Your Journey',
      subtitle: 'Begin exploring our services today',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(item: items[index]);
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                if (_currentPage == items.length - 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to main app
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Start Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      items.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: _currentPage == index
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5, 
          width: double.infinity,// لجعل الخلفية تأخذ نصف الشاشة
          child: SvgPicture.asset(
            item.bGimage,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        // محتوى الصفحة فوق الخلفية
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2), // لإضافة مسافة بعد الخلفية
              SvgPicture.asset(
                item.image,
                height: 300,
              ),
              SizedBox(height: 40),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class OnboardingItem {
 final String bGimage;
  final String image;
  final String title;
  final String subtitle;

  OnboardingItem( {
    required this.bGimage,
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
