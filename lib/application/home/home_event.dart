part of 'home_bloc.dart';

class HomeEvent {}

class CreatEmployeeEvent extends HomeEvent {
  final String employeeName;

  CreatEmployeeEvent({required this.employeeName});
}

class DeleteEmployeeEvent extends HomeEvent{
  final int index;

  DeleteEmployeeEvent({required this.index});
}

class UpdateEmployeeEvent extends HomeEvent{
  final int index;
  final String  employeeName;

  UpdateEmployeeEvent({required this.index, required this.employeeName});
}