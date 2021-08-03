import 'package:flutter/material.dart';
import 'package:we_gather_application/config/size_config.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget portraitLayout;
  final Widget landscapeLayout;

  const ResponsiveWidget({
    this.portraitLayout,
    this.landscapeLayout,
  });

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.isPortrait && SizeConfig.isMobilePortrait) {
      return portraitLayout;
    } else {
      return landscapeLayout ?? portraitLayout;
    }
  }
}
