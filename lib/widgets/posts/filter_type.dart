import 'package:flutter/material.dart';

class FilterRowWidget extends StatelessWidget {
  final List<String> statuses;
  final String selectedStatus;
  final ValueChanged<String> onStatusChanged;

  FilterRowWidget({
    required this.statuses,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: statuses
              .map((status) => [
                    FilterButtonWidget(
                      status: status,
                      isSelected: selectedStatus == status,
                      onPressed: () => onStatusChanged(status),
                    ),
                    SizedBox(width: 5),
                  ])
              .expand((widget) => widget)
              .toList()
            ..removeLast(),
        ),
      ),
    );
  }
}

class FilterButtonWidget extends StatelessWidget {
  final String status;
  final bool isSelected;
  final VoidCallback onPressed;

  FilterButtonWidget({
    required this.status,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.brown.shade400 : Colors.grey.shade300,
        foregroundColor: isSelected ? Colors.white : Colors.brown.shade900,
      ),
      child: Text(status),
    );
  }
}