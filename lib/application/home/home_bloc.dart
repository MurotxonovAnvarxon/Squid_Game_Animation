import 'package:bloc/bloc.dart';
import 'package:squid/data/employee_model.dart';
import 'package:squid/util/enums.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<CreatEmployeeEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        List<EmployeeModel> list = state.data ?? [];
        list.add(EmployeeModel(name: event.employeeName));
        emit(state.copyWith(data: list, status: Status.success));
      } catch (e) {
        emit(state.copyWith(status: Status.error));
      }
    });

    on<DeleteEmployeeEvent>((event,emit)async{
      List<EmployeeModel> list=state.data??[];
      list.removeAt(event.index);
      emit(state.copyWith(status: Status.success,data: list));
    });

    on<UpdateEmployeeEvent>((event,emit){

      emit(state.copyWith(status: Status.loading));


      try{

        List<EmployeeModel> updateList=state.data??[];
        updateList[event.index]=EmployeeModel(name: event.employeeName);

        emit(state.copyWith(status: Status.success,data: updateList));

      }catch(e){
        emit(state.copyWith(status: Status.error,errorMessage: e.toString()));
      }

    });

  }
}
