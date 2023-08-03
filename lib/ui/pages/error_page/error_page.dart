import 'package:flutter/material.dart';
import '../../theme/app_style.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница не найдена'),
      ),
      body: Center(
        child: Text(
          'Ошибка 404',
          style: AppStyle.fontStyle.copyWith(
            color: const Color.fromARGB(255, 54, 40, 34),
          ),
        ),
      ),
    );
  }
}
