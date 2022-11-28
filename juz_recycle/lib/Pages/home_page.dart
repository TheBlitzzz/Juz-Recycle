part of pages;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var recycledAmountWorth = 200.0;
  var recycledAmountKg = 20.0;
  var juzPoints = 215.0;

  @override
  Widget build(BuildContext context) {
    var heading1Style = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(fontSizeFactor: 0.8);

    var actionButtons = [
      _HomePageAction(
        "Suggest location",
        CupertinoIcons.map_pin_ellipse,
        () {
          debugPrint("Request Bin");
        },
      ),
      _HomePageAction(
        "Scan QR",
        CupertinoIcons.qrcode_viewfinder,
        () {
          debugPrint("QR");
        },
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              var actionButton = actionButtons[index];
              return AspectRatio(
                child: Card(
                  child: InkWell(
                    child: Center(
                      child: Column(
                        children: [
                          Icon(actionButton.icon, size: 60),
                          Text(
                            actionButton.title,
                            textAlign: TextAlign.center,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                    onTap: actionButton.onTap,
                  ),
                ),
                aspectRatio: 1,
              );
            },
            itemCount: actionButtons.length,
            shrinkWrap: true,
          ),
          const SizedBox(height: 16.0),
          Text("Your Contributions", style: heading1Style),
          SizedBox(
            child: Flex(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      child: Column(
                        children: [
                          const Text("You have donated"),
                          const Text(
                            "RM ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Align(
                            child: Text(
                              recycledAmountWorth.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          const Text("worth of recyclables in the past week"),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      child: Column(
                        children: [
                          const Text("Since joining, you contributed"),
                          Text(
                            recycledAmountKg.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Align(
                            child: Text(
                              "KG",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          const Text("of materials"),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ),
                ),
              ],
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
            ),
            height: 150,
          ),
          Card(
            child: Padding(
              child: Column(
                children: [
                  const Text("You currently have"),
                  Align(
                    child: Text(
                      juzPoints.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  const Align(
                    child: const Text("of JuzPoints"),
                    alignment: Alignment.centerRight,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              padding: const EdgeInsets.all(8.0),
            ),
          ),
          const SizedBox(
            child: Card(
              child: Align(
                child: Text(
                  "Bar graph of how much the user has donated",
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              ),
            ),
            height: 150,
            width: double.infinity,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class _HomePageAction {
  final String title;
  final IconData icon;
  final Function() onTap;

  _HomePageAction(this.title, this.icon, this.onTap);
}
