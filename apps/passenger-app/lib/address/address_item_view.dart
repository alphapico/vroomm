import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../generated/l10n.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:client_shared/theme/theme.dart';

class AddressItemView extends StatelessWidget {
  final PassengerAddressType type;
  final GetAddresses$Query$PassengerAddress? address;

  final Function(GetAddresses$Query$PassengerAddress? address,
      PassengerAddressType? type) onAction;

  const AddressItemView(
      {required this.onAction, required this.type, this.address, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          AddressListIcon(getAddressTypeIcon(type)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getAddressTypeName(context, type),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (address != null)
                  Text(
                    address!.details,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                if (address == null)
                  CupertinoButton(
                      padding: const EdgeInsets.only(left: 0, top: 2),
                      minSize: 0,
                      child: Text("Set location",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: CustomTheme.primaryColors)),
                      onPressed: () => onAction(null, type))
              ],
            ),
          ),
          const Spacer(),
          if (address != null)
            CupertinoButton(
                child: Text(
                  "Edit",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                onPressed: () => onAction(address, null))
        ],
      ),
    );
  }
}

class AddressListIcon extends StatelessWidget {
  final IconData iconData;
  const AddressListIcon(
    this.iconData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: CustomTheme.neutralColors.shade200,
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        iconData,
        size: 28,
        color: CustomTheme.neutralColors.shade600,
      ),
    );
  }
}

IconData getAddressTypeIcon(PassengerAddressType type) {
  switch (type) {
    case PassengerAddressType.home:
      return Ionicons.home;

    case PassengerAddressType.work:
      return Ionicons.business;

    case PassengerAddressType.partner:
      return Ionicons.heart;

    case PassengerAddressType.other:
      return Ionicons.location;

    case PassengerAddressType.artemisUnknown:
      return Ionicons.location;
    case PassengerAddressType.gym:
      return Ionicons.barbell;

    case PassengerAddressType.parent:
      return Ionicons.people;

    case PassengerAddressType.cafe:
      return Ionicons.cafe;

    case PassengerAddressType.park:
      return Ionicons.leaf;
  }
}

String getAddressTypeName(BuildContext context, PassengerAddressType type) {
  switch (type) {
    case PassengerAddressType.home:
      return S.of(context).enum_address_type_home;

    case PassengerAddressType.work:
      return S.of(context).enum_address_type_work;

    case PassengerAddressType.partner:
      return S.of(context).enum_address_type_partner;

    case PassengerAddressType.other:
      return S.of(context).enum_address_type_other;

    case PassengerAddressType.artemisUnknown:
      return S.of(context).enum_address_type_other;

    case PassengerAddressType.gym:
      return "Gym";

    case PassengerAddressType.parent:
      return "Parent's House";

    case PassengerAddressType.cafe:
      return "Cafe";

    case PassengerAddressType.park:
      return "Park";
  }
}
