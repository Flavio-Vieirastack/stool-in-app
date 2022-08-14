import 'package:flutter/material.dart';
import 'package:stool_in/core/widgets/app_coments_cards/app_coments_cards.dart';
import 'package:stool_in/core/widgets/app_scheduling_card/app_scheduling_card.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //context.read<HomeCubit>().getServiceProviders(pageQuantity: 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          AppComentsCards(
            userUrlImage: 'userUrlImage',
            userName: 'userName',
            userComent: 'userComent',
            votes: 3,
          ),
          SizedBox(
            height: 10,
          ),
          AppSchedulingCard(
            cancelOnPressed: () {},
            city: 'city',
            district: 'district',
            houseNumber: 'houseNumber',
            jobDate: 'jobDate',
            jobHour: 'jobHour',
            referencePoint: 'referencePoint',
            serviceDescription: 'serviceDescription',
            servicesTodo: 'servicesTodo',
            street: 'street',
            totalPrice: '200',
            userComentary: 'userComentary',
            userComentaryVisible: true,
            userName: 'userName',
            userUrlImage: 'userUrlImage',
            userState: 'CE',
          ),
           SizedBox(
             height: 50.h,
          ),
        ],
      ),
    );
  }
}
