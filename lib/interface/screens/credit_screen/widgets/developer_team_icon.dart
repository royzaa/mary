import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperTeamIcon extends StatelessWidget {
  const DeveloperTeamIcon({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.roles,
    required this.sosmed,
    required this.sosmedUrl,
    required this.index,
  }) : super(key: key);
  final String name;
  final String imageUrl;
  final List<String> roles;
  final String sosmed;
  final String sosmedUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      enableFeedback: true,
      tooltip: 'look our profile',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      color: Colors.white,
      elevation: 20,
      offset: const Offset(0, -32),
      child: imageUrl == ''
          ? Container(
              height: 120,
              width: 60,
              margin: EdgeInsets.only(right: 20, left: index == 0 ? 20 : 0),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor),
              child: Icon(
                Icons.person,
                color: Colors.grey[200],
                size: 36,
              ),
            )
          : Container(
              height: 120,
              width: 60,
              margin: EdgeInsets.only(right: 20, left: index == 0 ? 20 : 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: imageUrl == ''
                    ? Container(
                        height: 80,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[200],
                          size: 36,
                        ),
                      )
                    : Container(
                        height: 80,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                title: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Roles:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              ...roles.map(
                (role) => Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    role,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                title: Text(
                  '@' + sosmed,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(Icons.location_history_rounded),
                onTap: () async {
                  HapticFeedback.mediumImpact();
                  await canLaunch(sosmedUrl)
                      ? await launch(sosmedUrl)
                      : throw 'Could\'t access url';
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
