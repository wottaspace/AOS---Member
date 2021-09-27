import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';

class RecommendedJobCard extends StatelessWidget {
  const RecommendedJobCard({
    Key? key,
    required this.company,
    required this.title,
    required this.location,
    required this.onTap,
  }) : super(key: key);

  final String company;
  final String title;
  final String location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Okito.isLandscape ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.7,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: ColorConstants.purple,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onTap,
          child: Stack(
            children: [
              _Circle(color: Colors.white.withOpacity(0.15), diameter: 50),
              Positioned(
                top: -15,
                left: -15,
                child: _Circle(color: Colors.white.withOpacity(0.1), diameter: 80),
              ),
              Positioned(
                top: -30,
                left: -30,
                child: _Circle(color: Colors.white.withOpacity(0.09), diameter: 120),
              ),
              Positioned(
                top: -50,
                left: -50,
                child: _Circle(color: Colors.white.withOpacity(0.09), diameter: 180),
              ),
              Positioned(
                top: -50,
                left: -50,
                child: _Circle(color: Colors.white.withOpacity(0.08), diameter: 210),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title",
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "$company",
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              fontSize: 16.0,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                PhosphorIcons.map_pin,
                                size: 12,
                                color: ColorConstants.greyColor,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${location.toUpperCase()}",
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  fontSize: 10.0,
                                  color: ColorConstants.greyColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.3,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 30,
                              child: KButton(
                                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                                onPressed: onTap,
                                title: "APPLY",
                                color: Colors.white.withOpacity(0.25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({
    Key? key,
    required this.color,
    required this.diameter,
  }) : super(key: key);

  final double diameter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
