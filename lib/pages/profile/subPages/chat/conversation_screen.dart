// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:excellent_trade_app/bloc/chat/chat_bloc.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import '../../../../model/chat/conversation_model.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  void initState() {
    super.initState();
    _fetchConversations();
  }

  void _fetchConversations() {
    final userType = SessionController.restaurantId == 0
        ? 'customer'
        : 'restaurant';
    final bloc = context.read<ChatBloc>();
    if (bloc.state.conversationModel.conversations.isEmpty) {
      bloc.add(
        GetConversationEvent(action: 'get_conversations', userType: userType),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: "Conversations",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppColors.primary,
        onRefresh: () async {
          final userType = SessionController.restaurantId == 0
              ? 'customer'
              : 'restaurant';
          final bloc = context.read<ChatBloc>();
          bloc.add(
            GetConversationEvent(
              action: 'get_conversations',
              userType: userType,
            ),
          );
        },
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state.apiResponse.status == Status.loading) {
              return _buildShimmerList();
            }

            if (state.apiResponse.status == Status.error) {
              return _buildError(
                state.apiResponse.message ?? "Something went wrong",
              );
            }

            final conversations = state.conversationModel.conversations;

            if (conversations.isEmpty) {
              return _buildEmptyState();
            }

            return ListView.separated(
              itemCount: conversations.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey.shade200, height: 1),
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                return _conversationTile(conversation);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _conversationTile(Conversations conversation) {
    final name =
        conversation.restaurantName ??
        conversation.customerName ??
        "Unknown User";
    final message = conversation.lastMessage ?? "No message yet";
    String time = "--:--";
    if (conversation.lastMessageAt != null &&
        conversation.lastMessageAt!.isNotEmpty) {
      try {
        final dateTime = DateTime.parse(conversation.lastMessageAt!);
        time = DateFormat('dd/MM/yy').format(dateTime);
      } catch (e) {
        print("Error parsing date: $e");
      }
    }

    final imageUrl = '${AppUrl.baseUrl}/${conversation.restaurantLogo}';
    return InkWell(
      onTap: () {
        print("Open chat with ${conversation.id}");
        Navigator.pushNamed(
          context,
          RoutesName.messageScreen,
          arguments: {"conversation": conversation},
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.primary.withValues(alpha: 0.2),
              backgroundImage: (imageUrl.isNotEmpty)
                  ? NetworkImage(imageUrl)
                  : null,
              child: (imageUrl.isEmpty)
                  ? const Icon(Icons.person, color: Colors.white, size: 28)
                  : null,
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                // const SizedBox(height: 6),
                // if (conversation.lastMessage != null &&
                //     conversation.lastMessage!.isNotEmpty)
                //   Container(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 6,
                //       vertical: 2,
                //     ),
                //     decoration: BoxDecoration(
                //       color: AppColors.primary,
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Text(
                //       "1",
                //       style: GoogleFonts.poppins(
                //         color: Colors.white,
                //         fontSize: 11,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListTile(
            leading: const CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
            ),
            title: Container(
              height: 12,
              width: double.infinity,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 10,
              width: 150,
              margin: const EdgeInsets.only(top: 6),
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 50, color: Colors.redAccent),
          const SizedBox(height: 12),
          Text(
            message,
            style: GoogleFonts.poppins(color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _fetchConversations,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Retry", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              color: Colors.grey.shade400,
              size: 70,
            ),
            const SizedBox(height: 16),
            Text(
              "No conversations yet",
              style: GoogleFonts.poppins(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
