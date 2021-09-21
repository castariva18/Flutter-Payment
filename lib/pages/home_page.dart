part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected = -1;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/target.png',
                height: 230,
                width: 230,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Upgrade to ", style: whiteHeaderFontStyle),
                  Text(
                    "Pro",
                    style: blueHeaderStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text("Go unlock all features and", style: blueTransparentStyle),
              Text("build your own business bigger",
                  style: blueTransparentStyle),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ));
    }

    Widget option(int index, String title, String desc, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selected = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: _selected == index ? blueColor : whiteColor)),
          child: Column(
            children: [
              Row(
                children: [
                  _selected == index
                      ? Image.asset(
                          'assets/selected.png',
                          height: 20,
                          width: 20,
                        )
                      : Image.asset(
                          'assets/unselect.png',
                          height: 20,
                          width: 20,
                        ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: whiteFontStyle),
                      Text(desc, style: whiteDescFontStyle)
                    ],
                  ),
                  Spacer(),
                  Text(price, style: whiteHeaderFontStyle)
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget checkout() {
      return Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blueColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Checkout Now",
              style: whiteButtonFontStyle,
            )
          ],
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: darkBlueColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              option(0, "Monthly", "Good for starting up", "\$20"),
              option(1, "Quarterly", "Focusing on building", "\$55"),
              option(2, "Yearly", "Steady company", "\$220"),
              SizedBox(height: 30),
              _selected == -1 ? SizedBox(height: 10) : checkout(),
            ],
          ),
        ),
      ),
    );
  }
}
