import 'package:excellent_trade_app/bloc/vendor/restaurant/restaurant_bloc.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:flutter/cupertino.dart';

import '../restaurant_owner_exports.dart';

class MyRestaurantScreen extends StatefulWidget {
  const MyRestaurantScreen({super.key});

  @override
  State<MyRestaurantScreen> createState() => _MyRestaurantScreenState();
}

class _MyRestaurantScreenState extends State<MyRestaurantScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<RestaurantBloc>();
    if (bloc.state.restaurants == null || bloc.state.restaurants!.isEmpty) {
      bloc.add(FetchRestaurantEvent());
    }
  }


  final List<Map<String, dynamic>> restaurants = [
    {
      "id": 10,
      "name": "anfal",
      "description": "asdasdasdasdasdasdasd",
      "phone": "03418410597",
      "address": "lahore",
      "logo":
          "https://adfirst.pk/Panda_API/API/uploads/logos/logo_689dc2e21a9d36.04895386.png",
      "status": "closed",
      "hours": "3",
      "rating": "0.0",
      "created_at": "2025-08-14 11:05:06",
    },
    {
      "id": 11,
      "name": "anfal",
      "description": "asdasdasdasdasdasdasd",
      "phone": "03418410597",
      "address": "lahore",
      "logo": null,
      "status": "closed",
      "hours": "3",
      "rating": "0.0",
      "created_at": "2025-08-14 12:01:25",
    },
    {
      "id": 12,
      "name": "anfal",
      "description": "asdasdasdasdasdasdasd",
      "phone": "03418410597",
      "address": "lahore",
      "logo": null,
      "status": "closed",
      "hours": "3",
      "rating": "0.0",
      "created_at": "2025-08-14 12:01:28",
    },
    {
      "id": 6,
      "name": "Pizza House",
      "description": "Best pizza in town",
      "phone": "03418410597",
      "address": "lahore",
      "logo":
          "https://adfirst.pk/Panda_API/API/uploads/logos/logo_6899b7e5200a16.77744348.jpg",
      "status": "open",
      "hours": "Mon-Fri 10:00 AM - 9:00 PM",
      "rating": "0.0",
      "created_at": "2025-08-11 09:29:09",
    },
  ];

  void deleteRestaurant(int id, String name) {
    showDialog(
      context: context,

      builder: (_) => AlertDialog(
        title: Text(
          "Delete Restaurant",
          style: GoogleFonts.poppins(color: Colors.black87),
        ),
        content: Text(
          "Are you sure you want to delete \"$name\"?",
          style: GoogleFonts.poppins(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            child: Text(
              "Cancel",
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              "Delete",
              style: GoogleFonts.poppins(color: Colors.redAccent),
            ),
            onPressed: () {
              context.read<RestaurantBloc>().add(
                DeleteRestaurantEvent(id: id.toString()),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void editRestaurant(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Edit ${restaurants[index]['name']}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MyAppBar(
        title: 'My Restaurants',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: BlocBuilder<RestaurantBloc, RestaurantStates>(
          buildWhen: (previous, current) => previous.restaurants != current.restaurants || previous.registerRestaurantApi.status != current.registerRestaurantApi.status,
          builder: (context, state) {
            if (state.registerRestaurantApi.status == Status.loading) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.black54),
              );
            }

            if (state.restaurants!.isEmpty) {
              return Center(
                child: Text(
                  "No Restaurant Found",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.restaurants!.length,
              itemBuilder: (context, index) {
                final r = state.restaurants![index];
                final isOpen = r.status == 'open';
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: r.logo != null
                              ? Image.network(
                                  r.logo!,
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 70,
                                      width: 70,
                                      color: Colors.grey[300],
                                      child: const Icon(
                                        Icons.store,
                                        size: 36,
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  height: 70,
                                  width: 70,
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.store,
                                    size: 36,
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                        const SizedBox(width: 12),

                        // Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name + Status
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      r.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isOpen
                                          ? Colors.green[100]
                                          : Colors.red[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    child: Text(
                                      isOpen ? 'Open' : 'Closed',
                                      style: GoogleFonts.poppins(
                                        color: isOpen
                                            ? Colors.green[800]
                                            : Colors.red[800],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              // Address
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      r.address,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey[700],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              // Hours
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    r.hours,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              // Action Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isOpen
                                          ? Icons.pause_circle
                                          : Icons.play_circle,
                                      color: isOpen
                                          ? Colors.orange
                                          : Colors.green,
                                    ),
                                    onPressed: () {
                                      context.read<RestaurantBloc>().add(
                                        UpdateRestaurantEvent(
                                          id: r.id,
                                          status: isOpen ? 'closed' : 'open',
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () {
                                      final String userId = SessionController.user.id.toString();
                                      Navigator.pushNamed(context, RoutesName.registerRestaurant, arguments: {
                                        "restaurant" : r,
                                        "user_id": userId
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () =>
                                        deleteRestaurant(r.id, r.name),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white, size: 25),
        label: Text(
          'Add Restaurant',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        onPressed: () {
          final userId = SessionController.user.id.toString();
          Navigator.pushNamed(
            context,
            RoutesName.registerRestaurant,
            arguments: {'user_id': userId},
          );
        },
      ),
    );
  }
}
