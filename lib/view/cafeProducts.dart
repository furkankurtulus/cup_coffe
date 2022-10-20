// ignore_for_file: prefer_const_constructors

import 'package:bottom_bar/bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cup_coffe/service/firevbase_service.dart';
import 'package:cup_coffe/view/cartDetail.dart';
import 'package:cup_coffe/viewmodel/order_viewmodel.dart';
import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utility/dotIndicator.dart';

class CafeProducts extends StatefulWidget {
  const CafeProducts({Key? key}) : super(key: key);

  @override
  State<CafeProducts> createState() => _CafeProductsState();
}

class _CafeProductsState extends State<CafeProducts> with SingleTickerProviderStateMixin {
  late final OrderViewModel _orderViewModel;

  late TabController _tabController;
  var cuurentPage = 0;
  int orderSize = 1;
  @override
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _orderViewModel = OrderViewModel(FirebaseService());
    await _orderViewModel.getProducts();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.98),
          body: orderDetailArea(context),
        ),
      ),
    );
  }

  Widget orderDetailArea(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageHeader(),
          tableReserve(),
          pageViewHeader(),
          Expanded(child: tabView()),
        ],
      ),
    );
  }

  Widget pageHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        Text(
          "Place Order",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
        )
      ],
    );
  }

  Widget tableReserve() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            gradient: LinearGradient(
              colors: const [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Image.asset(
                      fit: BoxFit.fill,
                      "lib/assets/png/cafe1.png",
                    )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.left,
                          "Reserve a table now",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          "Lorem ipsum dolor sit amet, cons ectetur adipiscing elit.",
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }

  Widget pageViewHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: CircleTabIndicator(color: Colors.black, radius: 4),
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  "Coffee",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Cakes",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              )
            ],
            controller: _tabController,
          ),
        ),
        // Icon(Icons.sort)
        Container(
            child: Image.asset(
          color: Color.fromRGBO(157, 157, 157, 0.6),
          scale: 1,
          fit: BoxFit.fill,
          "lib/assets/png/sortIcon.png",
        )),
      ],
    );
  }

  Widget tabView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        SingleChildScrollView(child: coffees()),
        SingleChildScrollView(child: coffees()),
      ],
    );
  }

  Widget coffees() {
    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                textAlign: TextAlign.left,
                "Today’s special",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _orderViewModel.productList.length,
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: MediaQuery.of(context).size.height / 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: Image.asset(
                            fit: BoxFit.fill,
                            "lib/assets/png/${_orderViewModel.productList[index].imgname}.png",
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height / 20,
                        child: ListTile(
                          title: Text(
                            _orderViewModel.productList[index].productname.toString(),
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            _orderViewModel.productList[index].price != null ? "\$ " + _orderViewModel.productList[index].price.toString() : "",
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }

  Future<void> getProducts() async {
    await _orderViewModel.getProducts();
  }
}
