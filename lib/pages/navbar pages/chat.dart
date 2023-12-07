import 'package:flutter/material.dart';
import 'package:laptop_managment_luminar/pages/navbar%20pages/chatscreen.dart';




class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black54,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                  hintText: "Search by name",
                );
              },
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(1, (int index) {
                  final String item = 'Luminar Technolab';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              },
            ),
          ),
          Expanded(child: ChatList()), // Include the ChatList widget here
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ChatItem('Luminar Technolab', 'Luminar Technolab ', '11:30 AM', true),
        // ChatItem('Luminar Technolab ', 'Luminar Technolab', '10:30 AM',
        // false),
        // Add more chat items here
      ],
    );
  }
}
class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool unread;

  ChatItem(this.name, this.message, this.time, this.unread);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/icons/flutterimage.png'),
      ),
      title: Text(name,style: TextStyle(color: Colors.white),),
      subtitle: Text(message,style: TextStyle(color: Colors.white),),
      trailing: Column(
        children: <Widget>[
          Text(time),
          if (unread) Icon(Icons.brightness_1, color: Colors.green)
        ],
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatScreen()));
        // Open chat screen
      },
    );
  }
}