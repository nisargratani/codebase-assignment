import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:codebase_assignment/domain/usecase/fetch_news_list.dart';
import 'package:codebase_assignment/feature/user_list/cubit/user_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final FetchUserListUseCase _fetchUserListUseCase;

  UserCubit(this._fetchUserListUseCase) : super(UserInitial()) {
    loadUsers();
  }

  ///page
  int page = 1;

  ///hasRechedEnd
  bool hasReachedEnd = false;

  List<UserDetailsEntity> allUsers = [];

  ///end of the pagination
  void alertCompleted() {
    final UserState currentState = state;
    if (currentState is UserLoading) {
      emit(
        UserLoaded(
          users: currentState.oldUsers,
        ),
      );
    }
  }

  ///end of the pagination
  void startAgain() {
    emit(
      UserInitial(),
    );
    page = 1;
    hasReachedEnd = false;
    loadUsers();
  }

  Future<void> loadUsers() async {
    if (state is UserLoading) {
      return;
    }

    final UserState currentState = state;

    List<UserDetailsEntity> oldContent = <UserDetailsEntity>[];
    if (currentState is UserLoaded) {
      oldContent = currentState.users;
    } else if (currentState is UserSearchQuery) {
      oldContent = currentState.users;
    }

    emit(
      UserLoading(
        oldUsers: oldContent,
        isFirstPage: page == 1,
      ),
    );

    final result = await _fetchUserListUseCase.execute(
      params: FetchUserListUseCaseParams(
        page: page,
        perPage: 10,
      ),
    );

    result.fold(
      (l) {
        emit(
          UserException(
            message: l.cause.toString(),
          ),
        );
      },
      (r) {
        hasReachedEnd = r.data.isEmpty;
        if (hasReachedEnd) {
          emit(
            UserLoaded(
              users: (state as UserLoading).oldUsers,
            ),
          );
          return;
        }

        page++;

        final List<UserDetailsEntity> homeContentData = oldContent
          ..addAll(
            r.data,
          );

        allUsers = homeContentData;

        emit(
          UserLoaded(
            users: homeContentData,
          ),
        );
      },
    );
  }

  void searchQuery({
    required String query,
  }) {
    if (state is UserLoaded || state is UserSearchQuery) {
      List<UserDetailsEntity> filterUsers = [];
      if (query.isEmpty) {
        filterUsers = allUsers;
      } else {
        filterUsers = allUsers
            .where((user) =>
                (user.firstName.toLowerCase().contains(query.toLowerCase())) ||
                (user.lastName.toLowerCase().contains(query.toLowerCase())))
            .toList();
      }

      if (state is UserLoaded) {
        emit(
          UserSearchQuery(
            users: filterUsers,
          ),
        );
      } else if (state is UserSearchQuery) {
        emit(
          UserLoaded(
            users: filterUsers,
          ),
        );
      }
    }
  }
}
