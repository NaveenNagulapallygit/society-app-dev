import 'package:flutter/material.dart';
import 'package:society_app/constants/app_strings.dart';
import '../constants/app_colors.dart';

class OwnerTenantCard extends StatelessWidget {

  final String selectedType;
  final Function(String) onChanged;

  const OwnerTenantCard({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child: _buildItem(
              title: AppStrings.owner,
              icon: Icons.person_add_alt_1_outlined,
              selected:
              selectedType == AppStrings.owner,
            ),
          ),

           SizedBox(width: 12),

          Expanded(
            child: _buildItem(
              title: AppStrings.tenant,
              icon: Icons.home_outlined,
              selected:
              selectedType == AppStrings.tenant,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildItem({
    required String title,
    required IconData icon,
    required bool selected,
  }) {
    return InkWell(
      onTap: (){
        onChanged(title);
      },
      borderRadius:
      BorderRadius.circular(15),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary
              : Colors.grey.shade100,
          borderRadius:
          BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Icon(
              icon,

              size: 28,

              color: selected
                  ? Colors.white
                  : Colors.blueGrey,
            ),

             SizedBox(width: 10),

            Text(
              title,

              style: TextStyle(

                fontSize: 18,

                fontWeight:
                FontWeight.w600,

                color: selected
                    ? Colors.white
                    : Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}