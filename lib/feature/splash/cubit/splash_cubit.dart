import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    navigateToUserList();
  }

  void navigateToUserList() {
    Future.delayed(
      Duration(
        seconds: 1,
      ),
    ).then(
      (value) {
        emit(
          SplashNavigating(),
        );
      },
    );
  }
}
