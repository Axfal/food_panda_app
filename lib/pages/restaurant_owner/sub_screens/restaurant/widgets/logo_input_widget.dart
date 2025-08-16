import '../restaurant_exports.dart';

class LogoInputWidget extends StatefulWidget {
  final String? logo;
  const LogoInputWidget({super.key, this.logo});

  @override
  State<LogoInputWidget> createState() => _LogoInputWidgetState();
}

class _LogoInputWidgetState extends State<LogoInputWidget> {
  Future<void> _pickLogo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (!mounted) return;
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      context.read<RestaurantBloc>().add(LogoChangeEvent(logo: file));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantStates>(
      buildWhen: (previous, current) => previous.logo != current.logo,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: _pickLogo,
                borderRadius: BorderRadius.circular(65),
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage: widget.logo != null
                      ? NetworkImage(widget.logo!)               // FIXED
                      : state.logo != null
                      ? FileImage(state.logo!)
                      : null,
                  child: (widget.logo == null && state.logo == null)
                      ? Icon(
                    Icons.camera_alt_rounded,
                    size: 42,
                    color: Colors.grey.shade500,
                  )
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Tap to upload logo',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'PNG, JPG up to 5MB',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
