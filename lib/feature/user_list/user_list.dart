import 'package:cached_network_image/cached_network_image.dart';
import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:codebase_assignment/feature/user_details/user_details.dart';
import 'package:codebase_assignment/feature/user_list/cubit/user_cubit.dart';
import 'package:codebase_assignment/feature/user_list/cubit/user_state.dart';
import 'package:codebase_assignment/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  UserListViewState createState() => UserListViewState();
}

class UserListViewState extends State<UserListView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.maxScrollExtent - 100 <
            _scrollController.offset &&
        !context.read<UserCubit>().hasReachedEnd) {
      context.read<UserCubit>().loadUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UserCubit>().searchQuery(
                      query: value,
                    );
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<UserCubit>().startAgain();
              },
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  List<UserDetailsEntity> users = <UserDetailsEntity>[];
                  bool isLoading = false;

                  if (state is UserLoading) {
                    users = state.oldUsers;
                    isLoading = true;
                  } else if (state is UserLoaded) {
                    users = state.users;
                  } else if (state is UserSearchQuery) {
                    users = state.users;
                  }
                  if (state is UserInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is UserLoading && state.isFirstPage) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UserException) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                      ),
                    );
                  } else {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: users.length +
                          (isLoading && !context.read<UserCubit>().hasReachedEnd
                              ? 1
                              : 0),
                      itemBuilder: (context, index) {
                        if (index >= users.length) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final user = users[index];
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutePaths.userDetails,
                              arguments: UserDetailsArguments(
                                userDetailsEntity: user,
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                              user.avatar,
                            ),
                          ),
                          title: Text('${user.firstName} ${user.lastName}'),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
