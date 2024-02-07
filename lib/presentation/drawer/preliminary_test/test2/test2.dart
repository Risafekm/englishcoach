// ignore_for_file: unused_local_variable

import 'package:englishcoach/application/provider/userprovider.dart';
import 'package:englishcoach/presentation/drawer/preliminary_test/edit/editpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Consumer<UserProvider>(builder: (context, value, child) {
        if (value.isLoding) {
          return const CircularProgressIndicator();
        }
        final posts = value.posts;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var user = posts[index];
            return Card(
                child: ListTile(
              onTap: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const EditPage()));
              },
              leading: Text(posts[index].prelimTransQuesNum.toString()),
              tileColor: Colors.blue.withOpacity(0.2),
              title: Text(
                'Question ${posts[index].prelimTransQuesNum}: ${posts[index].prelimTransQuestion}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                children: [
                  Text('Answer : ${posts[index].prelimTransAnswer}'),
                ],
              ),
              trailing: GestureDetector(
                  onTap: () async {
                    print('clicked');
                  },
                  child: const Icon(Icons.delete, color: Colors.red)),
            ));
          },
        );
      }),
    );
  }
}
