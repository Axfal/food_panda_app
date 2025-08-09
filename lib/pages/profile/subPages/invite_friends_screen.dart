import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen>
    with SingleTickerProviderStateMixin {
  final String _referralCode = 'FOOD MATE';
  final String _referralLink = 'https://foodpanda.example/ref/\$_referralCode';

  final List<_InviteEntry> _recentInvites = [
    _InviteEntry(name: 'Ayesha', reward: '₨200', status: InviteStatus.redeemed),
    _InviteEntry(name: 'Bilal', reward: '₨200', status: InviteStatus.pending),
    _InviteEntry(name: 'Sana', reward: '₨200', status: InviteStatus.redeemed),
  ];

  int _successfulInvites = 2;
  final int _targetInvites = 5;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _pulseAnim = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _pulseController.forward();
      }
    });
    _pulseController.forward();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _copyCode() async {
    await Clipboard.setData(ClipboardData(text: _referralLink));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Referral link copied to clipboard'),
        duration: Duration(milliseconds: 1200),
      ),
    );
  }

  Future<void> _shareReferral() async {
    await _copyCode();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Open a messaging app and paste to share.'),
        duration: Duration(milliseconds: 1200),
      ),
    );
  }

  void _simulateInviteAccepted(String name) {
    setState(() {
      _recentInvites.insert(
        0,
        _InviteEntry(name: name, reward: '₨200', status: InviteStatus.redeemed),
      );
      _successfulInvites++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final bool isWide = size.width > 500;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: MyAppBar(
        title: "Invites Friends",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildReferralCard(context, isWide),
              const SizedBox(height: 14),
              _buildProgressCard(theme),
              const SizedBox(height: 14),
              _buildBenefitsSection(),
              const SizedBox(height: 14),
              _buildInviteActionsRow(isWide),
              const SizedBox(height: 18),
              _buildRecentInvitesList(),
              const SizedBox(height: 40),
              // CTA sticky-ish area
              RoundButton(
                title: 'Invite friends — Earn rewards',
                onPress: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReferralCard(BuildContext context, bool isWide) {
    return ScaleTransition(
      scale: _pulseAnim,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            // left: illustration
            Container(
              width: isWide ? 84 : 64,
              height: isWide ? 84 : 64,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: .099),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.card_giftcard,
                size: 36,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Share & earn',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Give your friends ₨200 and get ₨200 when they order for the first time.',
                    style: TextStyle(
                      color: Colors.grey[700],
                      height: 1.25,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _referralCode,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: _copyCode,
                                child: Row(
                                  children: const [
                                    Icon(Icons.copy, size: 18),
                                    SizedBox(width: 6),
                                    Text('Copy'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: _shareReferral,
                        icon: const Icon(Icons.share_outlined),
                        label: const Text('Share'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
    );
  }

  Widget _buildProgressCard(ThemeData theme) {
    final percent = (_successfulInvites / _targetInvites).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$_successfulInvites / $_targetInvites',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 220,
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 8,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _successfulInvites >= _targetInvites
                    ? 'Goal reached — claim reward'
                    : 'Invite more friends to unlock bonus',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: _successfulInvites >= _targetInvites
                ? () {}
                : () => _simulateInviteAccepted('New Friend'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                _successfulInvites >= _targetInvites ? 'Claim' : 'Simulate +1',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitsSection() {
    final items = [
      _BenefitItem(
        icon: Icons.local_offer_outlined,
        title: 'Instant reward',
        subtitle: 'Friends get ₨200 off',
      ),
      _BenefitItem(
        icon: Icons.repeat,
        title: 'No catch',
        subtitle: 'Both get benefit after first order',
      ),
      _BenefitItem(
        icon: Icons.lock_outline,
        title: 'Secure',
        subtitle: 'Link is private to you',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Why invite?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((it) => _benefitCard(it)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _benefitCard(_BenefitItem item) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .099),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(item.icon, size: 30, color: AppColors.primary),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Text(
            item.subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInviteActionsRow(bool isWide) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _shareReferral,
            icon: const Icon(Icons.message_outlined, color: AppColors.primary),
            label: Text(
              'Message',
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(color: AppColors.primary, width: 1.5),
              foregroundColor: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: isWide ? 150 : 120,
          child: ElevatedButton.icon(
            onPressed: _copyCode,
            icon: const Icon(Icons.link),
            label: const Text('Copy link'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentInvitesList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent invites',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ..._recentInvites.map((it) => _inviteTile(it)),
          if (_recentInvites.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'No invites yet — share your link to get started',
                style: TextStyle(color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }

  Widget _inviteTile(_InviteEntry entry) {
    final statusColor = entry.status == InviteStatus.redeemed
        ? Colors.green
        : Colors.orange;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: .099),
        foregroundColor: Colors.black87,
        radius: 25,
        child: Text(
          entry.name[0],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
      title: Text(
        entry.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        entry.status == InviteStatus.redeemed
            ? 'Reward: ${entry.reward}'
            : 'Pending — not yet ordered',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          entry.status == InviteStatus.redeemed ? 'Redeemed' : 'Pending',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

enum InviteStatus { pending, redeemed }

class _InviteEntry {
  final String name;
  final String reward;
  final InviteStatus status;

  _InviteEntry({
    required this.name,
    required this.reward,
    required this.status,
  });
}

class _BenefitItem {
  final IconData icon;
  final String title;
  final String subtitle;
  _BenefitItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
