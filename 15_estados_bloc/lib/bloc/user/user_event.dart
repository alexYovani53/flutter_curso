part of 'user_bloc.dart';

abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int age;
  ChangeUserAge(this.age);
}

class AddProfession extends UserEvent {
  final String profession;
  AddProfession( this.profession );
}

class DeleteUser extends UserEvent {}