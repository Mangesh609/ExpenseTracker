import 'package:flutter/material.dart';

class Transaction{
  late final String title;
  final DateTime dateTime;
  late final double amount;

  Transaction({
    required this.title,
    required this.amount,
    required this.dateTime,
});
}