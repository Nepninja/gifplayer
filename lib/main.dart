import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gifplayer/gif_player_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GifPlayerBloc>(
      create: (context) => GifPlayerBloc(),
      child: GifPage(),
    );
  }
}

class GifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gif Player"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GifPreview(),
          GifListener(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    textColor: Colors.white,
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      BlocProvider.of<GifPlayerBloc>(context)..add(EatEvent());
                    },
                    child: Text("Eat")),
                FlatButton(
                    textColor: Colors.white,
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      BlocProvider.of<GifPlayerBloc>(context)
                        ..add(DanceEvent());
                    },
                    child: Text("Dance")),
                FlatButton(
                    textColor: Colors.white,
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      BlocProvider.of<GifPlayerBloc>(context)..add(CryEvent());
                    },
                    child: Text("Cry")),
                FlatButton(
                    textColor: Colors.white,
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      BlocProvider.of<GifPlayerBloc>(context)
                        ..add(SleepEvent());
                    },
                    child: Text("Sleep")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GifPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GifPlayerBloc, GifPlayerState>(
      builder: (context, state) {
        return Image.asset("assets/" + state.gifName);
      },
    );
  }
}

class GifListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<GifPlayerBloc, GifPlayerState>(
      listener: (context, state) {
        final snackBar = SnackBar(content: Text("I am ${state.task}"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Text("I am::"),
    );
  }
}
