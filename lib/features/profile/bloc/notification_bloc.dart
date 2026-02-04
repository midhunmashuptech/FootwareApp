import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/profile/model/notification_model.dart';
import 'notification_event.dart';
import 'notification_state.dart';
import 'package:flutter/material.dart';

class NotificationBloc
    extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {

    on<LoadNotifications>(_loadNotifications);
  }

 //Notification
  void _loadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) {
    final notifications = [
      AppNotification(
        title: "Big Style Drop!",
        description:
            "New arrivals just landed—shop before they sell out.",
        icon: Icons.local_offer,
        day: "Today",
      ),
      AppNotification(
        title: "Cart Reminder!",
        description:
            "Items in your cart are waiting. Complete your purchase.",
        icon: Icons.shopping_cart,
        day: "Today",
      ),
      AppNotification(
        title: "Wishlist Update",
        description:
            "Good news! An item from your wishlist is back in stock.",
        icon: Icons.favorite,
        day: "Yesterday",
      ),
      AppNotification(
        title: "Rewards Unlocked",
        description:
            "You've earned reward points! Redeem them soon.",
        icon: Icons.card_giftcard,
        day: "Yesterday",
      ),
      AppNotification(
        title: "Limited-Time Offer",
        description:
            "Grab trendy apparel and footwear at special prices.",
        icon: Icons.access_time,
        day: "01 January, 2026",
      ),
    ];

    // Group by day
    final Map<String, List<AppNotification>> grouped = {};
    for (var item in notifications) {
      grouped.putIfAbsent(item.day, () => []);
      grouped[item.day]!.add(item);
    }

    emit(NotificationLoaded(grouped));
  }
}
