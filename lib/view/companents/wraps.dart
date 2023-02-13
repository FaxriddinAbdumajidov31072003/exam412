import 'package:exam4/controller/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../style/style.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool tap = false;
  int? index;
  List<String> list = [
    "General","Login","Account","Griya","Tips","Category",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: (){
                    context.read<AppController>().changeIndex(index);
                  },
                  child: Container(
                    height: 36.h,
                    width: 86,
                    decoration: BoxDecoration(
                        color: context.read<AppController>().selectIndex==index ? Style.blueColor : Style.whiteColor,
                      borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Style.blueColor,width: 1.2)
                    ),
                    child: Center(child: Text(list[index])),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
