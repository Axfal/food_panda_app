import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../bloc/performance/performance_bloc.dart';
import '../../restaurant_owner_exports.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> yearlyLabels = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    final bloc = context.read<PerformanceBloc>();
    bloc.add(
      const FetchWeeklyPerformanceEvent(
        restaurantId: "5",
        type: "weekly_performance",
      ),
    );
    bloc.add(
      const FetchMonthlyPerformanceEvent(
        restaurantId: "5",
        type: "monthly_performance",
      ),
    );
    bloc.add(
      const FetchYearlyPerformanceEvent(
        restaurantId: "5",
        type: "yearly_performance",
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildMetricCard(
      String title,
      String value,
      Color color,
      IconData icon,
      ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 6),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPerformanceChart(List<double> data, String title) {
    if (data.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: Text("No data available")),
      );
    }

    final maxY = (data.reduce((a, b) => a > b ? a : b));
    final buffer = maxY * 0.7;
    final displayMaxY = (maxY + buffer).ceilToDouble();

    final interval = (displayMaxY / 4).ceilToDouble();

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: displayMaxY,
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: interval,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withValues(alpha: 0.2),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 48,
                      interval: interval,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "${value.toInt()}",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (title == "Yearly Performance" &&
                            value.toInt() < yearlyLabels.length) {
                          return Text(
                            yearlyLabels[value.toInt()],
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          );
                        }
                        return Text(
                          value.toInt().toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                      interval: 1,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: AppColors.primary,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.primary.withValues(alpha: 0.15),
                    ),
                    spots: List.generate(
                      data.length,
                          (index) => FlSpot(index.toDouble(), data[index]),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          spot.y.toStringAsFixed(2),
                          GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabContent(
      ApiResponse<String> apiResponse,
      List<double> data,
      String title,
      String totalIncome,
      String totalOrders,
      String avgOrder,
      ) {
    if (apiResponse.status == Status.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (apiResponse.status == Status.error) {
      return Center(child: Text(apiResponse.message ?? "Something went wrong"));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              buildMetricCard(
                "Total Sales",
                totalIncome,
                Colors.green,
                Icons.attach_money_rounded,
              ),
              const SizedBox(width: 12),
              buildMetricCard(
                "Orders",
                totalOrders,
                Colors.blue,
                Icons.receipt_long,
              ),
              const SizedBox(width: 12),
              buildMetricCard(
                "Avg. Order",
                avgOrder,
                Colors.orange,
                Icons.bar_chart,
              ),
            ],
          ),
          buildPerformanceChart(data, "$title Performance"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: MyAppBar(
        title: "Performance",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          indicatorColor: AppColors.white,
          labelColor: AppColors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: "Weekly"),
            Tab(text: "Monthly"),
            Tab(text: "Yearly"),
          ],
        ),
      ),
      body: BlocBuilder<PerformanceBloc, PerformanceState>(
        builder: (context, state) {
          final weeklyData = state.weeklyPerformance.weeklyPerformance?.breakdown
              ?.map((e) => double.tryParse(e.income ?? "0") ?? 0.0)
              .toList() ??
              [];

          final monthlyData =
              state.monthlyPerformance.monthlyPerformance?.breakdown
                  ?.map((e) => double.tryParse(e.income ?? "0") ?? 0.0)
                  .toList() ??
                  [];

          final yearlyBreakdown =
              state.yearlyPerformance.yearlyPerformance?.breakdown ?? [];
          var yearlyData = yearlyBreakdown
              .map((e) => double.tryParse(e.income ?? "0") ?? 0.0)
              .toList();
          yearlyLabels = yearlyBreakdown.map((e) => e.month ?? "").toList();

          if (yearlyData.length == 1) {
            yearlyData.insert(0, 0);
            yearlyLabels.insert(0, "");
          }

          return TabBarView(
            controller: _tabController,
            children: [
              buildTabContent(
                state.apiResponse,
                weeklyData,
                "Weekly",
                state.weeklyPerformance.weeklyPerformance?.totals?.totalIncome ??
                    "0",
                state.weeklyPerformance.weeklyPerformance?.totals?.totalOrders
                    ?.toString() ??
                    "0",
                state.weeklyPerformance.weeklyPerformance?.totals?.avgOrder ??
                    "0",
              ),
              buildTabContent(
                state.apiResponse,
                monthlyData,
                "Monthly",
                state.monthlyPerformance.monthlyPerformance?.totals
                    ?.totalIncome ??
                    "0",
                state.monthlyPerformance.monthlyPerformance?.totals?.totalOrders
                    ?.toString() ??
                    "0",
                state.monthlyPerformance.monthlyPerformance?.totals?.avgOrder ??
                    "0",
              ),
              buildTabContent(
                state.apiResponse,
                yearlyData,
                "Yearly",
                state.yearlyPerformance.yearlyPerformance?.totals?.totalIncome ??
                    "0",
                state.yearlyPerformance.yearlyPerformance?.totals?.totalOrders
                    ?.toString() ??
                    "0",
                state.yearlyPerformance.yearlyPerformance?.totals?.avgOrder ??
                    "0",
              ),
            ],
          );
        },
      ),
    );
  }
}
