import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon; // Parameter for the leading icon
  final VoidCallback? onBellIconTap; // Callback for the bell icon
  final VoidCallback? onLeadingIconTap; // Callback for the leading icon

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBellIconTap,
    this.onLeadingIconTap,
    this.leadingIcon, // Default icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      leading: GestureDetector(
        onTap: onLeadingIconTap, // Add onTap functionality
        child: CircleAvatar( backgroundColor: Color.fromARGB(253, 228, 23, 57),
          child: Icon(
            leadingIcon,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(253, 228, 23, 57),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
