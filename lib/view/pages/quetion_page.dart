import 'package:exam4/view/pages/add_question_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../controller/question_controller.dart';
import '../../model/question_model.dart';
import '../../style/style.dart';
import '../companents/question_listview.dart';
import '../companents/wraps.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late TextEditingController answerController;
  List<QuestionModel> list = [];
  bool isLoading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppController>().getQuestioninfirebase();
    });
    answerController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<AppController>().isLoading ?
      LoadingAnimationWidget.hexagonDots(color: Style.blueColor, size: 50) :
      Column(
        children: [
          65.verticalSpace,
          // 24.horizontalSpace,
          Row(
            children: [
              20.horizontalSpace,
              const Icon(
                Icons.arrow_back,
                color: Style.blueColor,
              ),
              20.horizontalSpace,
              Text("FAQ",
                  style: Style.textStyleBig(
                      size: 26, textColor: Style.blackColor)),
            ],
          ),

         28.5.verticalSpace,
          SizedBox(height: 38, child: Lists()),
          15.verticalSpace,
          const Expanded(
              child: QuestionListView(),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AddQuestionPage()));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}


