part of pages;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Profile"),
      ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            debugPrint("Hi");
          },
          child: const Text("Say Hi"),
        ),
      ),
    );
  }
}
