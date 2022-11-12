import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LookingSheetView extends StatelessWidget {
  const LookingSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // mainBloc

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: SafeArea(
        minimum: const EdgeInsets.all(16),
        top: false,
        child: Column(
          children: [
            Text(
              "Ride Requested",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const LinearProgressIndicator().pSymmetric(v: 8),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                    child: Text(
                  "We are looking for nearest driver for you.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ).pOnly(right: 16)),
                Flexible(
                    child: Image.asset(
                  "images/searching.png",
                ).pSymmetric(v: 8))
              ],
            ),
            // CANCEL_ORDER_MUTATION_DOCUMENT
          ],
        ),
      ),
    );
  }
}
