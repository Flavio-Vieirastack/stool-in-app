import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_in/features/info/export/info_export.dart';

import '../../../../../core/constants/export/constants_export.dart';
import '../../../../../core/widgets/export/widgets_export.dart';


class RulesPage extends StatelessWidget with AppSnackBar {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RulesCubit, RulesState>(
      listener: (context, state) {
        if (state is RulesError) {
          showAppSnackbar(
            message: 'Ops! Ocorreu um erro ao carregar os dados',
            type: SnackBarType.error,
            context: context,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Regras'),
        ),
        body: BlocBuilder<RulesCubit, RulesState>(
          bloc: context.read<RulesCubit>()..getRules(),
          builder: (context, state) {
            if (state is RulesSucess) {
              return Padding(
                padding: EdgeInsets.all(8.0.dp),
                child: ListView(
                  children: state.rules
                      .map(
                        (e) => InfoExpansionCard(
                          content: e.body,
                          title: e.title,
                        ),
                      )
                      .toList(),
                ),
              );
            } else if (state is RulesError) {
              return Center(
                child: LottieBuilder.asset(LottieConstants.lottieErrorPage),
              );
            } else if (state is RulesLoading) {
              return const Center(
                child: AppProgressIndicator(),
              );
            } else {
              return const Center(
                child: AppProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
