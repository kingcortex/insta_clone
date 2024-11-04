import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:instagram_clone/data/storie_model.dart';
import 'package:instagram_clone/widget/post_card.dart';

import '../widget/storie_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/Instagram_logo.svg"),
            Row(
              children: [
                SvgPicture.asset("assets/icons/Add.svg"),
                const Gap(16),
                SvgPicture.asset("assets/icons/Heart.svg"),
                const Gap(16),
                SvgPicture.asset("assets/icons/Share-2.svg"),
                const Gap(16),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 102,
                child: Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: listStorie.length,
                    itemBuilder: (context, index) {
                      return StorieWidget(
                        storie: listStorie[index],
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(10),
                  ),
                ),
              ),
            ),
            const Divider(),
            const PostCard(),
            const Gap(10),
            const PostCard()
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Home.svg"),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Search-2.svg"),
              label: "searsh",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Reels.svg"),
              label: "searsh",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Shop.svg"),
              label: "searsh",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Avatar.svg"),
              label: "searsh",
            )
          ],
        ),
      ),
    );
  }
}
