import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:squid/application/home/home_bloc.dart';
import 'package:squid/presentation/home/components/add_employee_bottomsheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/edit_employee_bottomsheet.dart';
import 'components/home_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack, overlays: []);

    return BlocProvider.value(
      value: bloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red.withOpacity(0.6),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: const Color.fromRGBO(122, 9, 4, 1),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const AddEmployeeBottomsheet(),
                      );
                    }).then((v) {
                  if (v != null) {
                    String name = v;
                    bloc.add(CreatEmployeeEvent(employeeName: name));
                  }
                });
              },
              child: Stack(children: [
                Positioned(
                  bottom: 5,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: Image.asset(
                      'assets/images/image.png',
                    ),
                  ),
                ),
                const Positioned(
                    bottom: 3,
                    right: 5,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ]),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(height: 56, child: Lottie.asset('assets/lottie/lf30_editor_c8c9sumf.json')),
              ),
            ),
            backgroundColor: Colors.black,
            body: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Builder(builder: (context) {
                    if (state.data?.isNotEmpty ?? false) {
                      return ListView.builder(
                          itemCount: state.data?.length ?? 0,
                          padding: const EdgeInsets.only(top: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      backgroundColor: const Color.fromRGBO(122, 9, 4, 1),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                          child: EditEmployeeBottomsheet(
                                            name: state.data?[index].name ?? "",
                                            id: 0,
                                          ),
                                        );
                                      }).then((v) {
                                    if (v != null) {
                                      String updateName = v;
                                      bloc.add(UpdateEmployeeEvent(index: index, employeeName: updateName));
                                    }
                                  });
                                },
                                child: HomeListItem(
                                  name: state.data?[index].name ?? "",
                                  onDelete: () {
                                    bloc.add(DeleteEmployeeEvent(index: index));
                                  },
                                ));
                          });
                    } else {
                      if (bloc.state.data?.isEmpty ?? false) {
                        return const Positioned(
                            bottom: 50,
                            left: 50,
                            right: 50,
                            child: Text(
                              "Ma'lumotlar yo'q!",
                              style: TextStyle(color: Colors.white),
                            ));
                      }
                    }
                    return const SizedBox();
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
