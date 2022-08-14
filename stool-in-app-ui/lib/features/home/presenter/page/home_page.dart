import 'package:flutter/material.dart';
import 'package:stool_in/core/widgets/app_coments_cards/app_coments_cards.dart';
import 'package:stool_in/core/widgets/app_scheduling_card/app_scheduling_card.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/widgets/contracted_services_card/contracted_services_card.dart';
import 'package:stool_in/core/widgets/service_provider_cards/service_provider_cards.dart';

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
            height: 10,
          ),
          ContractedServicesCard(
            date: 'date',
            description: 'description',
            hour: 'hour',
            serviceProviderImageUrl: 'serviceProviderImageUrl',
            serviceProviderName: 'serviceProviderName',
            serviceTodo: 'serviceTodo',
            status: 'status',
            total: 'total',
            userComent: 'userComent',
            showUserProviderDataCallBack: () {},
          ),
          SizedBox(
            height: 10,
          ),
          ServiceProviderCards(
            userDistance: 'userDistance',
            userName: 'userName',
            userServicesExecuted: 'five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            userUrlImage: 'userUrlImage',
            userVotes: '5',
            onPressed: () {},
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
