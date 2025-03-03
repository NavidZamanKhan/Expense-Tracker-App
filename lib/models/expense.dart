import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMMMMEEEEd();

const uuid = Uuid();

enum Category {
  bills,
  dining,
  donations,
  education,
  entertainment,
  fitness,
  food,
  gifts,
  groceries,
  health,
  leisure,
  personalCare,
  rent,
  savings,
  shopping,
  taxes,
  transportation,
  travel,
  utilities,
  work,
}

final categoryIcons = {
  Category.bills: Icons.receipt,
  Category.dining: Icons.restaurant,
  Category.donations: Icons.favorite,
  Category.education: Icons.school,
  Category.entertainment: Icons.movie,
  Category.fitness: Icons.fitness_center,
  Category.food: Icons.fastfood,
  Category.gifts: Icons.card_giftcard,
  Category.groceries: Icons.shopping_basket,
  Category.health: Icons.local_hospital,
  Category.leisure: Icons.sports_soccer_rounded,
  Category.personalCare: Icons.face,
  Category.rent: Icons.home_filled,
  Category.savings: Icons.account_balance,
  Category.shopping: Icons.shopping_cart,
  Category.taxes: Icons.attach_money,
  Category.transportation: Icons.directions_bus,
  Category.travel: Icons.flight,
  Category.utilities: Icons.lightbulb,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
