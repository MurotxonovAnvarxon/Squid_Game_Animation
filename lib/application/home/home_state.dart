part of 'home_bloc.dart';

class HomeState {
  final Status? status;
  final String? errorMessage;
  final List<EmployeeModel>? data;

  HomeState({this.status, this.errorMessage, this.data});

  HomeState copyWith({
    final Status? status,
    final String? errorMessage,
    final List<EmployeeModel>? data,
  }) =>
      HomeState(status: status ?? this.status, errorMessage: errorMessage ?? this.errorMessage, data: data ?? this.data);
}
