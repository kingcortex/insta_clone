import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int indexImage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          buildHeader(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            height: 365,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  indexImage = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(
                  [
                    "assets/images/Feed.png",
                    "assets/images/Feed2.png",
                    "assets/images/Feed3.png"
                  ][index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 17,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/Pic-3.png"),
                foregroundImage: AssetImage("assets/images/Pic-3.png"),
              ),
              const Gap(7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "Arneo Paris",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    "Arneo",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset("assets/icons/Threedots.svg")
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Heart.svg",
                    height: 24,
                    width: 24,
                  ),
                  const Gap(10),
                  SvgPicture.asset("assets/icons/Comment.svg"),
                  const Gap(10),
                  SvgPicture.asset(
                    "assets/icons/Share-2.svg",
                    height: 24,
                    width: 24,
                  ),
                  const Gap(90),
                  SizedBox(
                    width: 36,
                    height: 6,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (constext, index) {
                        return imageIndexed(index: index);
                      },
                    ),
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/Bookmark.svg")
            ],
          ),
          Row(
            children: [
              Text(
                "Aimé par",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              Text(
                " Gabdu et d’autres personnes",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Gap(6),
          Text(
            "ArthurHazan Quel plaisir de retrouver mes étudiants de Web 2 ! Ils ont tellement progressés depuis l’année dernière ! #Proud",
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
          const Gap(4),
          Text(
            "Voir les 10 commentaires",
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black.withOpacity(0.40),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageIndexed({required index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: CircleAvatar(
        radius: 3,
        backgroundColor: index == indexImage
            ? const Color(0xff0098FD)
            : const Color(0xffC4C4C4),
      ),
    );
  }
}
