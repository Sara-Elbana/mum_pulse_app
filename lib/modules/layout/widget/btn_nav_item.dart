import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_pulse_app/core/constant/app_assets.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';

class BtnNavItem extends StatelessWidget {
  String image;
  bool isSelected;
   BtnNavItem({
    super.key,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 28,
                child: SvgPicture.asset(
                    image,
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              //curve: Curves.slowMiddle,
              height: 3,
              width: isSelected ? 30 : 0,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(56),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: AppColors.purple.withOpacity(0.8),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ]
                    : [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
