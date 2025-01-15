import 'package:bright_impact/model/transaction.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:bright_impact/state/list_provider/transaction_list_provider.dart';
import 'package:bright_impact/view/pages/list_pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Für die Lokalisierung des Datums

class TransactionListPage extends ListPage<Transaction> {
  const TransactionListPage({super.key});

  @override
  State<StatefulWidget> createState() => _TransactionListPageState();

  @override
  ListProvider<Transaction> createProvider({required int donatorId}) => TransactionListProvider(resultsPerPage: 10, donatorId: donatorId);

  @override
  String pageTitle() => "Einnahmen und Spenden";

  @override
  List<FilterButtonConfig> filterConfig(ListProvider<Transaction> provider) {
    return [];
  }

  @override
  Future<void> onItemPressed(BuildContext context,
      ListProvider<Transaction> provider, int index) async {
    // ON PRESSED
  }

  @override
  Widget buildListEntry({
    required Transaction item,
    required int index,
    required BuildContext context,
    void Function()? onPressed,
  }) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    final isDonation = item is Donation;

    final icon = isDonation
        ? Icons.favorite_outline
        : Icons.euro;
    final iconColor = isDonation ? theme.primaryColor : Colors.black;
    final title = isDonation ? "Donation" : "Earning";
    final subtitle =
        isDonation ? item.ngoName : (item as Earning).donationboxName;
    final description = isDonation ? (item.projectName ?? "Spende an Organisation") : "Innerhalb des Zeitraums";
    final additionalInfo = isDonation
        ? null
        : "${(item as Earning).calcDuration.inHours}h ${item .calcDuration.inMinutes % 60}m ${item.calcDuration.inSeconds % 60}s";

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: width * 0.03, horizontal: width * 0.06),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: iconColor, width: 1.5)),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 20,
                    ),
                  )),

              // Text Lines
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDonation ? theme.primaryColor : Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(150, 0, 0, 0),),
                    ),
                    if (additionalInfo != null)
                      Text(
                        additionalInfo,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                  ],
                ),
              ),

              // Datum und Betrag
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat("dd.MM.yyyy").format(item.datetime),
                    style: TextStyle(fontSize: 12, color: const Color.fromARGB(133, 0, 0, 0)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${item.amount > 0 ? "+" : ""}${item.amount.toStringAsFixed(2)} €",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isDonation ? theme.primaryColor : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: width * 0.03),
          Divider(thickness: 1, color: const Color.fromARGB(36, 0, 0, 0)),
        ],
      ),
    );
  }
}

class _TransactionListPageState
    extends ListPageState<Transaction, TransactionListPage> {}
