import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/progress_bar.dart';
import 'package:quiz_app/screens/quiz/components/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SvgPicture.asset('assets/icons/bg.svg'),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                const ProgressBar(),
                const SizedBox(height: 20),
                Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          'SORULAR: ${_questionController.questionNumber.value} ',
                      style:
                          const TextStyle(fontSize: 25, color: kSecondaryColor),
                      // default text style
                      children: <TextSpan>[
                        TextSpan(
                            text: '/ ${_questionController.questions.length}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: kDefaultPadding),
                Expanded(
                    child: PageView.builder(
                  // ignore: prefer_const_constructors
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNumber,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
