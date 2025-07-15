import 'package:flutter/material.dart';
import 'all_filters_model.dart';
import 'filter_button_tiles.dart';
import 'filter_modal.dart';

class FilterBar extends StatefulWidget {
  final List<Map<String, dynamic>> originalData;
  final Function(List<Map<String, dynamic>>) onFiltered;

  const FilterBar({
    super.key,
    required this.originalData,
    required this.onFiltered,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  // State
  String? selectedSort;
  List<String> selectedOffers = [];
  List<String> selectedPrice = [];
  bool rating4Plus = false;

  // Filter options
  final sortOptions = ['Fast delivery', 'Distance', 'Ratings (high to low)'];
  final offerOptions = ['Free delivery', 'Accepts Vouchers', 'Deal'];
  final priceOptions = ['\$', '\$\$', '\$\$\$'];

  // Apply filter logic
  void applyFilters() {
    List<Map<String, dynamic>> filtered = [...widget.originalData];

    if (rating4Plus) {
      filtered = filtered.where((c) => c['rating'] >= 4.0).toList();
    }

    if (selectedOffers.isNotEmpty) {
      for (var offer in selectedOffers) {
        if (offer == 'Free delivery') {
          filtered = filtered.where((c) => c['deliveryFee'] == 0).toList();
        } else {
          filtered = filtered
              .where(
                (c) => (c['discountLabel'] ?? '').toLowerCase().contains(
                  offer.toLowerCase(),
                ),
              )
              .toList();
        }
      }
    }

    if (selectedPrice.isNotEmpty) {
      filtered = filtered
          .where((c) => selectedPrice.contains(c['priceLevel']))
          .toList();
    }

    if (selectedSort != null) {
      if (selectedSort == 'Ratings (high to low)') {
        filtered.sort((a, b) => b['rating'].compareTo(a['rating']));
      } else if (selectedSort == 'Distance') {
        filtered.sort((a, b) => a['distance'].compareTo(b['distance']));
      } else if (selectedSort == 'Fast delivery') {
        filtered.sort((a, b) => a['deliveryTime'].compareTo(b['deliveryTime']));
      }
    }

    widget.onFiltered(filtered);
  }
  void openBottomModal({
    required String title,
    required List<String> options,
    required List<String> selected,
    required Function(List<String>) onApply,
    bool singleSelect = false,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => FilterModal(
        title: title,
        options: options,
        selected: selected,
        singleSelect: singleSelect,
        onApply: (newSelected) {
          setState(() {
            onApply(newSelected);
            applyFilters();
          });
        },
      ),
    );
  }

  void openAllFiltersModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => AllFiltersModal(
        selectedSort: selectedSort,
        selectedOffers: selectedOffers,
        selectedPrice: selectedPrice,
        rating4Plus: rating4Plus,
        onApply: (sort, offers, price, rating) {
          setState(() {
            selectedSort = sort;
            selectedOffers = offers;
            selectedPrice = price;
            rating4Plus = rating;
            applyFilters();
          });
        },
      ),
    );
  }

  void clearFilters() {
    setState(() {
      selectedSort = null;
      selectedOffers.clear();
      selectedPrice.clear();
      rating4Plus = false;
      widget.onFiltered(widget.originalData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          // Filter icon-only button
          FilterButtonTile(icon: Icons.tune, onTap: openAllFiltersModal),

          // Sort button with ▼
          FilterButtonTile(
            title: "Sort",
            selectedText: selectedSort,
            showDropdownArrow: true,
            onTap: () => openBottomModal(
              title: "Sort by",
              options: sortOptions,
              selected: selectedSort != null ? [selectedSort!] : [],
              onApply: (val) =>
                  selectedSort = val.isNotEmpty ? val.first : null,
              singleSelect: true,
            ),
          ),

          // Offers button with ▼
          FilterButtonTile(
            title: "Offers",
            selectedText: selectedOffers.isNotEmpty ? "Offers" : null,
            showDropdownArrow: true,
            onTap: () => openBottomModal(
              title: "Offers",
              options: offerOptions,
              selected: selectedOffers,
              onApply: (val) => selectedOffers = val,
            ),
          ),

          // Rating 4.0+ button with star icon
          FilterButtonTile(
            title: "Rating 4.0+",
            icon: Icons.star,
            onTap: () {
              setState(() {
                rating4Plus = !rating4Plus;
                applyFilters();
              });
            },
          ),

          // Clear button
          TextButton(
            onPressed: clearFilters,
            child: const Text(
              "Clear",
              style: TextStyle(fontSize: 13, color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
