import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_app_logic/core/helpers/vote_ratting/vote_ratting_calculate.dart';

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
  test(
    'deve retornar o calculo correto de números quebrados ale atórios',
    () {
      final caculate = VoteRattingCalculate();

      final result = caculate.calculateVotes(votes: [1, 5, 4, 3, 2]);

      expect(result, 3);
    },
  );
  test(
    'deve retornar 0 quando a lista for vazia',
    () {
      final caculate = VoteRattingCalculate();

      final result = caculate.calculateVotes(votes: []);

      expect(result, 0);
    },
  );
  test(
    'deve retornar votos quando a lista tiver apenas um número',
    () {
      final caculate = VoteRattingCalculate();

      final result = caculate.calculateVotes(votes: [0]);

      expect(result, 0);
    },
  );
  test(
    'deve retornar votos quando a lista tiver apenas um número segundo numero',
    () {
      final caculate = VoteRattingCalculate();

      final result = caculate.calculateVotes(votes: [5]);

      expect(result, 5);
    },
  );
  test(
    'deve retornar 0 com lista de 0',
    () {
      final caculate = VoteRattingCalculate();

      final result = caculate.calculateVotes(votes: [0,0,0,0,0]);

      expect(result, 0);
    },
  );
}
