// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class VoteRattingCalculate {
  int calculateVotes({required Iterable<int> votes}) {
    if (votes.isNotEmpty) {
      final allvotes = votes.sum;
      final result = allvotes / votes.length;
      return result.ceil();
    } else {
      return 0;
    }
  }
}
