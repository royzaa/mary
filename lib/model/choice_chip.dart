import 'package:flutter/material.dart';

class ChoiceChip {
  final String choice;
  final Color color;
  final bool isSelected;
  final bool isRightChoice;

  const ChoiceChip({
    required this.choice,
    required this.color,
    required this.isRightChoice,
    this.isSelected = false,
  });

  ChoiceChip copy({
    String? choice,
    Color? color,
    bool? isSelected,
    bool? isRightChoice,
  }) =>
      ChoiceChip(
        choice: choice ?? this.choice,
        color: color ?? this.color,
        isSelected: isSelected ?? this.isSelected,
        isRightChoice: isRightChoice ?? this.isRightChoice,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceChip &&
          runtimeType == other.runtimeType &&
          choice == other.choice &&
          color == other.color &&
          isSelected == other.isSelected;

  @override
  int get hashCode => choice.hashCode ^ color.hashCode ^ isSelected.hashCode;
}
