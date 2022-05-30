import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/settings/theme_provider/theme_notifier.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'),),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Change Theme'),
                  // BlocBuilder<ThemeCubit, ThemeState>(
                  //   builder: (context, state) {
                  //     return Switch(
                  //       value: state.isSwitchOn,
                  //       onChanged: (isEnable) {
                  //         BlocProvider.of<ThemeCubit>(context).toggleSwitch(isEnable);
                  //       },
                  //     );
                  //   },
                  // ),
                  Consumer(
                    builder: (context, ref, child) {
                      ThemeState state = ref.watch(themeProvider);
                      return Switch(
                        value: state.isSwitchOn,
                        onChanged: (isEnable) {
                          ref.read(themeProvider.notifier).toggleSwitch(isEnable);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
