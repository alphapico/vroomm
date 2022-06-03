import { FirebaseMessagingService } from '../../nestjs-firebase-admin';
import { Injectable } from '@nestjs/common';
import { PassengerEntity } from '@vroom/database/passenger.entity';
import { OrderMessageEntity } from '@vroom/database/order-message.entity';

@Injectable()
export class PassengerNotificationService {
  constructor(private firebaseMessaging: FirebaseMessagingService) {}

  message(rider: PassengerEntity, message: OrderMessageEntity) {
    if (rider.notificationPlayerId == null) return;
    this.firebaseMessaging.messaging.send({
      token: rider.notificationPlayerId,
      android: {
        notification: {
          sound: 'default',
          titleLocKey: 'notification_new_message_title',
          body: message.content,
          channelId: 'message',
          icon: 'notification_icon',
        },
      },
      apns: {
        payload: {
          aps: {
            sound: 'default',
            badge: 1,
            alert: {
              titleLocKey: 'notification_new_message_title',
              subtitle: message.content,
            },
          },
        },
      },
    });
  }

  canceled(rider: PassengerEntity) {
    this.sendNotification(
      rider,
      'notification_cancel_title',
      'notification_cancel_body',
      'Canceled',
      'Your trip has been canceled'
    );
  }

  accepted(rider: PassengerEntity) {
    this.sendNotification(
      rider,
      'notification_found_title',
      'notification_found_body',
      'Accepted',
      'A driver has accepted your requet'
    );
  }

  bookingAssigned(rider: PassengerEntity, time: string) {
    this.sendNotification(
      rider,
      'notification_booking_assigned_title',
      'notification_booking_assigned_body',
      'Assigned',
      'A driver has been assigned to your trip',
      [time]
    );
  }

  arrived(rider: PassengerEntity) {
    this.sendNotification(
      rider,
      'notification_arrived_title',
      'notification_arrived_body',
      'Arrived',
      'Driver has arrived to your location'
    );
  }

  started(rider: PassengerEntity) {
    this.sendNotification(
      rider,
      'notification_started_title',
      'notification_started_body',
      'Started',
      'Trip has been started'
    );
  }

  waitingForPostPay(rider: PassengerEntity) {
    this.sendNotification(
      rider,
      'notification_waiting_for_pay_title',
      'notification_waiting_for_pay_body',
      'Finished',
      'Waiting for post-pay'
    );
  }

  finished(rider: PassengerEntity) {
    this.sendNotification(
      rider,
      'notification_finished_title',
      'notification_finished_body',
      'Finished',
      'Trip has been finished.'
    );
  }

  private sendNotification(
    rider: PassengerEntity,
    titleLocKey: string,
    bodyLocKey: string,
    titleDefault: string,
    bodyDefault: string,
    bodyLocArgs: string[] = [],
    sound = 'default',
    channelId = 'tripEvents'
  ) {
    if (
      rider.notificationPlayerId == null ||
      rider.notificationPlayerId.length < 5
    )
      return;
    this.firebaseMessaging.messaging.send({
      token: rider.notificationPlayerId,
      android: {
        notification: {
          sound,
          titleLocKey,
          bodyLocKey,
          bodyLocArgs,
          channelId,
          icon: 'notification_icon',
        },
      },
      apns: {
        payload: {
          aps: {
            sound,
            alert: {
              titleLocKey,
              subtitleLocKey: bodyLocKey,
              subtitleLocArgs: bodyLocArgs,
            },
          },
        },
      },
      webpush: {
        notification: {
          title: titleDefault,
          body: bodyDefault,
        },
      },
    });
  }
}
