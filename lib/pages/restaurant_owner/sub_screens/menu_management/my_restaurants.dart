import 'package:excellent_trade_app/bloc/vendor/restaurant/restaurant_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/response/status.dart';
import '../../restaurant_owner_exports.dart';

class SelectRestaurant extends StatefulWidget {
  const SelectRestaurant({super.key});

  @override
  State<SelectRestaurant> createState() => _SelectRestaurantState();
}

class _SelectRestaurantState extends State<SelectRestaurant> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<RestaurantBloc>();
    if (bloc.state.restaurants == null || bloc.state.restaurants!.isEmpty) {
      bloc.add(FetchRestaurantEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MyAppBar(
        title: 'Select Restaurant',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: BlocBuilder<RestaurantBloc, RestaurantStates>(
          buildWhen: (previous, current) =>
              previous.restaurants != current.restaurants ||
              previous.registerRestaurantApi.status !=
                  current.registerRestaurantApi.status,
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
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }

            return ListView.separated(
              itemCount: state.restaurants!.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final r = state.restaurants![index];
                final isOpen = r.status.toLowerCase() == 'open';

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.menuManagement,
                      arguments: {"restaurant_id": r.id.toString()},
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
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
                                        color: Colors.grey[200],
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
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.store,
                                      size: 36,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 14),
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
                                          color: Colors.black87,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isOpen
                                            ? Colors.green.withOpacity(0.1)
                                            : Colors.red.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        isOpen ? "Open" : "Closed",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: isOpen
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 6),

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
                                        r.location.address,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
