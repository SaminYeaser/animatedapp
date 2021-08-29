import 'package:animatedapp/constant.dart';
import 'package:animatedapp/controllers/home_controller.dart';
import 'package:animatedapp/screen/home/components/header.dart';
import 'package:animatedapp/screen/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:animatedapp/models/product.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details){
    if(details.primaryDelta! < -0.7){
      controller.changeHomeState(HomeState.cart);
    }else if(details.primaryDelta! > 12){
      controller.changeHomeState(HomeState.normal);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
          child: Container(
        color: Color(0xFFEAEAEA),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      height: headerHeight,
                      child: HomeHeader(),
                    ),
                    Positioned(
                      top: headerHeight,
                      left: 0,
                      right: 0,
                      height: constraints.maxHeight - headerHeight - cartBarHeight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(defaultPadding * 1.5),
                                bottomRight: Radius.circular(defaultPadding * 1.5))),
                        child:
                        GridView.builder(
                          itemCount: demo_product.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: defaultPadding,
                              crossAxisSpacing: defaultPadding),
                          itemBuilder: (context, index) {
                            return
                              ProductCard(
                              product: demo_product[index],
                              press: () {},
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: cartBarHeight,
                      child: GestureDetector(
                        onVerticalDragUpdate: _onVerticalGesture,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                );
              }
            );
          }
        ),
      )),
    );
  }
}
