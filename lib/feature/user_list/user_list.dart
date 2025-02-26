import 'package:codebase_assignment/app/navigation/routes.dart';
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
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<UserCubit>().fetchUsers();
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
                context.read<UserCubit>().searchUsers(value);
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<UserCubit>().fetchUsers(
                      isRefresh: true,
                    );
              },
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserLoading && state.isRefresh) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UserFailure) {
                    return Center(
                      child: Text(
                        'Error: ${state.error}',
                      ),
                    );
                  } else if (state is UserSuccess) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount:
                          state.users.length + (state.isLastPage ? 0 : 1),
                      itemBuilder: (context, index) {
                        if (index >= state.users.length) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final user = state.users[index];
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
                              backgroundImage: NetworkImage(user.avatar)),
                          title: Text('${user.firstName} ${user.lastName}'),
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
