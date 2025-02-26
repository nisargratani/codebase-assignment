import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codebase_assignment/app/app_viewmodel.dart';

final appViewModelProvider = Provider.autoDispose<AppViewModel>(
  (ref) {
    return AppViewModel();
  },
);
