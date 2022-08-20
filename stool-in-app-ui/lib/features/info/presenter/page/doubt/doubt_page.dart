import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/widgets/app_progress_indicator/app_progress_indicator.dart';
import 'package:stool_in/features/info/presenter/page/cubits/doubt/doubts_cubit.dart';

import '../../../../../core/widgets/info_expansion_card/info_expansion_card.dart';

class DoubtPage extends StatelessWidget {
  const DoubtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return const Center(
                child: Text('Ocorreu um erro tente mais tarde'),
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
    );
  }
}
