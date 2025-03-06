import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMMMMEEEEd();

const uuid = Uuid();

enum Category {
  beverages,
  bills,
  childcare,
  clothing,
  dining,
  donations,
  education,
  electronics,
  entertainment,
  fitness,
  food,
  gifts,
  groceries,
  health,
  hobbies,
  insurance,
  investments,
  laundry,
  leisure,
  maintenance,
  medical,
  mortgage,
  personalCare,
  pets,
  phone,
  rent,
  savings,
  shopping,
  software,
  subscriptions,
  taxes,
  transportation,
  travel,
  utilities,
  work,
}

final categoryIcons = {
  Category.beverages: Icons.local_drink,
  Category.bills: Icons.receipt,
  Category.childcare: Icons.child_care,
  Category.clothing: Icons.checkroom,
  Category.dining: Icons.restaurant,
  Category.donations: Icons.favorite,
  Category.education: Icons.school,
  Category.electronics: Icons.electrical_services,
  Category.entertainment: Icons.movie,
  Category.fitness: Icons.fitness_center,
  Category.food: Icons.fastfood,
  Category.gifts: Icons.card_giftcard,
  Category.groceries: Icons.shopping_basket,
  Category.health: Icons.local_hospital,
  Category.hobbies: Icons.palette,
  Category.insurance: Icons.security,
  Category.investments: Icons.trending_up,
  Category.laundry: Icons.local_laundry_service,
  Category.leisure: Icons.sports_soccer_rounded,
  Category.maintenance: Icons.build,
  Category.medical: Icons.medical_services,
  Category.mortgage: Icons.house,
  Category.personalCare: Icons.face,
  Category.pets: Icons.pets,
  Category.phone: Icons.phone,
  Category.rent: Icons.home_filled,
  Category.savings: Icons.account_balance,
  Category.shopping: Icons.shopping_cart,
  Category.software: Icons.computer,
  Category.subscriptions: Icons.subscriptions,
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
