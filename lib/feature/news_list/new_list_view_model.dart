import 'package:codebase_assignment/base/base_view_model.dart';
import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:codebase_assignment/domain/usecase/fetch_news_list.dart';

class NewsListViewModel extends BaseViewModel {
  final FetchUserListUseCase _newsListUseCase;
  List<UserDetailsEntity> users = [];
  int currentPage = 1;
  bool isLoading = true;
  bool hasMoreData = true;

  NewsListViewModel(this._newsListUseCase) {
    _fetchUsers(
      FetchUserListUseCaseParams(),
    );
  }

  Future<void> _fetchUsers(
    FetchUserListUseCaseParams params,
  ) async {
    final result = await _newsListUseCase.execute(params: params);
    result.fold((failure) {
      // Handle error case
      isLoading = false;
      notifyListeners();
    }, (newUsers) {
      users.addAll(newUsers.data);

      // hasMoreData = newUsers.;
      isLoading = false;
      notifyListeners();
    });
  }

  void loadMoreUsers() {
    if (!isLoading && hasMoreData) {
      currentPage++;
      _fetchUsers(
        FetchUserListUseCaseParams(),
      );
    }
  }

  void searchUsers(String query) {
    currentPage = 1;
    hasMoreData = true;
  }
}
