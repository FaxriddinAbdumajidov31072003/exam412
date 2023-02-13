import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../controller/question_controller.dart';
import '../../style/style.dart';
import '../pages/answer_page.dart';

class QuestionListView extends StatefulWidget {
  const QuestionListView({Key? key}) : super(key: key);

  @override
  State<QuestionListView> createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  late TextEditingController answerController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppController>().getQuestioninfirebase();
    });
    print(context.read<AppController>().listofquestions.length);
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
    var state = context.read<AppController>();
    var lim = context.watch<AppController>();
    return  ListView.builder(
        itemCount: state.listofquestions.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: const ValueKey(0),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: const [
                SlidableAction(
                  onPressed: null,
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border:
                    Border.all(width: 1.2, color: Style.blueColor)),
                child: ExpansionTile(
                    childrenPadding: const EdgeInsets.all(8.0),
                    leading: Icon(Icons.question_mark_outlined),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${state.listofquestions[index].question} ?',
                            style: Style.textStyleRegular(
                                size: 18, textColor: Style.blackColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                builder: (_) => AnswerPage(
                                  question: state
                                      .listofquestions[index],
                                )));
                          },
                          icon: Icon(Icons.shortcut_outlined),
                        ),
                      ],
                    ),
                    children: [
                      Row(children: const <Widget>[
                        Expanded(
                            child: Divider(
                              thickness: 1.4,
                              color: Style.labelColor,
                            )),
                      ]),
                      5.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.horizontalSpace,
                          Icon(Icons.question_answer_outlined),
                          25.horizontalSpace,
                          state.listofquestions[index].answer ==
                              'Not Answer !'
                              ? Text(
                            "${state.listofquestions[index].answer}",
                            style: Style.textStyleRegular(
                                size: 16,
                                textColor: Style.notanswerColor),
                          )
                              : Expanded(
                            child: Text(
                              "${state.listofquestions[index].answer} !",
                              style: Style.textStyleRegular(
                                  size: 16,
                                  textColor: Style.answerColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ]
                  // Some list of List Tile's or widget of that kind,
                ),
              ),
            ),
          );
        });
  }
}
