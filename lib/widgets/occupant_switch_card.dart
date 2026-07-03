import 'package:flutter/material.dart';
import 'package:society_app/constants/app_colors.dart';
import 'package:society_app/constants/app_strings.dart';

class OccupantSwitchCard extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const OccupantSwitchCard({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: 18),
      padding:  EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.currentlyOccupant,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          GestureDetector(
            onTap: () => onChanged(!value),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              width: 105,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: value
                    ? AppColors.primary
                    : Colors.grey.shade300,
              ),
              child: AnimatedAlign(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 44,
                  height: 44,
                  margin: EdgeInsets.all(4),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}