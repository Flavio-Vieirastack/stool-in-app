import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/widgets/app_avatar/app_avatar.dart';

import '../../helpers/theme/colors/app_colors.dart';
import '../../helpers/theme/text_styles/app_text_styles.dart';
part './widgets/contracted_services_content.dart';

class ContractedServicesCard extends StatelessWidget {
  final String total;
  final String status;
  final String description;
  final String date;
  final String hour;
  final String userComent;
  final String serviceTodo;
  final String serviceProviderImageUrl;
  final String serviceProviderName;
  final bool showUserProviderData;
  final VoidCallback showUserProviderDataCallBack;
  const ContractedServicesCard(
      {Key? key,
      required this.date,
      required this.description,
      required this.hour,
      required this.serviceProviderImageUrl,
      required this.serviceProviderName,
      required this.serviceTodo,
      required this.status,
      required this.total,
      required this.userComent,
      this.showUserProviderData = false,
      required this.showUserProviderDataCallBack})
      : super(key: key);
  //! Esse e o card de serviços que o cliente agendou
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.buttonLeftGradientColor.withOpacity(0.2),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: RadialGradient(
          radius: 2,
          colors: [
            AppColors.grey.withOpacity(0.5),
            AppColors.black.withOpacity(0.3),
          ],
        ),
      ),
      child: _ContractedServicesContent(
        date: date,
        description: description,
        hour: hour,
        serviceProviderImageUrl: serviceProviderImageUrl,
        serviceProviderName: serviceProviderName,
        serviceTodo: serviceTodo,
        showUserProviderData: showUserProviderData,
        showUserProviderDataCallBack: showUserProviderDataCallBack,
        status: status,
        total: total,
        userComent: userComent,
      ),
    );
  }
}