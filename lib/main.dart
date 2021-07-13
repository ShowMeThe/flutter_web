import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web/base/Px.dart';
import 'package:flutter_web/entity/bing_entity.dart';
import 'package:flutter_web/generated/json/base/json_convert_content.dart';
import 'package:flutter_web/widget/fade_image.dart';
import 'dart:js' as js;
import 'base/http_client.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AutoDisposeStateProvider<List<BingEntity>> _bingProvider =
      StateProvider.autoDispose((ref) => []);

  final _list = <BingEntity>[];
  final _controller = ScrollController();
  final _page = 0;

  void getPage({int page = 0}) async {
    var response = await HttpClient.get().get('/image/new/${page}');
    context.read(_bingProvider).state = JsonConvert.fromJsonAsT(response.data);
  }

  @override
  void initState() {
    super.initState();
    getPage();
  }

  @override
  Widget build(BuildContext context) {
    var _width = Px.matchWidth(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          width: _width,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Image.asset(
                      "images/bing_logo.png",
                      color: Colors.cyan,
                      width: 45,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      "必应壁纸",
                      style: TextStyle(color: Colors.cyan, fontSize: 25),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(child: Consumer(builder: (context, watch, _) {
          if (_page == 0) {
            _list.clear();
          }
          _list.addAll(watch(_bingProvider).state);
          int count = 3;
          if (_width <= 960 && _width > 640) {
            count = 2;
          } else if (_width <= 640) {
            count = 1;
          }
          return GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: _list.length,
              controller: _controller,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    js.context.callMethod(
                        "open", [_list[index].photoUrl]);
                  },
                  child: FadeImage.network(_list[index].photoUrl)),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count, childAspectRatio: 2));
        }))
      ],
    );
  }
}