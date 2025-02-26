import 'package:codebase_assignment/data/entity/user_details_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  UserLoading({
    required this.oldUsers,
    required this.isFirstPage,
  });
  final List<UserDetailsEntity> oldUsers;

  ///is first page of the users list api
  final bool isFirstPage;
}

class UserLoaded extends UserState {
  UserLoaded({
    required this.users,
  });
  final List<UserDetailsEntity> users;
}

class UserSearchQuery extends UserState {
  UserSearchQuery({
    required this.users,
  });
  final List<UserDetailsEntity> users;
}

class UserException extends UserState {
  UserException({
    required this.message,
  });
  final String message;
}
