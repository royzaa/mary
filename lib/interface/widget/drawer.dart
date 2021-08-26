import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:url_launcher/url_launcher.dart';

import './dialog_exit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double drawerWidth = size.width < 330 ? 280 : 310;
    return Container(
      width: drawerWidth,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //height: 140,
            width: drawerWidth,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.network(
                  'https://drive.google.com/uc?id=1FoA5L4NfOUjfJGbsaYcmOMoOm6BEQeEi',
                  height: 100,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child: PlaceholderLines(
                        count: 3,
                        animate: true,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'MARY - My wonderful city vehicle',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: drawerWidth - 40,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.open_in_browser,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'More apps',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () async {
                      await canLaunch(
                              'https://m-edukasi.kemdikbud.go.id/medukasi')
                          ? await launch(
                              'https://m-edukasi.kemdikbud.go.id/medukasi')
                          : throw 'Couldn\'t access url';
                    },
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    'Exit',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    showDialog(
                      context: context,
                      builder: (context) => const DialogExit(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
