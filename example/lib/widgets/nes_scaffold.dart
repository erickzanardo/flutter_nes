import 'package:example/advanced/fixed_viewport/page/fixed_viewport_page.dart';
import 'package:example/advanced/rpg_menu/rpg_menu.dart';
import 'package:example/advanced/window_manager/window_manager.dart';
import 'package:example/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';

class NesScaffold extends StatelessWidget {
  const NesScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppCubit>();
    final state = cubit.state;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NesButton(
            type: NesButtonType.normal,
            onPressed: () {
              Navigator.of(context).push(
                FixedViewportPage.route(),
              );
            },
            child: NesIcon(iconData: NesIcons.tv),
          ),
          const SizedBox(height: 16),
          NesButton(
            type: NesButtonType.normal,
            onPressed: () {
              Navigator.of(context).push(
                WindowManagerPage.route(),
              );
            },
            child: NesIcon(iconData: NesIcons.window),
          ),
          const SizedBox(height: 16),
          NesButton(
            type: NesButtonType.normal,
            onPressed: () {
              Navigator.of(context).push(
                RpgMenuPage.route(),
              );
            },
            child: NesIcon(iconData: NesIcons.gamepad),
          ),
          const SizedBox(height: 16),
          NesButton(
            type: NesButtonType.normal,
            onPressed: cubit.toogleLightMode,
            child: state.lightMode
                ? NesIcon(iconData: NesIcons.sun)
                : NesIcon(iconData: NesIcons.moon),
          ),
        ],
      ),
      body: child,
    );
  }
}
