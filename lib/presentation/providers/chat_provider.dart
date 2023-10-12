import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> message = [
    Message(text: 'Hola Amor!', fromWho: FromWho.mine),
    Message(text: 'Como estas?', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage( String text ) async {
    if(text.isEmpty) return ;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    message.add(newMessage);

    if(text.endsWith('?')) {
      await hisReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> hisReply() async{
    final hisMessage = getYesNoAnswer.getAnswer();
  }

  Future<void> moveScrollToBottom ()  async{

    await Future.delayed(const Duration( milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration( milliseconds: 300), 
      curve: Curves.easeOut
      );
  }

}