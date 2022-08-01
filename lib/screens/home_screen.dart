import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_learning_app/colors/colors.dart';
import 'package:flutter_e_learning_app/colors/padding.dart';
import 'package:flutter_e_learning_app/model/category_json.dart';
import 'package:flutter_e_learning_app/model/courses_json.dart';
import 'package:flutter_e_learning_app/model/user_profile.dart';
import 'package:flutter_e_learning_app/widgets/clipper.dart';
import 'package:flutter_e_learning_app/widgets/custom_categories_button.dart';
import 'package:flutter_e_learning_app/widgets/custom_category_card.dart';
import 'package:flutter_e_learning_app/widgets/custom_course_card.dart';
import 'package:flutter_e_learning_app/widgets/custom_heading.dart';
import 'package:flutter_e_learning_app/widgets/custom_promotion_card.dart';
import 'package:flutter_e_learning_app/widgets/custom_search_field.dart';
import 'package:flutter_e_learning_app/widgets/custom_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 300,
                  decoration: const BoxDecoration(color: secondary),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: appPadding, right: appPadding),
                child: Column(
                  children: [
                    const SizedBox(
                      height: spacer + 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomHeading(
                          title: 'Hi, Haseeb',
                          subTitle: 'Lets` start learning',
                          color: textWhite,
                        ),
                        SizedBox(
                          height: spacer,
                          width: spacer,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  Image.asset(UserProfile['image'].toString())),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: spacer,
                    ),
                    const CustomSearchField(
                      hintField: 'Try Web Design',
                      backgroundColor: background,
                    ),
                    const SizedBox(
                      height: spacer - 30,
                    ),
                    const CustomCategoryCard(),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: spacer,
          ),
          const CustomPromotionCard(),
          const SizedBox(
            height: spacer,
          ),
          const Padding(
            padding: EdgeInsets.only(left: appPadding, right: appPadding),
            child: CustomTitle(title: 'Feature Course'),
          ),
          const SizedBox(
            height: smallSpacer,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: appPadding, top: 10, bottom: 30),
              child: Row(
                children: List.generate(CoursesJson.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomCourseCardExpand(
                      thumbNail: CoursesJson[index]['image'],
                      videoAmount: CoursesJson[index]['video'],
                      title: CoursesJson[index]['title'],
                      userProfile: CoursesJson[index]['user_profile'],
                      userName: CoursesJson[index]['user_name'],
                      price: CoursesJson[index]['price'],
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: spacer - 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: appPadding, right: appPadding),
            child: CustomTitle(title: 'Categories'),
          ),
          const SizedBox(
            height: smallSpacer,
          ),
          Padding(
            padding: const EdgeInsets.only(left: appPadding),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(CategoryJson.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 10),
                        child: CustomCategoriesButton(
                            title: CategoryJson[index]['title']),
                      );
                    }),
                  ),
                  Row(
                    children: List.generate(CategoryJson2.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 10),
                        child: CustomCategoriesButton(
                            title: CategoryJson2[index]['title']),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: spacer,
          ),
          const Padding(
            padding: EdgeInsets.only(left: appPadding, right: appPadding),
            child: CustomTitle(title: 'Design Course'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: appPadding, top: 10, bottom: 30),
              child: Row(
                children: List.generate(CoursesJson.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomCourseCardExpand(
                      thumbNail: CoursesJson[index]['image'],
                      videoAmount: CoursesJson[index]['video'],
                      title: CoursesJson[index]['title'],
                      userProfile: CoursesJson[index]['user_profile'],
                      userName: CoursesJson[index]['user_name'],
                      price: CoursesJson[index]['price'],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
