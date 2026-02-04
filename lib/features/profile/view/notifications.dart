import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/notification_bloc.dart';
import '../bloc/notification_event.dart';
import '../bloc/notification_state.dart';
import '../widget/notification_card.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationBloc()..add(LoadNotifications()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Notification")),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is NotificationLoaded) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: state.groupedNotifications.entries.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Notification Cards
                      ...entry.value.map(
                        (item) => NotificationCard(
                          icon: item.icon,
                          title: item.title,
                          description: item.description,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
