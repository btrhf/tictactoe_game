import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe_game/resources/socket_methords.dart';
import 'package:tictactoe_game/responsive/responsive.dart';
import 'package:tictactoe_game/widgets/custom_button.dart';
import 'package:tictactoe_game/widgets/custom_text.dart';
import 'package:tictactoe_game/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final SocketMethords _socketMethords = SocketMethords();

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                  shadows: [
                    Shadow(
                      blurRadius: 40,
                      color: Colors.blue,
                    ),
                  ],
                  text: 'Create Room',
                  fontSize: 70,
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter your nickname',
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                CustomButton(
                    onTap: () => _socketMethords.createRoom(
                          _nameController.text,
                        ),
                    text: 'Create'),
              ]),
        ),
      ),
    );
  }
}
