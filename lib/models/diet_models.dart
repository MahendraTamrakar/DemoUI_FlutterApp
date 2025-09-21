import 'package:flutter/material.dart';

class DietModels {
  String name;
  String iconPath;
  String level;
  Color boxColor;
  String duration;
  String calorie;
  bool viewIsSelected;

  DietModels({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
  });

  static List<DietModels> getDiets() {
    List<DietModels> diets =[];

    diets.add(
      DietModels(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        boxColor: Color(0xff92A3FD),
        level: 'Easy',
        duration: '30mins',
        calorie: '182KCal',
        viewIsSelected: true,
      ),
    );
    
    diets.add(
      DietModels(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        boxColor: Color.fromARGB(255, 246, 145, 202),
        level: 'Easy',
        duration: '15mins',
        calorie: '162KCal',
        viewIsSelected: false,
      ),
    );
    
    diets.add(
      DietModels(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        boxColor: Color.fromARGB(255, 200, 249, 166),
        level: 'Easy',
        duration: '20mins',
        calorie: '252KCal',
        viewIsSelected: false,
      ),
    );

    return diets;

  }
}