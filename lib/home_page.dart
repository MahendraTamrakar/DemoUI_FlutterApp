// ignore_for_file: deprecated_member_use

import 'package:demo/models/category_models.dart';
import 'package:demo/models/diet_models.dart';
import 'package:demo/models/popular_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModels> categories = [];
  List<DietModels> diets =[];
  List<PopularDietsModel> popularDiets = [];

 /*  void _getCategories() {
    categories = CategoryModels.getCategories();
  }

  void _getDiets() {
    diets = DietModels.getDiets();
  } */

  void _getInitialInfo() {
    categories = CategoryModels.getCategories();
    diets = DietModels.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  /* @override
  void initState() {
    
  } */

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      body: ListView(
        children: [
          _searchField(),
          SizedBox(height: 40),
          _categorySection(),
          SizedBox(height: 35),
          _dietSection(),
          SizedBox(height: 35),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 25,),
                itemCount: popularDiets.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    
                    decoration: BoxDecoration(
                      color: popularDiets[index].boxIsSelected ? Colors.white : const Color.fromARGB(244, 232, 232, 232),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popularDiets[index].boxIsSelected ? [
                        BoxShadow(
                          color: Color(0xff1D1617).withOpacity(0.07),
                          offset: Offset(0, 8),
                          spreadRadius: 0,
                        ),
                      ] : []
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(popularDiets[index].iconPath, width: 65, height: 65),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                              style: TextStyle(
                                color: Color(0xff7B6f72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          
                        ),
                        GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset('assets/icons/button.svg', width: 30, height: 30),
                            ),
                      ],
                    ),
                    
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20),
              child: Text(
                'Recommendation \nfor Diet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 240,
              child: ListView.separated(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          diets[index].iconPath,
                          height: 70,
                          width: 70
                        ),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                                '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        
                        Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                              diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.white,
                              diets[index].viewIsSelected ? Color(0xff92A3FD) : Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: diets[index].viewIsSelected ? Colors.white : const Color.fromARGB(255, 113, 96, 241),
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        );
  }

  Column _categorySection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: categories.length,
                separatorBuilder: (context,index) => SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            categories[index].iconPath,
                            height: 22,
                            width: 22,
                          ),
                        ),
                        
                        Text(
                          categories[index].name,
                         style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                         ),
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(top:40, right:20, left:20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 40,
                spreadRadius: 0.0,
              ),
            ]
              
          ),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.all(15),
              hintText: "Search Pancake",
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight( // when we nee to use divider inside a row widget we need to used this
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black38,
                        thickness: 0.2,
                        indent: 10, // to create space from top
                        endIndent: 10, // to create space from bottom
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/icons/Filter.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none, // for removing the outline border
              ),
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title:  Text(
        "Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      leading: GestureDetector(
        onTap: () {

        },
        child: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 232, 232, 232),
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/arrow.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
            margin: EdgeInsets.all(12),
            width: 31,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 232, 232),
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icons/dots.svg',
              width: 5,
              height: 5,
            ),
          ),
        ),
      ],
    );
  }
}