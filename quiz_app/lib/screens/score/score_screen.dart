import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg"),
          Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              const Text(
                "Score",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              const Spacer(),
              Text(
                "${_qnController.correctAns * 25} / ${_qnController.questions.length * 25}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
