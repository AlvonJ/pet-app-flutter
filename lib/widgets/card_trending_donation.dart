import 'package:flutter/material.dart';
import 'package:pet_app/widgets/progress_bar.dart';

class CardTrendingDonation extends StatelessWidget {
  final String name;
  final String pathImage;
  final MediaQueryData mediaQuery;
  final int percentage;
  final String amount;

  const CardTrendingDonation({
    Key? key,
    required this.mediaQuery,
    required this.name,
    required this.pathImage,
    required this.percentage,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]),
      child: Row(children: [
        Container(
          width: 100,
          height: 110,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(pathImage), fit: BoxFit.cover)),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Text(
              '$percentage%',
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            ProgressBar(
                percentage: percentage, width: mediaQuery.size.width - 160),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(6)),
                    child: const Icon(
                      Icons.attach_money,
                      color: Colors.black54,
                      size: 18,
                    )),
                const SizedBox(width: 10),
                Text(
                  'Rp $amount',
                  style: const TextStyle(color: Colors.black54),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}
