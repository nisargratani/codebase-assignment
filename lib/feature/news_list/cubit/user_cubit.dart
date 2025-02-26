import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:codebase_assignment/domain/usecase/fetch_news_list.dart';
import 'package:codebase_assignment/feature/news_list/cubit/user_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ... existing code ...

class UserCubit extends Cubit<UserState> {
  final FetchUserListUseCase _fetchUserListUseCase;

  UserCubit(this._fetchUserListUseCase) : super(UserInitial()) {
    fetchUsers();
  }

  int _currentPage = 1;
  bool _isLastPage = false;

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _isLastPage = false;
      emit(UserLoading(isRefresh: true));
    } else {
      if (_isLastPage) return;
      emit(UserLoading(isRefresh: false));
    }

    try {
      final result = await _fetchUserListUseCase.execute(
        params: FetchUserListUseCaseParams(
          page: _currentPage,
          perPage: 10,
        ),
      );

      result.fold(
        (failure) => emit(UserFailure(failure.cause.toString())),
        (data) {
          final newUsers = data.data;
          final totalPages = data.totalPages;

          if (isRefresh) {
            // For refresh, just emit new list
            emit(UserSuccess(newUsers, isLastPage: _currentPage >= totalPages));
          } else {
            // For pagination, get current users and append new ones
            final currentState = state;
            if (currentState is UserSuccess) {
              final List<UserDetailsEntity> updatedUsers =
                  List.from(currentState.users)..addAll(newUsers);
              emit(UserSuccess(
                updatedUsers,
                isLastPage: _currentPage >= totalPages,
              ));
            } else {
              emit(UserSuccess(newUsers,
                  isLastPage: _currentPage >= totalPages));
            }
          }

          _isLastPage = _currentPage >= totalPages;
          _currentPage++;
        },
      );
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  void searchUsers(String query) {
    final currentState = state;
    if (currentState is UserSuccess) {
      if (query.isEmpty) {
        // If query is empty, show all users
        emit(UserSuccess(currentState.users, isLastPage: _isLastPage));
        return;
      }

      // Filter users based on first name
      final filteredUsers = currentState.users
          .where((user) =>
              user.firstName.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(UserSuccess(filteredUsers, isLastPage: _isLastPage));
    }
  }
}
