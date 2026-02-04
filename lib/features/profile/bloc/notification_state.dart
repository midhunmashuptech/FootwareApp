
import 'package:footware_app/features/profile/model/notification_model.dart';

abstract class NotificationState {}

// Initial state before data loads
class NotificationInitial extends NotificationState {}

// State when Notifications are available
class NotificationLoaded extends NotificationState {
  final Map<String, List<AppNotification>> groupedNotifications;

  NotificationLoaded(this.groupedNotifications);
}
