import 'package:flutter/material.dart';

class AllFiltersModal extends StatefulWidget {
  final String? selectedSort;
  final List<String> selectedOffers;
  final List<String> selectedPrice;
  final bool rating4Plus;

  final void Function(
    String? selectedSort,
    List<String> selectedOffers,
    List<String> selectedPrice,
    bool rating4Plus,
  ) onApply;

  const AllFiltersModal({
    super.key,
    required this.selectedSort,
    required this.selectedOffers,
    required this.selectedPrice,
    required this.rating4Plus,
    required this.onApply,
  });

  @override
  State<AllFiltersModal> createState() => _AllFiltersModalState();
}

class _AllFiltersModalState extends State<AllFiltersModal> {
  late String? selectedSort;
  late List<String> selectedOffers;
  late List<String> selectedPrice;
  late bool rating4Plus;

  final sortOptions = ['Fast delivery', 'Distance', 'Ratings (high to low)'];
  final offerOptions = ['Free delivery', 'Accepts Vouchers', 'Deal'];
  final priceOptions = ['\$', '\$\$', '\$\$\$'];

  @override
  void initState() {
    super.initState();
    selectedSort = widget.selectedSort;
    selectedOffers = List.from(widget.selectedOffers);
    selectedPrice = List.from(widget.selectedPrice);
    rating4Plus = widget.rating4Plus;
  }

  void toggleCheckbox(String value, List<String> list) {
    setState(() {
      if (list.contains(value)) {
        list.remove(value);
      } else {
        list.add(value);
      }
    });
  }

  void applyFilters() {
    widget.onApply(
      selectedSort,
      selectedOffers,
      selectedPrice,
      rating4Plus,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.9,
      initialChildSize: 0.75,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              /// Sort Section
              const Text("Sort by", style: TextStyle(fontWeight: FontWeight.bold)),
              ...sortOptions.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedSort,
                  onChanged: (val) => setState(() => selectedSort = val),
                );
              }),

              const SizedBox(height: 16),

              /// Offer Section
              const Text("Offers", style: TextStyle(fontWeight: FontWeight.bold)),
              ...offerOptions.map((offer) {
                return CheckboxListTile(
                  title: Text(offer),
                  value: selectedOffers.contains(offer),
                  onChanged: (_) => toggleCheckbox(offer, selectedOffers),
                );
              }),

              const SizedBox(height: 16),

              /// Price Section
              const Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
              ...priceOptions.map((price) {
                return CheckboxListTile(
                  title: Text(price),
                  value: selectedPrice.contains(price),
                  onChanged: (_) => toggleCheckbox(price, selectedPrice),
                );
              }),

              const SizedBox(height: 16),

              /// Ratings Toggle
              SwitchListTile(
                title: const Text("Ratings 4.0+"),
                value: rating4Plus,
                onChanged: (val) => setState(() => rating4Plus = val),
              ),

              const SizedBox(height: 24),

              /// Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: applyFilters,
                    child: const Text("Apply"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
