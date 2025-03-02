import 'package:codebase_assignment/feature/user_list/cubit/user_cubit.dart';
import 'package:codebase_assignment/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: S.of(context).searchHint,
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {
              _searchController.clear();
              context.read<UserCubit>().searchQuery(
                    query: '',
                  );
            },
            icon: Icon(
              Icons.close,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              24,
            ),
          ),
        ),
        onChanged: (value) {
          context.read<UserCubit>().searchQuery(
                query: value,
              );
        },
      ),
    );
  }
}
