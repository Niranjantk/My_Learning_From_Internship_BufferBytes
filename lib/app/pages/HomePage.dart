import 'package:flutter/material.dart';
class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      
      ),
      body:ListView.separated(
        itemBuilder: (cnt,index){
          return ListTile(
            title: Text("name"),
            subtitle: Text("data"),
            trailing: Icon(Icons.abc_sharp),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.90sDWdblfZFiciIEpsGFwwHaEY%3Fpid%3DApi&f=1&ipt=5cf8c669fac3f2ae20b29ef5ba17564715704c2ada097df68035a96316619af4&ipo=images'),
            
            ),
          );
        }, 
        separatorBuilder: (cnt,index){
          return Divider() ;
        }, 
        itemCount: 40,
        ),
    );
  }
}