import 'package:flutter/material.dart';
import 'package:list_video_thumbnails/models/date_model.dart';
import 'package:list_video_thumbnails/utils/base_constants.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  int selectedIndex = 4;

  final List<DateModel> dates = [
    DateModel(day: "T2", date: "09"),
    DateModel(day: "T3", date: "10"),
    DateModel(day: "T4", date: "11"),
    DateModel(day: "T5", date: "12"),
    DateModel(day: "T6", date: "13"),
    DateModel(day: "T7", date: "14"),
    DateModel(day: "CN", date: "15"),
    DateModel(day: "T2", date: "16"),
    DateModel(day: "T3", date: "16"),
  ];

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / dates.length - 1; // Auto item width

    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: itemWidth,
          mainAxisSpacing: 0,
        ),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  dates[index].day,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: (dates[index].day == 'T7' || dates[index].day == 'CN')
                        ? Constants.blackColor.withOpacity(0.8)
                        : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: isSelected ? Constants.yellow2 : Colors.transparent),
                    gradient: isSelected
                        ? const LinearGradient(
                            colors: [Constants.yellow1, Constants.yellow2], // Gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : const LinearGradient(
                            colors: [Constants.cardColor, Constants.cardColor], // Gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dates[index].date,
                          style: TextStyle(
                            fontSize: isSelected ? 13 : 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                            color: isSelected ? Constants.blackColor : Colors.black87,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            height: 2,
                            width: 10,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
