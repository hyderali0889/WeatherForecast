import 'package:flutter/material.dart';


class DetContent extends StatefulWidget {
  const DetContent({
    Key? key,
  }) : super(key: key);

  @override
  State<DetContent> createState() => _DetContentState();
}

class _DetContentState extends State<DetContent>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: null
        //Text("${DataModel.data?["location"]["name"]}" , style:const TextStyle(fontSize:120 , color: Colors.white),),
        );
  }

  @override
  bool get wantKeepAlive => true;
}
