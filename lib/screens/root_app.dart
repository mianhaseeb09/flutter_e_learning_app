import 'package:flutter/material.dart';
import 'package:flutter_e_learning_app/colors/colors.dart';
import 'package:flutter_e_learning_app/screens/account_screen.dart';
import 'package:flutter_e_learning_app/screens/course_screen.dart';
import 'package:flutter_e_learning_app/screens/explore_screen.dart';
import 'package:flutter_e_learning_app/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomNavigationBar(),
      body: getBody(),
    );
  }

  getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        HomeScreen(),
        CourseScreen(),
        ExploreScreen(),
        AccountScreen(),
      ],
    );
  }

  getBottomNavigationBar() {
    List items = [
      'assets/images/home_icon.svg',
      'assets/images/play_icon.svg',
      'assets/images/rocket_icon.svg',
      'assets/images/user_icon.svg',
    ];
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(color: textWhite, boxShadow: [
        BoxShadow(
            color: textBlack.withOpacity(0.12),
            blurRadius: 30,
            offset: const Offset(0, -10))
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      items[index],
                      height: 17.5,
                      color: pageIndex == index ? primary : secondary,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    pageIndex == index
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            child: Container(
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(100)),
                            ))
                        : Container(),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
