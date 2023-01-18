import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Flag extends Equatable {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;

  const Flag({required this.primaryColor, required this.secondaryColor, required this.tertiaryColor});

  @override
  List<Object?> get props => [primaryColor, secondaryColor, tertiaryColor];

  static final List<Flag> colors = [
    const Flag(
        primaryColor: Colors.orange,
        secondaryColor: Colors.white,
        tertiaryColor: Colors.green),
    const Flag(
        primaryColor: Colors.blue,
        secondaryColor: Colors.white,
        tertiaryColor: Colors.red),
    const Flag(
        primaryColor: Colors.green,
        secondaryColor: Colors.white,
        tertiaryColor: Colors.orange),
    const Flag(
        primaryColor: Colors.red,
        secondaryColor: Colors.white,
        tertiaryColor: Colors.red),
    const Flag(
        primaryColor: Colors.green,
        secondaryColor: Colors.red,
        tertiaryColor: Colors.yellow)
  ];

  static final Flag defaultFlag = const Flag(primaryColor: Colors.grey, secondaryColor: Colors.grey, tertiaryColor: Colors.grey);
}