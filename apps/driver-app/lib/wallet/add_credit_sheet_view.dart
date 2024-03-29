import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import '../generated/l10n.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../query_result_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:client_shared/wallet/payment_method_item.dart';
import 'package:client_shared/wallet/money_presets_group.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';

class AddCreditSheetView extends StatefulWidget {
  final String currency;
  const AddCreditSheetView({required this.currency, Key? key})
      : super(key: key);

  @override
  State<AddCreditSheetView> createState() => _AddCreditSheetViewState();
}

class _AddCreditSheetViewState extends State<AddCreditSheetView> {
  String? selectedGatewayId;
  double? amount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetTitleView(title: "Add Credit"),
          Text(
            "Select Payment Method:",
            style: Theme.of(context).textTheme.headlineMedium,
          ).pOnly(bottom: 8),
          Query(
              options: QueryOptions(document: PAYMENT_GATEWAYS_QUERY_DOCUMENT),
              builder: (QueryResult result,
                  {Future<QueryResult?> Function()? refetch,
                  FetchMore? fetchMore}) {
                if (result.isLoading || result.hasException) {
                  return QueryResultView(result);
                }
                final gateways = PaymentGateways$Query.fromJson(result.data!)
                    .paymentGateways;
                return Column(
                    children: gateways
                        .map((gateway) => PaymentMethodItem(
                            id: gateway.id,
                            title: gateway.title,
                            selectedValue: selectedGatewayId,
                            imageAddress: gateway.media != null
                                ? serverUrl + gateway.media!.address
                                : null,
                            onSelected: (value) {
                              setState(() => selectedGatewayId = gateway.id);
                            }))
                        .toList());
              }),
          const SizedBox(height: 16),
          Text(
            "Choose amount",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          MoneyPresetsGroup(
              onAmountChanged: (value) => setState(() => amount = value)),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Mutation(
                options: MutationOptions(
                    document: TOP_UP_WALLET_MUTATION_DOCUMENT,
                    fetchPolicy: FetchPolicy.noCache),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return ElevatedButton(
                    onPressed: ((result?.isLoading ?? false) ||
                            amount == null ||
                            selectedGatewayId == null)
                        ? null
                        : () async {
                            final mutationResult = await runMutation(
                                    TopUpWalletArguments(
                                            input: TopUpWalletInput(
                                                gatewayId: selectedGatewayId!,
                                                amount: amount!,
                                                currency: widget.currency))
                                        .toJson())
                                .networkResult;
                            final resultParsed = TopUpWallet$Mutation.fromJson(
                                mutationResult!.data!);
                            launchUrl(Uri.parse(resultParsed.topUpWallet.url));
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          },
                    child: Text(S.of(context).top_up_sheet_pay_button),
                  );
                }),
          )
        ],
      ),
    );
  }
}
