part of '../app_dialog.dart';

class _DialogVote extends StatefulWidget {
  const _DialogVote({Key? key}) : super(key: key);

  @override
  State<_DialogVote> createState() => _DialogVoteState();
}

class _DialogVoteState extends State<_DialogVote> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RatingStars(
            value: value,
            onValueChanged: (v) {
              setState(() {
                value = v;
              });
            },
            starCount: 5,
            starSize: 20,
            valueLabelColor: const Color(0xff9b9b9b),
            valueLabelTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 12.0,
            ),
            valueLabelRadius: 10,
            maxValue: 5,
            starSpacing: 2,
            maxValueVisibility: true,
            valueLabelVisibility: true,
            animationDuration: const Duration(milliseconds: 1000),
            valueLabelPadding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 8),
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
