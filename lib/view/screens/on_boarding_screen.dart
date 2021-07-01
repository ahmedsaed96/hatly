import 'package:flutter/material.dart';
import 'package:shop_abdullah_mansour/models/onboarding_item_model.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';
import 'package:shop_abdullah_mansour/register_and_login/login_screen.dart';

class OnBoardingscreen extends StatefulWidget {
  @override
  _OnBoardingscreenState createState() => _OnBoardingscreenState();
}

class _OnBoardingscreenState extends State<OnBoardingscreen> {
  List<OnBoardingItem> onBoardingList = [
    OnBoardingItem(
      index: 0,
      image:
          'https://static.toiimg.com/thumb/resizemode-75,msid-65119881,width-800,height-450/65119881.jpg',
      subtitle: 'this is  SubTitle 1',
      title: 'this is  Titile 1',
    ),
    OnBoardingItem(
      index: 1,
      image:
          'https://static.toiimg.com/thumb/resizemode-75,msid-65119881,width-800,height-450/65119881.jpg',
      subtitle: 'this is  SubTitle 2',
      title: 'this is  Titile 2',
    ),
    OnBoardingItem(
      index: 2,
      image:
          'https://static.toiimg.com/thumb/resizemode-75,msid-65119881,width-800,height-450/65119881.jpg',
      subtitle: 'this is  SubTitle 3',
      title: 'this is  Titile 3',
    ),
  ];
  PageController pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                  (route) => false);
            },
            child: const Text('Skip'),
          )
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: onBoardingList.length,
          onPageChanged: (int ind) {
            setState(() {
              index = ind;
            });
          },
          itemBuilder: (context, index) => buildOnBoardingItem(
              onBoardingList[index],
              pageController,
              onBoardingList.length,
              index),
        ),
      ),
    );
  }

  Padding buildOnBoardingItem(OnBoardingItem onBoardingList,
      PageController controller, int length, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(onBoardingList.image, fit: BoxFit.cover),
          ),
          buildText(onBoardingList.title, 40.0, buildTitleStyle()),
          buildText(onBoardingList.subtitle, 30.0, buildSubTitleStyle()),
          SizedBox(
            height: 60.0,
            child: Row(
              children: [
                Row(
                  children: [
                    buildIndictorDot(
                        //TODO:(change condition) =>this condition is stubid but good for now;
                        onBoardingList.index == 0 ? defaultColor : Colors.grey),
                    buildIndictorDot(
                        onBoardingList.index == 1 ? defaultColor : Colors.grey),
                    buildIndictorDot(
                        onBoardingList.index == 2 ? defaultColor : Colors.grey),
                  ],
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (index == length - 1) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                          (route) => false);
                    } else {
                      controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutQuad);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildText(String onBoardingList, double height, TextStyle style) {
    return SizedBox(
      height: height,
      child: Text(onBoardingList, style: style),
    );
  }

  TextStyle buildTitleStyle() {
    return const TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0);
  }

  TextStyle buildSubTitleStyle() =>
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0);

  Padding buildIndictorDot(MaterialColor color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 13.0,
        width: 13.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
