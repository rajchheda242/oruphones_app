import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBottomSheet extends StatefulWidget {
  final VoidCallback onClose;
  final VoidCallback onClearAll;
  final VoidCallback onApply;

  const FilterBottomSheet({
    Key? key,
    required this.onClose,
    required this.onClearAll,
    required this.onApply,
  }) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedCategory = 'Brand';
  final TextEditingController searchController = TextEditingController();
  final Set<String> selectedBrands = {};
  final Set<String> selectedConditions = {};
  final Set<String> selectedStorage = {};
  final Set<String> selectedRAM = {};
  final Set<String> selectedVerification = {};
  final Set<String> selectedWarranty = {};
  RangeValues priceRange = const RangeValues(5000, 200000); // Default range

  // Get the count for each category
  int getCategoryCount(String category) {
    switch (category) {
      case 'Brand':
        return selectedBrands.length;
      case 'Condition':
        return selectedConditions.length;
      case 'Storage':
        return selectedStorage.length;
      case 'RAM':
        return selectedRAM.length;
      case 'Verification':
        return selectedVerification.length;
      case 'Warranty':
        return selectedWarranty.length;
      case 'Price Range':
        return priceRange.start != 5000 || priceRange.end != 200000 ? 1 : 0;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 656,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          // Main Content Row with Divider
          Expanded(
            child: Row(
              children: [
                // Left side - Filter categories
                SizedBox(
                  width: 150,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildFilterCategory('Brand', count: getCategoryCount('Brand')),
                      _buildFilterCategory('Condition', count: getCategoryCount('Condition')),
                      _buildFilterCategory('Storage', count: getCategoryCount('Storage')),
                      _buildFilterCategory('RAM', count: getCategoryCount('RAM')),
                      _buildFilterCategory('Verification', count: getCategoryCount('Verification')),
                      _buildFilterCategory('Warranty', count: getCategoryCount('Warranty')),
                      _buildFilterCategory('Price Range', count: getCategoryCount('Price Range')),
                    ],
                  ),
                ),
                // Vertical Divider
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),
                // Right side - Filter options
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: _buildRightContent(),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFE0E0E0),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Clear All button
                Expanded(
                  child: TextButton(
                    onPressed: widget.onClearAll,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Clear All',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFF6C018),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Apply button
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6C018),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Apply',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(String title, {int count = 0}) {
    final isSelected = selectedCategory == title;
    
    return Container(
      height: 73,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFF9E7) : Colors.white,
        border: Border(
          left: BorderSide(
            color: isSelected ? const Color(0xFFF6C018) : Colors.transparent,
            width: 4,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedCategory = title;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 19, 19, 19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: const Color(0xFF2C2C2C),
                ),
              ),
              if (count > 0)
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6C018),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String title, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            CustomCheckbox(
              isSelected: isSelected,
              onTap: onTap,
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.4,
                color: const Color(0xFF2C2C2C),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightContent() {
    switch (selectedCategory) {
      case 'Brand':
        return _buildBrandContent();
      case 'Condition':
        return _buildConditionContent();
      case 'Storage':
        return _buildCheckboxListContent(
          'All',
          storageList,
          selectedStorage,
        );
      case 'RAM':
        return _buildCheckboxListContent(
          'All',
          ramList,
          selectedRAM,
        );
      case 'Verification':
        return _buildCheckboxListContent(
          'All',
          verificationList,
          selectedVerification,
        );
      case 'Warranty':
        return _buildCheckboxListContent(
          'All',
          warrantyList,
          selectedWarranty,
        );
      case 'Price Range':
        return _buildPriceRangeContent();
      default:
        return const SizedBox();
    }
  }

  Widget _buildConditionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // All Conditions Checkbox
        _buildCheckboxItem(
          'All Conditions',
          selectedConditions.length == conditionsList.length,
          () {
            setState(() {
              if (selectedConditions.length == conditionsList.length) {
                selectedConditions.clear();
              } else {
                selectedConditions.addAll(conditionsList);
              }
            });
          },
        ),
        
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
        ),
        
        // Conditions List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: conditionsList.length,
            itemBuilder: (context, index) {
              final condition = conditionsList[index];
              return Row(
                children: [
                  Expanded(
                    child: _buildCheckboxItem(
                      condition,
                      selectedConditions.contains(condition),
                      () {
                        setState(() {
                          if (selectedConditions.contains(condition)) {
                            selectedConditions.remove(condition);
                          } else {
                            selectedConditions.add(condition);
                          }
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showConditionInfo(context, condition),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Image.asset(
                        'assets/icons/info.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  void _showConditionInfo(BuildContext context, String condition) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Condition Image
              Container(
                width: 400,  // Made even bigger
                height: 500, // Made even bigger
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/conditions/${condition.toLowerCase().replaceAll(' ', '_')}.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Close Button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Close',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2C2C2C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getConditionDescription(String condition) {
    switch (condition) {
      case 'Like New':
        return '• Pristine condition\n• Appears brand new\n• No visible wear or defects\n• Ideal for users seeking\n• a premium, untouched device';
      case 'Excellent':
        return '• Minor signs of use\n• Fully functional\n• Minimal cosmetic marks\n• Battery health above 90%\n• Great value option';
      case 'Good':
        return '• Noticeable signs of use\n• Fully functional\n• Some visible scratches\n• Battery health above 80%\n• Budget-friendly choice';
      case 'Fair':
        return '• Heavy signs of use\n• Fully functional\n• Visible scratches and dents\n• Battery health above 70%\n• Economical option';
      case 'Needs Repair':
        return '• Device has issues\n• Requires repairs\n• May have physical damage\n• Functionality affected\n• For repair/parts use';
      default:
        return '';
    }
  }

  Widget _buildBrandContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar
        Container(
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  'assets/icons/search.png',
                  width: 16,
                  height: 16,
                  color: const Color(0xFF787878),
                ),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: TextField(
                  controller: searchController,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search here',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF707070),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        
        // All Brands Checkbox with proper spacing
        _buildCheckboxItem(
          'All Brands',
          selectedBrands.length == brandsList.length,
          () {
            setState(() {
              if (selectedBrands.length == brandsList.length) {
                selectedBrands.clear();
              } else {
                selectedBrands.addAll(brandsList);
              }
            });
          },
        ),
        
        // Divider with proper spacing
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
        ),
        
        // Brands List with proper spacing
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: brandsList.length,
            itemBuilder: (context, index) => _buildCheckboxItem(
              brandsList[index],
              selectedBrands.contains(brandsList[index]),
              () {
                setState(() {
                  if (selectedBrands.contains(brandsList[index])) {
                    selectedBrands.remove(brandsList[index]);
                  } else {
                    selectedBrands.add(brandsList[index]);
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxListContent(
    String allTitle,
    List<String> items,
    Set<String> selectedItems,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheckboxItem(
          allTitle,
          selectedItems.length == items.length,
          () {
            setState(() {
              if (selectedItems.length == items.length) {
                selectedItems.clear();
              } else {
                selectedItems.addAll(items);
              }
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFE0E0E0),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) => _buildCheckboxItem(
              items[index],
              selectedItems.contains(items[index]),
              () {
                setState(() {
                  if (selectedItems.contains(items[index])) {
                    selectedItems.remove(items[index]);
                  } else {
                    selectedItems.add(items[index]);
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRangeContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Any',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Maximum Price',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF707070),
            ),
          ),
          Expanded(
            child: RotatedBox(
              quarterTurns: 3, // Rotate 270 degrees
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 1,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 16,
                  ),
                  activeTrackColor: const Color(0xFFF6C018),
                  inactiveTrackColor: const Color(0xFFE0E0E0),
                  thumbColor: const Color(0xFFF6C018),
                ),
                child: Container(
                  width: double.infinity,
                  child: RangeSlider(
                    values: priceRange,
                    min: 5000,
                    max: 200000,
                    divisions: 195,
                    labels: RangeLabels(
                      '₹${priceRange.start.round()}',
                      '₹${priceRange.end.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        priceRange = values;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Minimum Price',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF707070),
            ),
          ),
          Text(
            '₹ 5,000',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2C2C2C),
            ),
          ),
        ],
      ),
    );
  }
}

// Sample brands list
const brandsList = [
  'Apple',
  'Samsung',
  'Google',
  'OnePlus',
  'Xiaomi',
];

// Add conditions list
const conditionsList = [
  'Like New',
  'Excellent',
  'Good',
  'Fair',
  'Needs Repair',
];

// First, let's create a custom checkbox widget to match the design exactly
class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCheckbox({
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE0E0E0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
          color: isSelected ? const Color(0xFF2C2C2C) : Colors.white,
        ),
        child: isSelected
            ? const Icon(
                Icons.check,
                size: 10,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}

// First add these lists at the bottom of the file with other constants
const storageList = [
  '8 GB',
  '16 GB',
  '32 GB',
  '64 GB',
  '128 GB',
  '256 GB',
  '512 GB',
  '1TB',
];

const ramList = [
  '2 GB',
  '3 GB',
  '4 GB',
  '6 GB',
  '8 GB',
  '12 GB',
  '16 GB',
];

const verificationList = [
  'Verified Only',
];

const warrantyList = [
  'Brand Warranty',
  'Seller Warranty',
]; 