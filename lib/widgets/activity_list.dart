import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/models/activity.dart';

import 'activity_card.dart';

class ActivityList extends StatefulWidget {
  final List<Activity> listActivity;
  const ActivityList({super.key, required this.listActivity});

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  late Map<String, List<Activity>> groupedList;

  @override
  void initState() {
    groupedList = groupBy(
      widget.listActivity,
      (key) => DateFormat("EEEE").format(key.createdAt),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: groupedList.entries.map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(e.key),
              const SizedBox(height: 8.0),
              Column(
                children: e.value
                    .map(
                      (e) => ActivityCard(activity: e),
                    )
                    .toList(),
              ),
              const SizedBox(height: 8.0),
            ],
          );
        }).toList(),
      ),
    );
  }
}
