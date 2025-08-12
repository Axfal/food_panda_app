import '../restaurant_owner_exports.dart';

class MyRestaurantScreen extends StatefulWidget {
  const MyRestaurantScreen({super.key});

  @override
  State<MyRestaurantScreen> createState() => _MyRestaurantScreenState();
}

class _MyRestaurantScreenState extends State<MyRestaurantScreen> {
  List<Map<String, dynamic>> restaurants = [
    {
      "name": "Sunrise Diner",
      "address": "123 Main Street, City",
      "hours": "8 AM - 10 PM",
      "isOpen": true,
    },
    {
      "name": "Tasty Bites",
      "address": "456 Elm Avenue, City",
      "hours": "11 AM - 11 PM",
      "isOpen": false,
    },
    {
      "name": "Green Garden",
      "address": "789 Oak Road, City",
      "hours": "7 AM - 9 PM",
      "isOpen": true,
    },
  ];

  void toggleStatus(int index) {
    setState(() {
      restaurants[index]["isOpen"] = !restaurants[index]["isOpen"];
    });
  }

  void deleteRestaurant(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Restaurant', style: GoogleFonts.poppins()),
        content: Text(
          'Are you sure you want to delete "${restaurants[index]["name"]}"?',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Delete',
              style: GoogleFonts.poppins(color: Colors.redAccent),
            ),
            onPressed: () {
              setState(() {
                restaurants.removeAt(index);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void editRestaurant(int index) {
    // Navigate to edit screen or show modal bottom sheet
    // For demo, just showing a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${restaurants[index]["name"]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'My Restaurant',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: restaurants.isEmpty
            ? Center(
                child: Text(
                  'No restaurants added yet.',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Card(
                    color: AppColors.white.withValues(alpha: .289),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    shadowColor: AppColors.primary.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Restaurant Name & Status
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                restaurant['name'],
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: restaurant['isOpen']
                                      ? Colors.green.withOpacity(0.2)
                                      : Colors.red.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                child: Text(
                                  restaurant['isOpen'] ? 'Open' : 'Closed',
                                  style: GoogleFonts.poppins(
                                    color: restaurant['isOpen']
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Address
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  restaurant['address'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),

                          // Hours
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_outlined,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                restaurant['hours'],
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Action Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                icon: Icon(
                                  restaurant['isOpen']
                                      ? Icons.pause_circle
                                      : Icons.play_circle,
                                  color: restaurant['isOpen']
                                      ? Colors.orange
                                      : Colors.green,
                                ),
                                label: Text(
                                  restaurant['isOpen'] ? 'Close' : 'Open',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: restaurant['isOpen']
                                        ? Colors.orange
                                        : Colors.green,
                                  ),
                                ),
                                onPressed: () => toggleStatus(index),
                              ),
                              const SizedBox(width: 8),
                              TextButton.icon(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.deepPurple,
                                ),
                                label: Text(
                                  'Edit',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                onPressed: () => editRestaurant(index),
                              ),
                              const SizedBox(width: 8),
                              TextButton.icon(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                label: Text(
                                  'Delete',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                onPressed: () => deleteRestaurant(index),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        icon: const Icon(Icons.add),
        label: Text(
          'Add Restaurant',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          // Navigate to add restaurant screen
          Navigator.pushNamed(context, '/addRestaurant');
        },
      ),
    );
  }
}
