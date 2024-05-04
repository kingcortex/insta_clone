import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/data/storie_model.dart';

class StorieWidget extends StatelessWidget {
  final Storie storie;
  const StorieWidget({super.key, required this.storie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Stack(
                  children: [
                    Container(
                      height: 68,
                      width: 68,
                      decoration: storie.isUser
                          ? const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            )
                          : BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                              gradient: storie.inLive
                                  ? liveGradient()
                                  : storieGragient(),
                            ),
                    ),
                    Positioned.fill(
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        margin: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/${storie.imagePath}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (storie.inLive)
                Positioned(
                  bottom: 0,
                  left: 23,
                  child: Container(
                    alignment: Alignment.center,
                    height: 15,
                    width: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      gradient: liveRectangle(),
                    ),
                    child: Text(
                      "Live",
                      style: GoogleFonts.poppins(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            ],
          ),
          SizedBox(
            width: 67,
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              storie.isUser ? "Votre Storie" : storie.name,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: storie.inLive ? FontWeight.bold : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Gradient liveGradient() {
  return const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff5B00C4),
      Color(0xffD00049),
    ],
  );
}

Gradient liveRectangle() {
  return const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffC7059A),
      Color(0xffDD0E44),
    ],
  );
}

Gradient storieGragient() {
  return const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff9E2692),
      Color(0xffFAA958),
    ],
  );
}
