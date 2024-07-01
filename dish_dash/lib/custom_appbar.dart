import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'custom_theme.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback changeLanguageCallback;

  const CustomAppBar({Key? key, required this.title, required this.changeLanguageCallback}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title),
      actions: <Widget>[
        Switch.adaptive(
          value: themeMode == ThemeMode.dark,
          onChanged: (value) {
            ref.read(themeProvider.notifier).toggleTheme(value);
          },
        ),
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: changeLanguageCallback,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}