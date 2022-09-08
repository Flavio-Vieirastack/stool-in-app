import 'package:flutter/material.dart';

import '../../../../stool_ds.dart';

enum ButtonTypes {
  primary,
  secondary,
  disabled,
  loading,
}

enum Teste {
  primary(colors: AppColors.black);

  final Color colors;
  const Teste({required this.colors});
}
