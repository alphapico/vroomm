import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/theme/theme.dart';

class VroomBackButton extends StatelessWidget {
  const VroomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Navigator.pop(context),
      minSize: 0,
      padding: const EdgeInsets.all(0),
      child: Stack(children: [
        Positioned(
          left: -7,
          child: Icon(
            Ionicons.chevron_back,
            color: CustomTheme.neutralColors.shade800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 16),
          child: Text(
            'Back',
            style: TextStyle(color: CustomTheme.neutralColors.shade800),
          ),
        )
      ]),
    );
  }
}
