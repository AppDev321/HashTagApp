import 'package:flutter/material.dart';

import '../../../../core/widgets/shadow_widget.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.name,
    required this.desc,
    required this.backgroundColor,
    required this.shadowColor, required this.imagePath, required this.callback,
  }) : super(key: key);

  final String name;
  final String desc;
  final List<Color> backgroundColor;
  final Color shadowColor;
  final String imagePath;
  final Function(List<Color>) callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){callback(backgroundColor);},
      child: SizedBox(
        height: 180,
        child: SizedBox(
          width: 150,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: shadowColor.withOpacity(0.6), offset: const Offset(1.1, 4.0), blurRadius: 8.0),
                    ],
                    gradient: LinearGradient(
                      colors: backgroundColor,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(54.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 54, left: 16, right: 16, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.2,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3, bottom: 8),
                            child: Text(
                              desc,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                letterSpacing: 0.2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 84,
                  height: 84,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 8,
                child: SimpleShadow(
                  opacity: 0.7,
                  color: Colors.black,
                  offset: const Offset(4, 4),
                  sigma: 5,
                  child: Image.asset(
                    imagePath,
                    height: 70,
                    width: 70,
                  ), // Default: 2
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
