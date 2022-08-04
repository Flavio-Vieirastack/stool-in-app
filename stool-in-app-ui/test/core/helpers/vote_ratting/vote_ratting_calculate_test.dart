import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_app_ui/core/helpers/vote_ratting/vote_ratting_calculate.dart';

void main() {
  test(
    'deve retornar o calculo correto de números',
    () {
      final caculate = VoteRattingCalculate();

      final result = caculate.calculateVotes(votes: [5, 5, 5, 5]);

      expect(result, 5);
    },
  );
  test(
    'deve retornar o calculo correto de números quebrados',
    () {
      final caculate = VoteRattingCalculate();

      final result = caculate.calculateVotes(votes: [5, 4, 5, 5]);

      expect(result, 5);
    },
  );
}
