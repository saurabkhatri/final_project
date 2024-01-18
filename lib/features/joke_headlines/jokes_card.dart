import 'package:flutter/material.dart';

class JokesCard extends StatelessWidget {
  JokesCard ({required this.result,super.key});
  Articles result;


  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text (result?.title ??'',
            style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 16.0,),
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                result?.urlToImage ?? '',
                errorBuilder: (BuildContext context,Object error,StackTrace? stackTrace){
                  return SizedBox.shrink();
                },)),
          const SizedBox(height: 16.0,),

          Text (result?.description ??'',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text (result?.author.toString() ??'',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold
                ),

              ),
              Text ("Date: ${getPublishedDate(result?.publishedAt??'')}",
                style: TextStyle(
                    color: Colors.cyan,
                    fontWeight:FontWeight.bold),
              ),
            ],
          ),

        ],
      ),

    ),);
  }
}
getPublishedDate(String date) {
  if(date.isEmpty)
    return '';
  return date.substring(0,10);
}
