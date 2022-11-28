part of pages;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search_circle_fill),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_circle_fill),
            label: "Rewards",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_list),
            label: "Marketplace",
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          routes: {
            "/": (context) => const HomePage(),
            "/profile": (context) => const ProfilePage(),
          },
          builder: (BuildContext context) {
            var tabContent;
            var tabTitle = "";
            switch (index) {
              case 1:
                tabContent = const ExplorePage();
                tabTitle = "Explore";
                break;
              case 2:
                tabContent = const RewardsPage();
                tabTitle = "Rewards";
                break;
              case 3:
                tabContent = const MarketplacePage();
                tabTitle = "Marketplace";
                break;
              default:
                tabContent = const HomePage();
                tabTitle = "Home";
                break;
            }

            var ctxTheme = CupertinoTheme.of(context);
            var ctxTextTheme = ctxTheme.textTheme;
            var slivers = [
              CupertinoSliverNavigationBar(
                leading: GestureDetector(
                  child: const Icon(CupertinoIcons.profile_circled),
                  onTap: () => Navigator.of(context).pushNamed("/profile"),
                ),
                largeTitle: Text(tabTitle),
                trailing: GestureDetector(
                  child: const Icon(CupertinoIcons.settings),
                  onTap: () => debugPrint("he"),
                ),
              ),
              SliverFillRemaining(
                child: CupertinoTheme(
                  data: ctxTheme.copyWith(
                    textTheme: ctxTextTheme.copyWith(
                      textStyle: ctxTextTheme.textStyle
                          .apply(color: CupertinoColors.black),
                      navTitleTextStyle: ctxTextTheme.navTitleTextStyle
                          .apply(color: CupertinoColors.black),
                      navLargeTitleTextStyle: ctxTextTheme
                          .navLargeTitleTextStyle
                          .apply(color: CupertinoColors.black),
                    ),
                  ),
                  child: Padding(
                    child: tabContent,
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ];

            return CupertinoPageScaffold(
              child: CustomScrollView(
                slivers: slivers,
              ),
            );
          },
        );
      },
    );
  }
}
