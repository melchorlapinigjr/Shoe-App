import 'package:flutter/material.dart';

class ShoeSizesViewItem extends StatelessWidget {
  const ShoeSizesViewItem(
    this.size, {
    Key? key,
    required this.onItemSelected,
    required this.isSelected,
    required this.isNotAvailable,
  }) : super(key: key);

  final String size;
  final bool isSelected;
  final bool isNotAvailable;
  final Function(String value) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isNotAvailable ? null : () => onItemSelected.call(size),
      child: Container(
        width: 66,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            //width: 2,
            color:
                isSelected ? const Color(0xff1F2732) : const Color(0xffDEE3EB),
          ),
        ),
        child: Text(size,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: isNotAvailable
                  ? const Color(0xff1F2732).withOpacity(0.3)
                  : const Color(0xff1F2732),
            )),
      ),
    );
  }
}
