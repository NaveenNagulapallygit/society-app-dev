import 'package:flutter/material.dart';
import 'package:society_app/constants/app_strings.dart';
import '../constants/app_colors.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin:  EdgeInsets.only(bottom: 15),
        padding:  EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? AppColors.primary
                : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primary
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                _getRoleIcon(),
                color: selected
                    ? Colors.white
                    : Colors.blueGrey,
                size: 30,
              ),
            ),

             SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? AppColors.primary
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: selected
                  ? Center(
                child: Container(
                  width: 14,
                  height: 14,
                  decoration:  BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getRoleIcon() {
    switch (title) {

      case AppStrings.societyAdmin:
        return Icons.admin_panel_settings_outlined;

      case AppStrings.securityGuard:
        return Icons.security_outlined;

      case AppStrings.resident:
        return Icons.person_outline;

      default:
        return Icons.person_outline;
    }
  }
}