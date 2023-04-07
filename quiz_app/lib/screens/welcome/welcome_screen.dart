import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

// ignore: use_key_in_widget_constructors
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/icons/bg.svg'),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bilginizi test etmek için küçük bir quiz yapalım',
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: const Color.fromARGB(255, 254, 254, 254),
                      ),
                    ),
                  ),

                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 65, 116, 193),
                        border: const OutlineInputBorder(),
                        labelText: 'Adınız :',
                        hintText: 'Kullanıcı adınızı girin',
                      ),
                      onChanged: (value) {
                        // metin değiştiğinde yapılacak işlemler
                      },
                      onSubmitted: (value) {
                        // metin gönderildiğinde yapılacak işlemler
                      },
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.blue,
                            Color.fromARGB(255, 0, 75, 132)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('QUİZİ BAŞLAT',
                            style: GoogleFonts.alike(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 254, 254, 254),
                            )),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
