import 'package:cached_network_image/cached_network_image.dart';
import 'package:codebase_assignment/app/extensions/context_extensions.dart';
import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    super.key,
    required this.arguments,
  });

  final UserDetailsArguments arguments;

  @override
  UserDetailsScreenState createState() => UserDetailsScreenState();
}

class UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.arguments.userDetailsEntity?.firstName ?? ''),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.arguments.userDetailsEntity?.avatar ?? '',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.arguments.userDetailsEntity?.firstName} ${widget.arguments.userDetailsEntity?.lastName}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    8.vs,
                    Text(
                      widget.arguments.userDetailsEntity?.email ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class UserDetailsArguments {
  final UserDetailsEntity? userDetailsEntity;

  UserDetailsArguments({
    this.userDetailsEntity,
  });
}
