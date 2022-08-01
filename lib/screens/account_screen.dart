import 'package:flutter/material.dart';
import 'package:flutter_e_learning_app/colors/colors.dart';
import 'package:flutter_e_learning_app/colors/padding.dart';
import 'package:flutter_e_learning_app/model/account_menu_json.dart';
import 'package:flutter_e_learning_app/widgets/custom_heading.dart';
import 'package:flutter_e_learning_app/widgets/custom_place_holder.dart';
import 'package:flutter_e_learning_app/widgets/custom_title.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
    List items = AccountMenuJson[2]['categories'];
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: spacer,
            ),
            const CustomHeading(
              title: 'Account',
              subTitle: 'Student',
              color: secondary,
            ),
            const SizedBox(
              height: spacer,
            ),
            const CustomTitle(
              title: 'Support',
              extend: false,
            ),
            const SizedBox(
              height: spacer,
            ),
            Column(
              children: List.generate(items.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomPlaceHolder(title: items[index]['title']),
                );
              }),
            ),
            const SizedBox(
              height: spacer,
            ),
            Container(
              width: size.width,
              height: 45.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.7),
                borderRadius: BorderRadius.circular(17.5),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(0.5),
                    spreadRadius: 0.0,
                    blurRadius: 6.0,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: textWhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
