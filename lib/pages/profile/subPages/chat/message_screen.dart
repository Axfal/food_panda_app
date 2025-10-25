// ignore_for_file: avoid_print

import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/model/chat/conversation_model.dart';
import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import '../../../../bloc/chat/chat_bloc.dart';

class MessageScreen extends StatefulWidget {
  final Conversations? conversations;
  final RestaurantData? restaurantData;
  const MessageScreen({super.key, this.conversations, this.restaurantData});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  void _fetchMessages() {
    if (widget.conversations != null) {
      context.read<ChatBloc>().add(
        GetMessageEvent(
          action: 'get_messages',
          conversationId: widget.conversations!.id.toString(),
        ),
      );
    }
  }

  String _getChatName() {
    final testRestaurantId = SessionController.restaurantId;
    return (testRestaurantId != 0)
        ? widget.conversations?.customerName ??
              widget.restaurantData?.restaurantName ??
              'Unknown'
        : widget.conversations?.restaurantName ??
              widget.restaurantData?.restaurantName ??
              'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    final chatName = _getChatName();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: MyAppBar(
        title: chatName,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state.apiResponse.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.apiResponse.message ?? 'Error')),
            );
          }
        },
        buildWhen: (cur, pre) =>
            cur.messageModel.messages != pre.messageModel.messages,
        builder: (context, state) {
          if (state.apiResponse.status == Status.loading &&
              (state.messageModel.messages.isEmpty)) {
            return _buildShimmer();
          }

          final messages = state.messageModel.messages;
          return Column(
            children: [
              Expanded(
                child: messages.isEmpty
                    ? const Center(
                        child: Text(
                          "Start the conversation",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final msg = messages[index];
                          final testRestaurantId =
                              SessionController.restaurantId;

                          final isMe =
                              (testRestaurantId == 0 &&
                                  msg.senderType == "customer") ||
                              (testRestaurantId != 0 &&
                                  msg.senderType == "restaurant");

                          String formattedTime = '';
                          try {
                            final dateTime = DateTime.parse(
                              msg.createdAt ?? '',
                            );
                            formattedTime = DateFormat(
                              'hh:mm a',
                            ).format(dateTime);
                          } catch (_) {}

                          return Align(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(16),
                                  topRight: const Radius.circular(16),
                                  bottomLeft: Radius.circular(isMe ? 16 : 0),
                                  bottomRight: Radius.circular(isMe ? 0 : 16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 3,
                                    offset: const Offset(1, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: isMe
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    msg.messageText ?? '',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    formattedTime,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          cursorColor: Colors.black54,
                          style: GoogleFonts.poppins(color: Colors.black87),
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            filled: true,
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                            ),
                            fillColor: Colors.grey[100],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 23,
                        child: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: _sendMessage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Align(
          alignment: index.isEven
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 20,
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        );
      },
    );
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final testRestaurantId = SessionController.restaurantId;
    final userSession = SessionController.user;

    if (widget.conversations != null) {
      final restaurantId = widget.conversations?.restaurantId;
      final customerId = widget.conversations?.customerId;
      final senderType = testRestaurantId == 0 ? "customer" : "restaurant";
      final senderId = testRestaurantId == 0
          ? userSession.id
          : userSession.restaurantId;

      context.read<ChatBloc>().add(
        SendMessageEvent(
          restaurantId: restaurantId,
          customerId: customerId,
          senderType: senderType,
          senderId: senderId,
          message: text,
        ),
      );
    } else if (widget.restaurantData != null) {
      final restaurantId = widget.restaurantData?.restaurantId;
      final customerId = userSession.id;
      final senderId = userSession.id;
      final senderType = "customer";
      context.read<ChatBloc>().add(
        SendMessageEvent(
          restaurantId: restaurantId,
          customerId: customerId,
          senderType: senderType,
          senderId: senderId,
          message: text,
        ),
      );
    }

    _messageController.clear();
  }
}
