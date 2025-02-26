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
  final bool isRefresh;
  UserLoading({required this.isRefresh});
}

class UserSuccess extends UserState {
  final List<UserDetailsEntity> users;
  final bool isLastPage;
  UserSuccess(this.users, {required this.isLastPage});
}

class UserFailure extends UserState {
  final String error;
  UserFailure(this.error);
}
