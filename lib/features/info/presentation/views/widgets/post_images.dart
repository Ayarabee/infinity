import 'package:flutter/material.dart';

class PostImages extends StatelessWidget {
  PostImages({super.key});
  final List<String> imageUrls = [
    'https://img.freepik.com/free-vector/water-drop-concept-illustration_114360-8495.jpg?w=740&t=st=1696556418~exp=1696557018~hmac=a1a35c006aa12c2bae07d64fd55e0ecbc31ba30daa742a10ce011e55c9a595ec',
    'https://img.freepik.com/free-vector/hand-drawn-world-water-day_23-2148849013.jpg?w=740&t=st=1696556448~exp=1696557048~hmac=a7b9ba0775bbb309d77cbe2fd91a5e325139f606302d387cd005a08674dec9f6',
    'https://img.freepik.com/free-vector/watercolor-world-water-day-background_23-2149290083.jpg?w=740&t=st=1696558567~exp=1696559167~hmac=d46669d23b871ba0121afad387d2d2f2895d6328a87d36890e487a81b8ffe083',
    'https://img.freepik.com/free-vector/watercolor-world-water-day-background_23-2149290082.jpg?w=740&t=st=1696558608~exp=1696559208~hmac=df8229583b29fb685ecf2af2017cd1b58ba8f1c0063e0e3604ec318cb751c339',
    'https://img.freepik.com/free-vector/water-purification-set-square-shaped-compositions-with-flat-human-characters-images-water-storage-vector-illustration_1284-71846.jpg?w=740&t=st=1696559035~exp=1696559635~hmac=3892a205a10d5199a657da2d512652b5e04b6d8f3a8dcf980bb10561e48f68a7'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: PageView.builder(
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
