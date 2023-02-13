import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam4/controller/question_controller.dart';
import 'package:exam4/view/companents/on_focus.dart';
import 'package:exam4/view/pages/quetion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../style/style.dart';
import '../companents/custom_textform.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({Key? key}) : super(key: key);

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final TextEditingController QuestionController = TextEditingController();
  bool tap = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: Form(
        key: formKey,
        child: OnUnFocusTap(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                65.verticalSpace,
                Row(
                  children: [
                    20.horizontalSpace,
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Style.blueColor,
                      ),
                    ),
                    20.horizontalSpace,
                    Text("Contact Us",
                        style: Style.textStyleBig(
                            size: 26, textColor: Style.blackColor)),
                  ],
                ),
                28.5.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Full Name",
                    style: Style.textStyleRegular(size: 16),
                  ),
                ),
                8.verticalSpace,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFrom(
                    controller: null,
                    hintext: "Full Name",
                  ),
                ),
                24.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Email",
                    style: Style.textStyleRegular(size: 16),
                  ),
                ),
                8.verticalSpace,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFrom(
                    controller: null,
                    hintext: "Email",
                    suffixIcon: Icon(
                      Icons.mail,
                      color: Style.blueColor,
                    ),
                  ),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    28.horizontalSpace,
                    Text(
                      "Message",
                      style: Style.textStyleRegular(size: 16),
                    ),
                    Spacer(),
                    Text(
                      "Max 250 words",
                      style: Style.textStyleRegular(size: 14),
                    ),
                    25.horizontalSpace,
                  ],
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomTextFrom(
                    onchange: (e) {
                      tap = true;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Please Type the Message";
                      }
                      return null;
                    },
                    maxLines: 5,
                    controller: QuestionController,
                    hintext: "Message",
                  ),
                ),
                295.verticalSpace,
                InkWell(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.read<AppController>().createQuestion(
                            question: QuestionController.text,
                          );
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => QuestionPage()));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: tap ? Style.blueColor : Style.offColor,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Send Message",
                          style: Style.textStyleRegular(
                              textColor: Style.whiteColor),
                        ),
                        10.horizontalSpace,
                        Icon(Icons.send, color: Style.whiteColor)
                      ],
                    ),
                  ),
                ),
                48.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
