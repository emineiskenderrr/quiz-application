import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.home, color: Color.fromARGB(255, 246, 246, 246)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text('Skip'),
          )
        ],
      ),
      body: Body(),
    );
  }
}
