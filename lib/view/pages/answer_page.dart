import 'package:exam4/controller/question_controller.dart';
import 'package:exam4/model/question_model.dart';
import 'package:exam4/view/companents/custom_textform.dart';
import 'package:exam4/view/companents/on_focus.dart';
import 'package:exam4/view/pages/quetion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../style/style.dart';

class AnswerPage extends StatefulWidget {
  final QuestionModel question;

  const AnswerPage({Key? key, required this.question}) : super(key: key);

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final TextEditingController answerController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return OnUnFocusTap(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Answer", style: Style.textStyleRegular(size: 26)),
        ),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.question.question} ?" ?? "",style: Style.textStyleBig(),),
              24.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomTextFrom(
                    onchange: (e){
                      tap = true;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Please Type the Message";
                      }
                      return null;
                    },
                    controller: answerController, hintext: "Write Answer"),
              ),
              100.verticalSpace,
              InkWell(onTap: () {
                if(formKey.currentState?.validate() ?? false) {
                  context.read<AppController>().createAnswer(
                      answer: answerController.text,
                      id: widget.question.id ?? "0",
                      question: widget.question.question ?? "");
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
                    Text("Send Answer",style: Style.textStyleRegular(textColor: Style.whiteColor),),
                    10.horizontalSpace,
                    Icon(Icons.send,color: Style.whiteColor)
                  ],
                ),
                 ),)
            ],
          ),
        ),
      ),
    );
  }
}
