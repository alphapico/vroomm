import { FirebaseMessagingService } from '../../nestjs-firebase-admin';
import { Injectable } from '@nestjs/common';
import { PassengerEntity } from '../../entities/passenger.entity';
import { OrderMessageEntity } from '../../entities/order-message.entity';

@Injectable()
export class PassengerNotificationService {
  constructor(private firebaseMessaging: FirebaseMessagingService) {}

  message(passenger: PassengerEntity, message: OrderMessageEntity) {
    if (passenger.notificationPlayerId == null) return;
    this.firebaseMessaging.messaging.send({
      token: passenger.notificationPlayerId,
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

  canceled(passenger: PassengerEntity) {
    this.sendNotification(
      passenger,
      'notification_cancel_title',
      'notification_cancel_body',
      'Canceled',
      'Your trip has been canceled'
    );
  }

  accepted(passenger: PassengerEntity) {
    this.sendNotification(
      passenger,
      'notification_found_title',
      'notification_found_body',
      'Accepted',
      'A driver has accepted your requet'
    );
  }

  bookingAssigned(passenger: PassengerEntity, time: string) {
    this.sendNotification(
      passenger,
      'notification_booking_assigned_title',
      'notification_booking_assigned_body',
      'Assigned',
      'A driver has been assigned to your trip',
      [time]
    );
  }

  arrived(passenger: PassengerEntity) {
    this.sendNotification(
      passenger,
      'notification_arrived_title',
      'notification_arrived_body',
      'Arrived',
      'Driver has arrived to your location'
    );
  }

  started(passenger: PassengerEntity) {
    this.sendNotification(
      passenger,
      'notification_started_title',
      'notification_started_body',
      'Started',
      'Trip has been started'
    );
  }

  waitingForPostPay(passenger: PassengerEntity) {
    this.sendNotification(
      passenger,
      'notification_waiting_for_pay_title',
      'notification_waiting_for_pay_body',
      'Finished',
      'Waiting for post-pay'
    );
  }

  finished(passenger: PassengerEntity) {
    this.sendNotification(
      passenger,
      'notification_finished_title',
      'notification_finished_body',
      'Finished',
      'Trip has been finished.'
    );
  }

  private sendNotification(
    passenger: PassengerEntity,
    titleLocKey: string,
    bodyLocKey: string,
    titleDefault: string,
    bodyDefault: string,
    bodyLocArgs: string[] = [],
    sound = 'default',
    channelId = 'tripEvents'
  ) {
    if (
      passenger.notificationPlayerId == null ||
      passenger.notificationPlayerId.length < 5
    )
      return;
    this.firebaseMessaging.messaging.send({
      token: passenger.notificationPlayerId,
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
