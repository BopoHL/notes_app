import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/notes_provider.dart';
import '../../app_navigator/app_routes.dart';
import '../../components/notes_body.dart';
import '../../theme/app_style.dart';
import '../../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Заметки',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton.extended(
          onPressed: () {
            model.controllerClear();
            Navigator.pushNamed(context, AppRoutes.addNotes);
          },
          backgroundColor: AppColors.backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          label: const Icon(
            Icons.create_outlined,
            color: AppColors.purpleColor,
          ),
        ),
      ),
      body: const NotesBody(),
    );
  }
}
