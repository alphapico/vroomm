import 'package:client_shared/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'current_location_cubit.dart';
import 'graphql/generated/graphql_api.dart';

class DriverDistanceSelect extends StatelessWidget {
  const DriverDistanceSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
            document: UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          return BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
            builder: (context, state) {
              return Row(
                children: [
                  const Spacer(),
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: (result?.isLoading ??
                            false || state.radius == null)
                        ? null
                        : () async {
                            if ((state.radius ?? 0) > 1000) {
                              final newDistance = (state.radius ?? 0) - 1000;
                              await runMutation(
                                      UpdateDriverSearchDistanceArguments(
                                              distance: newDistance)
                                          .toJson())
                                  .networkResult;
                              // ignore: use_build_context_synchronously
                              context
                                  .read<CurrentLocationCubit>()
                                  .setRadius(newDistance);
                            }
                          },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: CustomTheme.secondaryColors.shade400,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: const Icon(
                          Icons.remove,
                          size: 32,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                      padding: const EdgeInsets.all(11),
                      color: CustomTheme.primaryColors.shade50,
                      child: Text("${(state.radius ?? 0) / 1000}KM")),
                  CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: (result?.isLoading ??
                            false || state.radius == null)
                        ? null
                        : () async {
                            if ((state.radius ?? 0) < 10000) {
                              final newDistance = (state.radius ?? 0) + 1000;
                              await runMutation(
                                      UpdateDriverSearchDistanceArguments(
                                              distance: newDistance)
                                          .toJson())
                                  .networkResult;
                              // ignore: use_build_context_synchronously
                              context
                                  .read<CurrentLocationCubit>()
                                  .setRadius(newDistance);
                            }
                          },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: CustomTheme.secondaryColors.shade400,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: const Icon(
                          Icons.add,
                          size: 32,
                          color: Colors.white,
                        )),
                  ),
                  const Spacer(),
                ],
              );
            },
          );
        });
  }
}
