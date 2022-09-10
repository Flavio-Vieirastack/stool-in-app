
import 'package:flutter/material.dart';

class ServiceProviderCardsParams {
  final String userUrlImage;
  final String userName;
  final double userVotes;
  final String userServicesExecuted;
  final String userDistance;
  final VoidCallback agendOnTap;
  final VoidCallback cardOnTap;
  final Widget image;
  ServiceProviderCardsParams({
    required this.userUrlImage,
    required this.cardOnTap,
    required this.userName,
    required this.userVotes,
    required this.userServicesExecuted,
    required this.userDistance,
    required this.agendOnTap,
    required this.image,
  });
}
