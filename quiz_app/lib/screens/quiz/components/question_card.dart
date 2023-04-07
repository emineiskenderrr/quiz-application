import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: const TextStyle(color: kBlackColor),
          ),
          ...List.generate(
              question.options.length,
              (index) => Answers(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAns(question, index)))
        ],
      ),
    );
  }
}
