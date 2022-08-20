import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_in/core/constants/lottie_constants.dart';
import 'package:stool_in/core/widgets/app_progress_indicator/app_progress_indicator.dart';
import 'package:stool_in/core/widgets/app_snackbar/app_snackbar.dart';
import 'package:stool_in/features/info/presenter/page/cubits/doubt/doubts_cubit.dart';

import '../../../../../core/widgets/info_expansion_card/info_expansion_card.dart';

class DoubtPage extends StatelessWidget with AppSnackBar {
  const DoubtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoubtsCubit, DoubtsState>(
      listener: (context, state) {
        if (state is DoubtsErro) {
          showAppSnackbar(
            message: 'Ops! Ocorreu um erro',
            context: context,
            type: SnackBarType.error,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dúvidas'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0.dp),
          child: BlocBuilder<DoubtsCubit, DoubtsState>(
            bloc: context.read<DoubtsCubit>()..getDoubts(),
            builder: (context, state) {
              if (state is DoubtsLoading) {
                return const Center(
                  child: AppProgressIndicator(),
                );
              } else if (state is DoubtsErro) {
                return Center(
                  child: LottieBuilder.asset(LottieConstants.lottieErrorPage),
                );
              } else if (state is DoubtsSucess) {
                return Padding(
                  padding: EdgeInsets.all(2.0.dp),
                  child: ListView(
                    children: state.doubts
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                            child: InfoExpansionCard(
                              content: e.body,
                              title: e.title,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              } else {
                return const Center(
                  child: AppProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
