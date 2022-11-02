import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'chat_cubit.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.dart';
import '../query_result_view.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:url_launcher/url_launcher.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      lazy: false,
      child: Builder(builder: (context) {
        return Scaffold(
          body: Query(
              options: QueryOptions(
                  document: GET_MESSAGES_QUERY_DOCUMENT,
                  fetchPolicy: FetchPolicy.noCache),
              builder: (QueryResult result,
                  {Future<QueryResult?> Function()? refetch,
                  FetchMore? fetchMore}) {
                if (result.isLoading || result.hasException) {
                  return QueryResultView(result);
                }
                var cubit = context.read<ChatCubit>();

                var order = GetMessages$Query.fromJson(result.data!)
                    .driver!
                    .orders
                    .nodes
                    .first;
                var messages = order.conversations
                    .map((e) => e.toTextMessage(order.passenger, order.driver))
                    .toList();
                cubit.setMessages(messages);
                return Subscription(
                    options: SubscriptionOptions(
                        document: NEW_MESSAGE_RECEIVED_SUBSCRIPTION_DOCUMENT,
                        fetchPolicy: FetchPolicy.noCache),
                    builder: (QueryResult subscriptionResult) {
                      if (subscriptionResult.data != null) {
                        var message = NewMessageReceived$Subscription.fromJson(
                                subscriptionResult.data!)
                            .newMessageReceived
                            .toTextMessage(order.passenger, order.driver);
                        cubit.addMessage(message);
                      }
                      return Mutation(
                          options: MutationOptions(
                              document: SEND_MESSAGE_MUTATION_DOCUMENT,
                              fetchPolicy: FetchPolicy.noCache),
                          builder: (RunMutation runMutation,
                              QueryResult? mutationResult) {
                            return BlocBuilder<ChatCubit,
                                List<types.TextMessage>>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    SafeArea(
                                        minimum: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            const VroomBackButton(),
                                            const Spacer(),
                                            CupertinoButton(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: CustomTheme
                                                          .neutralColors
                                                          .shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Icon(
                                                    Ionicons.call,
                                                    color: CustomTheme
                                                        .neutralColors.shade600,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  launchUrl(Uri.parse(
                                                      "tel://${order.passenger.mobileNumber}"));
                                                })
                                          ],
                                        )),
                                    Expanded(
                                      child: Chat(
                                          messages: state,
                                          theme: DefaultChatTheme(
                                              primaryColor:
                                                  CustomTheme.primaryColors,
                                              backgroundColor: CustomTheme
                                                  .primaryColors.shade50,
                                              inputBackgroundColor: CustomTheme
                                                  .neutralColors.shade200,
                                              inputTextColor: Colors.black),
                                          onSendPressed: (text) async {
                                            var args = SendMessageArguments(
                                                    content: text.text,
                                                    orderId: order.id)
                                                .toJson();
                                            var result = await runMutation(args)
                                                .networkResult;
                                            var message =
                                                SendMessage$Mutation.fromJson(
                                                    result!.data!);
                                            cubit.addMessage(message
                                                .createOneOrderMessage
                                                .toTextMessage(order.passenger,
                                                    order.driver));
                                          },
                                          user: order.driver.toUser()),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                    });
              }),
        );
      }),
    );
  }
}

extension ChatDriverExtension on ChatDriverMixin {
  types.User toUser() => types.User(
      id: 'd$id',
      firstName: firstName,
      lastName: lastName,
      imageUrl: media == null ? null : serverUrl + media!.address);
}

extension ChatPassengerExtension on ChatPassengerMixin {
  types.User toUser() => types.User(
      id: 'r$id',
      firstName: firstName,
      lastName: lastName,
      imageUrl: media == null ? null : serverUrl + media!.address);
}

extension ChatMeessageExtension on ChatMessageMixin {
  types.TextMessage toTextMessage(
          ChatPassengerMixin passenger, ChatDriverMixin driver) =>
      types.TextMessage(
          id: id,
          text: content,
          author: sentByDriver ? driver.toUser() : passenger.toUser());
}
