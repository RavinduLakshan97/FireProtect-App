import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:location_detecting_app/Model/notification.dart';
import 'package:location_detecting_app/Repository/notification_repository.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Action.dart';
import 'package:location_detecting_app/UI/Fire_Protect_App_Model.dart';

class FireProtectAppBloc extends Bloc<FireProtectAppAction, FireProtectAppModel> {
  final log = Log("FireProtectAppBloc");

  FireProtectAppBloc() {
    add(LoadNotificationAction());
  }

  final _notificationRepository = NotificationRepository();

  StreamSubscription _notificationSubscription;

  @override
  FireProtectAppModel get initialState => FireProtectAppModel(notificationlist: []);

  void _getNotifications(Function(List<Notification>) callback) {
    _notificationSubscription?.cancel();
    _notificationSubscription = _notificationRepository.query(specification: ComplexSpecification([])).listen(callback);
  }

  @override
  Stream<FireProtectAppModel> mapEventToState(FireProtectAppAction action) async* {
    switch (action.runtimeType) {
      case LoadNotificationAction:
        log.d("Notification loading action");
        _getNotifications((notifications) {
          add(NotificationChangedAction(notifications));
        });
        break;

      case NotificationChangedAction:
        final _state = state.clone();
        _state.notificationlist = (action as NotificationChangedAction).notifications;
        _state.notificationlist.sort((list1, list2) => list2.deviceName.compareTo(list1.deviceName));
        yield _state;
        break;
    }
  }
}
