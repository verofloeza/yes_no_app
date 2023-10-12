import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:  EdgeInsets.all(3.0),
          child:  CircleAvatar(
            backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/014/194/215/original/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg'),
          ),
        ),
        title: const Text('Mi amor') ,
        centerTitle: true,
      ),
      body: _ChatView() ,
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded(child:    ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.message.length,
              itemBuilder: (context, index){
                final message = chatProvider.message[index] ;

                return ( message.fromWho == FromWho.his)
                  ? const HisMessageBubble()
                  : MyMessageBubble( message: message);
                
                
              }
            )
           
            ),
            MessageFieldBox( onValue: (value) => chatProvider.sendMessage(value),),
          ],
        ),
      ),
    );
  }
}

