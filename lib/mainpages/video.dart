// ignore_for_file: use_super_parameters, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EarningsHistoryWidget extends StatefulWidget {
  final List<EarningEntry> earnings;

  const EarningsHistoryWidget({Key? key, required this.earnings}) : super(key: key);

  @override
  _EarningsHistoryWidgetState createState() => _EarningsHistoryWidgetState();
}

class _EarningsHistoryWidgetState extends State<EarningsHistoryWidget> {
  // Formatter for Indian Rupees
  final currencyFormatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 2
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Earnings History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.earnings.length,
              itemBuilder: (context, index) {
                final earning = widget.earnings[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.deepPurple.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      earning.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      earning.date,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      currencyFormatter.format(earning.amount),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: earning.amount >= 0 ? Colors.green[700] : Colors.red[700],
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for earnings entry
class EarningEntry {
  final String title;
  final String date;
  final double amount;

  EarningEntry({
    required this.title,
    required this.date,
    required this.amount,
  });
}

// Example usage
class EarningsPage extends StatelessWidget {
  final List<EarningEntry> earnings = [
    EarningEntry(
        title: 'Project Completion Bonus',
        date: '15 Nov 2023',
        amount: 5000.50
    ),
    EarningEntry(
        title: 'Monthly Salary',
        date: '30 Nov 2023',
        amount: 75000.00
    ),
    EarningEntry(
        title: 'Freelance Work',
        date: '05 Dec 2023',
        amount: 12500.75
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Earnings'),
      ),
      body: EarningsHistoryWidget(earnings: earnings),
    );
  }
}