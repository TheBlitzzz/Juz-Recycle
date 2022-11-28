part of pages;

class StartPage extends StatefulWidget {
  final String title;

  const StartPage({required this.title, Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/juz_recycle_logo.png"),
              CupertinoButton.filled(
                onPressed: () => Navigator.of(context).pushNamed("/"),
                child: const Text(
                  "Get Started",
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray);
  }
}
