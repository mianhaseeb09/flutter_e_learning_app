import 'package:flutter/material.dart';
import 'package:flutter_e_learning_app/colors/colors.dart';
import 'package:flutter_e_learning_app/colors/padding.dart';
import 'package:flutter_e_learning_app/model/courses_json.dart';
import 'package:flutter_e_learning_app/widgets/custom_heading.dart';
import 'package:flutter_e_learning_app/widgets/custom_my_courses_card.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            const SizedBox(
              height: spacer,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomHeading(
                    title: 'My Courses',
                    subTitle: 'Let`s continue shall we?',
                    color: textBlack),
                Text(
                  '${MyCoursesJson.length} Courses',
                  style: const TextStyle(fontSize: 15, color: secondary),
                )
              ],
            ),
            const SizedBox(
              height: spacer,
            ),
            Column(
              children: List.generate(MyCoursesJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: CustomMyCoursesCard(
                    image: MyCoursesJson[index]['image'],
                    title: MyCoursesJson[index]['title'],
                    instructor: MyCoursesJson[index]['user_name'],
                    videoAmount: MyCoursesJson[index]['video'],
                    percentage: MyCoursesJson[index]['percentage'],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
