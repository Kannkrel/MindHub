// import 'dart:html';
// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page/text_mindHub_and_Salud_mental.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page/widget/button_emergency.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page/widget/button_login.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page/widget/button_register.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/home_page/widget/image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageWidget(),
              const SizedBox(height: 10),
              textMindHubAndSaludMental(),
              const SizedBox(height: 170),
              buttonLogin(context),
              const SizedBox(height: 30),
              buttonRegiester(context),
              const SizedBox(
                height: 40,
              ),
              buttonEmergency(context),
            ],
          ),
        ),
      ),
    );
  }
}
