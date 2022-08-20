import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/widgets/app_progress_indicator/app_progress_indicator.dart';
import 'package:stool_in/core/widgets/info_expansion_card/info_expansion_card.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/features/info/presenter/page/cubits/rules/rules_cubit.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return const Center(
              child: Text('Ocorreu um erro tente mais tarde'),
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
    );
  }
}
