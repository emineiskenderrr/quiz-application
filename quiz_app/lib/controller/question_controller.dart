import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sampleData
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options']))
      .toList();

  List<Question> get questions => this._questions;

  /*map() yöntemi, her bir öğeyi Question sınıfı türünde bir nesneye dönüştürmek için kullanılır.
 Bu, her bir öğeyi Question sınıfının özelliklerine göre ayarlar. 
 Daha sonra, toList() yöntemi kullanılarak dönüştürülmüş nesnelerin bir listesi oluşturulur ve _questions adlı bir özellikle saklanır.
Son olarak, get işlevi kullanılarak _questions özelliği dışarı aktarılır ve questions adlı özellikle kullanılabilir hale getirilir. */

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns; //doğru cevabın indeksini saklamak için
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

/*RxInt türü ve obs özelliği, 
değişkenin değerindeki değişiklikleri otomatik olarak takip eder. 
Normal bir int değişkeni ile değerindeki değişiklikleri takip etmek için, 
değerin manuel olarak takip edilmesi gerekir. 
Bu durum, uygulamanızda daha fazla kod yazmanıza ve daha fazla hata yapmanıza neden olabilir.
 Son zamanlarda popülerleşmiştir */

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this.numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    //60 sn tamamlandığında bir sonraki soruya geçecek
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(microseconds: 250), curve: Curves.ease);
//sayacı sıfırlar
      _animationController.reset();
//tekrar başlamasını sağlar
//sayaç bittiğnde yeni soruya geçer
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNumber(int index) {
    _questionNumber.value = index + 1;
  }
}




//controller, iş mantığının olduğu, değişkenlerin ve fonksiyonların buradan 
//yönetildiği sınıflardır. Buraya viewden erişilir.
//amaç view ve mantık işlemlerini birbirinden ayırarak
//kontrolü sağlamaktır.
//GetX bunu GetxController aracılığı ile sağlar.
//stateful widget yönetiminde kullanılan initState() ve 
//dispose() yerine getxcontrolelrda onInit ve onClose() vardır.