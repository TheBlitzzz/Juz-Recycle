part of pages;

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    var heading1Style = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(fontSizeFactor: 0.8);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Recycling Initiatives",
                style: heading1Style,
              ),
              CupertinoButton(
                onPressed: () {
                  // Navigator.of(context).push(CupertinoPageRoute(
                  // builder: (context) => const ExplorePage()));
                  // redo
                },
                child: const Text("More..."),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          SizedBox(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    splashColor: CupertinoColors.activeGreen,
                    onTap: () {
                      Navigator.of(context)
                          .push(CupertinoPageRoute(builder: (context) {
                        return CupertinoPageScaffold(
                          navigationBar: const CupertinoNavigationBar(
                            middle: Text("Kloth Cares"),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset(
                                    "assets/images/kloth_cares_logo.png"),
                                Column(
                                  children: [
                                    Text("Name", style: heading1Style),
                                    const Text("Kloth Cares"),
                                    const SizedBox(height: 8.0),
                                    Text("Description", style: heading1Style),
                                    const Text(
                                        "Practicing the 5Rs to rethink, reuse, reduce, repurpose and recycle. Send your old and unwanted fabric our way and we'll use them to make eco-friendly products"),
                                    const SizedBox(height: 8.0),
                                    Text("Type", style: heading1Style),
                                    const Text("Fabric"),
                                    const SizedBox(height: 8.0),
                                    CupertinoButton.filled(
                                      child: const Text("Find us"),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) {
                                          return CupertinoPageScaffold(
                                            navigationBar:
                                                const CupertinoNavigationBar(
                                              middle: Text("Kloth Cares"),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Image.asset(
                                                  "assets/images/kloth_cares_map_demo.png"),
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                            ),
                                          );
                                        }));
                                      },
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            padding: const EdgeInsets.all(16.0),
                          ),
                        );
                      }));
                    },
                    child: Padding(
                      child: Column(
                        children: [
                          Image.asset("assets/images/kloth_cares_logo.png"),
                          Text("Kloth Cares", style: heading1Style),
                        ],
                      ),
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ),
                );
              },
              itemCount: 4,
              itemExtent: 150,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
            height: 170,
          ),
          const SizedBox(height: 16.0),
          Text(
            "Map of recycling initiatives",
            style: heading1Style,
          ),
          const SizedBox(height: 8.0),
          Image.asset("assets/images/kloth_cares_map_demo.png"),
        ],
      ),
    );
  }
}
