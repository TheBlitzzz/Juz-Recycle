part of pages;

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  @override
  Widget build(BuildContext context) {
    var heading1Style = CupertinoTheme.of(context)
        .textTheme
        .navTitleTextStyle
        .apply(fontSizeFactor: 0.8);

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Look for a product",
            style: heading1Style,
          ),
          const CupertinoTextField(
            suffix: Icon(CupertinoIcons.search),
          ),
          const SizedBox(height: 8.0),
          ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset(
                      "assets/images/product_sample_${index % 2 + 1}.png"),
                  title: Text((index % 2 == 1)
                      ? "Mobile Phone Holder"
                      : "Frayed Pouch"),
                  subtitle:
                      Text((index % 2 == 1) ? "Price : RM25" : "Price : RM 29"),
                ),
              );
            },
            itemCount: 10,
            itemExtent: 80,
            shrinkWrap: true,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
