import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './widget/pop_up_volume.dart';
import './widget/menus.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 180.0,
              backgroundColor: Colors.white,
              actions: [PopUpVolume()],
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: SvgPicture.network(
                  'https://drive.google.com/uc?id=12zTjH3XeQonbIgWrDQxiJejUgKW0RQde',
                  placeholderBuilder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.cover,
                ),
                titlePadding: const EdgeInsets.only(left: 54, bottom: 16),
                title: const Text(
                  'Good morning, Budi',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Select menu',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Find menu you want to explore',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400]!.withOpacity(0.7)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Menus()
            ],
          ),
        ),
      ),
    );
  }
}
