import 'package:flutter/material.dart';
import 'package:mourytech/view/home/widget/logo_section_widget.dart';

class HomeMobileScreenWidget extends StatelessWidget {
  const HomeMobileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        LogoSectionWidget(),
      ],
    );
  }
}