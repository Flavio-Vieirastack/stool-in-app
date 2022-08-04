import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@immutable
class Inject<T> {
  final BuildContext context;
  const Inject(this.context);
  T get() {
    log('Dependency $T', name: 'Dependencies');
    return context.read<T>();
  }
}
