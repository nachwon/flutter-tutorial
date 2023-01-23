import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultUserImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8czzbrLzXJ9R_uhKyMiwj1iGxKhJtH7pwlQ&usqp=CAU";

class DavinciUserProfile extends StatelessWidget {
  final String username;
  final String? imageUrl;
  final bool invert;

  const DavinciUserProfile({
    super.key,
    required this.username,
    this.imageUrl,
    this.invert = false,
  });

  @override
  Widget build(BuildContext context) {
    var profileImg = Container(
      width: 45,
      height: 45,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: -2,
            color: Colors.grey,
            offset: Offset(2, 2),
          )
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        imageUrl ?? defaultUserImage,
        fit: BoxFit.cover,
        height: 45,
      ),
    );

    var usernameText = Text(
      username,
      style: GoogleFonts.passionOne(
        fontSize: 20,
      ),
    );

    List<StatelessWidget> children;
    if (invert) {
      children = [usernameText, profileImg];
    } else {
      children = [profileImg, usernameText];
    }

    return Row(
      children: children,
    );
  }
}
