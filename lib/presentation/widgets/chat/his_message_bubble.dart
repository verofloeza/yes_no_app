import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  const HisMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 10, vertical: 20 ),
            child: Text('Hola!', style: TextStyle( color: Colors.white),),
          ),
        ),
        const SizedBox( height: 5,),
        _ImageBubble(),
        const SizedBox( height: 5,),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size ;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPGBxaYdGHEpJ9001ON09kQBXAnqZaCYG3--fcJQUAIbkQAjWc-BpxmbgwJrzURi0j8gc&usqp=CAU',
        // width: size.width * 0.7,
        height: 100,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;

          return Container(
            width: size.width *0.7,
            height: 100 ,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Se está enviando un mensaje')
          );
        },
        )
      );
  }
}