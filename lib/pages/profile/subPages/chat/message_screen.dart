// ignore_for_file: avoid_print

import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/model/chat/conversation_model.dart';
import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import '../../../../bloc/chat/chat_bloc.dart';

class MessageScreen extends StatefulWidget {
  final Conversations conversations;
  const MessageScreen({super.key, required this.conversations});

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
    context.read<ChatBloc>().add(
      GetMessageEvent(
        action: 'get_messages',
        conversationId: widget.conversations.id.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurantId = SessionController.restaurantId;
    final name = (restaurantId != 0)
        ? widget.conversations.customerName ?? 'Unknown'
        : widget.conversations.restaurantName ?? 'Unknown';

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: MyAppBar(
        title: name,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state.apiResponse.status == Status.loading) {
            return _buildShimmer();
          }

          if (state.apiResponse.status == Status.error) {
            return Center(
              child: Text(
                "Error: ${state.apiResponse.message}",
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            );
          }

          final messages = state.messageModel.messages;
          if (messages.isEmpty) {
            return const Center(
              child: Text("No messages yet.", style: TextStyle(fontSize: 15)),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isMe =
                        (restaurantId == 0 && msg.senderType == "customer") ||
                        (restaurantId != 0 && msg.senderType == "restaurant");

                    String formattedTime = '';
                    try {
                      final dateTime = DateTime.parse(msg.createdAt ?? '');
                      formattedTime = DateFormat('hh:mm a').format(dateTime);
                    } catch (e) {
                      formattedTime = '';
                    }

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

    // TODO: send message via Bloc or API
    _messageController.clear();
  }
}
