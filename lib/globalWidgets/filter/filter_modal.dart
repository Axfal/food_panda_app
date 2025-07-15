import 'package:flutter/material.dart';

class FilterModal extends StatefulWidget {
  final String title;
  final List<String> options;
  final List<String> selected;
  final Function(List<String>) onApply;

  const FilterModal({
    super.key,
    required this.title,
    required this.options,
    required this.selected,
    required this.onApply,
    required bool singleSelect,
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late List<String> tempSelected;

  @override
  void initState() {
    super.initState();
    tempSelected = [...widget.selected];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...widget.options.map(
            (option) => CheckboxListTile(
              title: Text(option),
              value: tempSelected.contains(option),
              onChanged: (val) {
                setState(() {
                  val! ? tempSelected.add(option) : tempSelected.remove(option);
                });
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                widget.onApply(tempSelected);
                Navigator.pop(context);
              },
              child: const Text("Apply", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
