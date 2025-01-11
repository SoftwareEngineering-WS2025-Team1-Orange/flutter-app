import 'package:flutter/material.dart';

class DonationWalletWidget extends StatelessWidget {
  final double amount;
  final bool darkLayout;

  const DonationWalletWidget(
      {super.key, required this.amount, this.darkLayout = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(left: 8, top: 6, right: 30, bottom: 6),
      decoration: BoxDecoration(
        color: darkLayout ? theme.secondaryHeaderColor : Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon Circle
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.eco,
              color: Colors.white,
              size: 37,
            ),
          ),
          Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Dein Spendenguthaben",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: darkLayout
                          ? const Color.fromARGB(255, 200, 200, 200)
                          : Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                "${amount.toStringAsFixed(2).replaceAll(".", ",")} €",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: darkLayout ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}
