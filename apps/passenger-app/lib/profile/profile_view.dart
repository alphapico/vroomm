import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import '../generated/l10n.dart';
import 'package:client_shared/theme/theme.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../main/bloc/jwt_cubit.dart';
import '../main/bloc/passenger_profile_cubit.dart';
import '../query_result_view.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late GetPassenger$Query$Passenger passenger;

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(document: UPDATE_PROFILE_MUTATION_DOCUMENT),
        builder: (
          RunMutation runMutation,
          QueryResult? result,
        ) {
          return Scaffold(
              body: SafeArea(
                  minimum: const EdgeInsets.all(16),
                  child: Query(
                      options: QueryOptions(
                          document: GET_PASSENGER_QUERY_DOCUMENT,
                          fetchPolicy: FetchPolicy.noCache),
                      builder: (QueryResult result,
                          {Future<QueryResult?> Function()? refetch,
                          FetchMore? fetchMore}) {
                        if (result.hasException || result.isLoading) {
                          return QueryResultView(result);
                        }
                        passenger = GetPassenger$Query.fromJson(result.data!)
                            .passenger!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const VroomBackButton(),
                                const Spacer(),
                                PopupMenuButton(itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: const Text("Delete Account"),
                                      onTap: () {
                                        Future.delayed(
                                            const Duration(seconds: 0),
                                            () => showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext ncontext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Account deletion"),
                                                    content: const Text(
                                                        "Are you sure you want to delete your account? You can login again within 30 days to restore the account. After this period your data gets completely removed including all your remaining credits."),
                                                    actions: [
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8),
                                                            child: Mutation(
                                                                options: MutationOptions(
                                                                    document:
                                                                        DELETE_USER_MUTATION_DOCUMENT),
                                                                builder: (RunMutation
                                                                        runMutation,
                                                                    QueryResult?
                                                                        result) {
                                                                  return TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        await runMutation({})
                                                                            .networkResult;
                                                                        await Hive.box('user')
                                                                            .delete('jwt');
                                                                        await Hive.box('user')
                                                                            .delete('jwt');
                                                                        context
                                                                            .read<PassengerProfileCubit>()
                                                                            .updateProfile(null);
                                                                        context
                                                                            .read<JWTCubit>()
                                                                            .logOut();
                                                                        await Hive.box('user')
                                                                            .delete('jwt');
                                                                        context
                                                                            .read<PassengerProfileCubit>()
                                                                            .updateProfile(null);
                                                                        context
                                                                            .read<JWTCubit>()
                                                                            .logOut();
                                                                        Navigator.popUntil(
                                                                            context,
                                                                            (route) =>
                                                                                route.isFirst);
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "Delete Account",
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xffb20d0e)),
                                                                      ));
                                                                }),
                                                          ),
                                                          Spacer(),
                                                          TextButton(
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(),
                                                              child: const Text(
                                                                "Cancel",
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                              ))
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }));
                                      },
                                    )
                                  ];
                                })
                              ],
                            ),
                            SingleChildScrollView(
                                child: Column(children: [
                              const SizedBox(height: 16),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: UserAvatarView(
                                      urlPrefix: serverUrl,
                                      url: passenger.media?.address,
                                      cornerRadius: 10,
                                      size: 50,
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: CustomTheme
                                                .primaryColors.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Icon(
                                          Icons.add,
                                          color: CustomTheme
                                              .neutralColors.shade500,
                                        ),
                                      ))
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "+${passenger.mobileNumber}",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              CupertinoButton(
                                  minSize: 0,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 0),
                                  child: Text(S.of(context).action_add_photo),
                                  onPressed: () async {
                                    FilePickerResult? result = await FilePicker
                                        .platform
                                        .pickFiles(type: FileType.image);

                                    if (result != null &&
                                        result.files.single.path != null) {
                                      await uploadFile(
                                          result.files.single.path!);
                                      refetch!();
                                    }
                                  }),
                              Form(
                                key: _formKey,
                                child: Column(children: [
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    initialValue: passenger.firstName,
                                    onChanged: (value) =>
                                        passenger.firstName = value,
                                    decoration: InputDecoration(
                                        labelText: "First name",
                                        fillColor:
                                            CustomTheme.primaryColors.shade100),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: passenger.lastName,
                                    onChanged: (value) {
                                      passenger.lastName = value;
                                    },
                                    decoration: InputDecoration(
                                        fillColor:
                                            CustomTheme.primaryColors.shade100,
                                        labelText:
                                            S.of(context).profile_lastname),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    initialValue: passenger.email,
                                    onChanged: (value) {
                                      passenger.email = value;
                                    },
                                    decoration: InputDecoration(
                                        fillColor:
                                            CustomTheme.primaryColors.shade100,
                                        labelText: S.of(context).profile_email),
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<Gender>(
                                    value: passenger.gender,
                                    decoration: InputDecoration(
                                        fillColor:
                                            CustomTheme.primaryColors.shade100,
                                        labelText:
                                            S.of(context).profile_gender),
                                    icon: const Icon(Ionicons.chevron_down),
                                    items: <DropdownMenuItem<Gender>>[
                                      DropdownMenuItem(
                                          value: Gender.male,
                                          child: Row(
                                            children: [
                                              Text(S
                                                  .of(context)
                                                  .enum_gender_male),
                                            ],
                                          )),
                                      DropdownMenuItem(
                                          value: Gender.female,
                                          child: Text(S
                                              .of(context)
                                              .enum_gender_female)),
                                      DropdownMenuItem(
                                          value: Gender.unknown,
                                          child: Text(S
                                              .of(context)
                                              .enum_gender_unknown))
                                    ],
                                    onChanged: (Gender? value) {
                                      passenger.gender = value;
                                    },
                                  ),
                                ]),
                              ),
                            ])),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                    child: Mutation(
                                        options: MutationOptions(
                                            document:
                                                UPDATE_PROFILE_MUTATION_DOCUMENT),
                                        builder: (RunMutation runMutation,
                                            QueryResult? result) {
                                          return ElevatedButton(
                                            child:
                                                Text(S.of(context).action_save),
                                            onPressed: () async {
                                              final args =
                                                  UpdateProfileArguments(
                                                      firstName:
                                                          passenger.firstName ??
                                                              "",
                                                      lastName:
                                                          passenger.lastName ??
                                                              "",
                                                      email: passenger.email,
                                                      gender: passenger.gender);
                                              await runMutation(args.toJson())
                                                  .networkResult;
                                              refetch!();
                                            },
                                          );
                                        }))
                              ],
                            )
                          ],
                        );
                      })));
        });
  }

  uploadFile(String path) async {
    var postUri = Uri.parse("${serverUrl}upload_profile");
    var request = http.MultipartRequest("POST", postUri);
    request.headers['Authorization'] =
        'Bearer ${Hive.box('user').get('jwt').toString()}';
    request.files.add(await http.MultipartFile.fromPath('file', path));
    await request.send();
    // var response = await http.Response.fromStream(streamedResponse);
    // var json = jsonDecode(response.body);
    // setState(() {});
    // json['address'];
  }
}
