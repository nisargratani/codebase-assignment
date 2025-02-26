import 'package:cached_network_image/cached_network_image.dart';
import 'package:codebase_assignment/app/navigation/routes.dart';
import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:codebase_assignment/feature/user_details/user_details.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.user,
  });

  final UserDetailsEntity user;

  @override
  Widget build(BuildContext context) {
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
  }
}
