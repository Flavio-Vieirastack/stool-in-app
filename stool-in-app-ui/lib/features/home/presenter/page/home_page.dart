import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in/features/home/presenter/page/widgets/home_bottom_body.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

part './widgets/home_body.dart';
part './widgets/coin_widget.dart';

@immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SharedPreferencesHelper, AppSnackBar {
  String? userImage;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<HomeCubit>().getAllHomeData(pageQuantity: 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    final uniqueIndex = 0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.info,
        ),
        onPressed: () =>
            Navigator.of(context).pushNamed(RoutesConstants.infoRoute),
      ),
      body: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeStateNoData) {
            showAppSnackbar(
              message: 'Ops! Você não preencheu seus dados',
              context: context,
            );
          } else if (state is HomeStateGoToDataPage) {
            Navigator.of(context).pushReplacementNamed(
              RoutesConstants.signInDataRoute,
            );
          } else if (state is HomeError) {
            showAppSnackbar(
              message: state.message,
              context: context,
              type: SnackBarType.error,
            );
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSucess) {
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.dp, 30.dp, 8.dp, 0),
                    child: Row(
                      children: [
                        AppAvatar(
                          urlImage: state.userImage,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        SizedBox(
                          width: 45.w,
                          child: Text(
                            state.userName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.headLine0,
                          ),
                        ),
                        const Spacer(),
                        Visibility(
                          visible: state.userUniqueEntity!
                                  .serViceProviders[uniqueIndex].coins! >
                              0,
                          child: Row(
                            children: [
                              LottieBuilder.asset(
                                LottieConstants.lottieCoin,
                                width: 35.dp,
                              ),
                              _coin(
                                onTap: () {},
                                coins: state.userUniqueEntity!
                                    .serViceProviders[uniqueIndex].coins
                                    .toString(),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: state.userUniqueEntity!
                                  .serViceProviders[uniqueIndex].status ==
                              ServiceStatus.active.status,
                          child: Column(
                            children: [
                              LottieBuilder.asset(
                                LottieConstants.lottiePremium,
                                width: 10.w,
                              ),
                              Text(
                                'Premium',
                                style: AppTextStyles.headLine4Blue,
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: state.userUniqueEntity!
                                      .serViceProviders[uniqueIndex].status ==
                                  ServiceStatus.active.status &&
                              state.userUniqueEntity!
                                      .serViceProviders[uniqueIndex].coins! >
                                  0,
                          child: Row(
                            children: [
                              LottieBuilder.asset(
                                LottieConstants.lottiePremium,
                                width: 8.w,
                              ),
                              LottieBuilder.asset(
                                LottieConstants.lottieCoin,
                                width: 28.dp,
                              ),
                              _coin(
                                onTap: () {},
                                coins: state.userUniqueEntity!
                                    .serViceProviders[uniqueIndex].coins
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SearchWidget(
                    onTap: () {},
                  ),
                  _HomeBody(
                    status: state.userUniqueEntity!
                            .serViceProviders[uniqueIndex].status ??
                        ServiceStatus.inactive.status,
                  )
                ],
              );
            } else if (state is HomeLoading) {
              return const HomeShimmer();
            } else if (state is HomeStateNoData) {
              return const IgnorePointer(
                  ignoring: true,
                  child: AppErrorPage(
                    errorMessage: 'Preencha seus dados',
                  ));
            } else {
              return const AppErrorPage();
            }
          },
        ),
      ),
    );
  }
}
