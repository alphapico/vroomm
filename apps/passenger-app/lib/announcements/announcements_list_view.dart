import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:shimmer/shimmer.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'package:client_shared/components/empty_state_card_view.dart';
import 'package:client_shared/components/list_shimmer_skeleton.dart';

class AnnouncementsListView extends StatelessWidget {
  const AnnouncementsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const VroomBackButton(),
            const SizedBox(height: 16),
            Query(
                options:
                    QueryOptions(document: GET_ANNOUNCEMENTS_QUERY_DOCUMENT),
                builder: (QueryResult result,
                    {Future<QueryResult?> Function()? refetch,
                    FetchMore? fetchMore}) {
                  if (result.isLoading) {
                    return Shimmer.fromColors(
                      baseColor: CustomTheme.neutralColors.shade300,
                      highlightColor: CustomTheme.neutralColors.shade100,
                      enabled: true,
                      child: const ListShimmerSkeleton(),
                    );
                  }
                  final announcements =
                      GetAnnouncements$Query.fromJson(result.data!)
                          .announcements
                          .edges;
                  if (announcements.isEmpty) {
                    return const EmptyStateCard(
                        title: "No Announcements yet!",
                        description:
                            "We will notify you when new announcements comes.",
                        icon: Ionicons.notifications_off_circle);
                  }
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: announcements.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('yyyy-MM-dd').format(
                                        announcements[index].node.startAt),
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(announcements[index].node.title),
                                ],
                              ),
                              subtitle:
                                  Text(announcements[index].node.description)
                                      .pOnly(top: 6),
                            ).pOnly(bottom: 10, top: 8),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
