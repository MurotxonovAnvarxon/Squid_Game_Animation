import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:squid/application/home/home_bloc.dart';

class HomeListItem extends StatefulWidget {
  const HomeListItem({super.key, required this.name, required this.onDelete});

  final String name;
  final Function onDelete;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            foregroundColor: Colors.red,
            backgroundColor: Colors.transparent,
            onPressed: (context) {
              widget.onDelete();
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.red.withOpacity(0.2)),
          child: Row(
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: Image.asset(
                  'assets/images/image.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "NoName",
                    //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
