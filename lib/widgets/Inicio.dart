import 'package:flutter/material.dart';
import 'package:flutter_you_tube_api/model/Video.dart';
import 'package:flutter_you_tube_api/services/Api.dart';

// ignore: must_be_immutable
class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);

  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
  _listarVideos(String pesquisa) {
    Api api = Api();
    dynamic video = api.pesquisar(pesquisa);
    return video;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      // ignore: missing_return
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (contex, index) {
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];

                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.imagem),
                          )),
                        ),
                        ListTile(
                          title: Text(
                            video.titulo,
                          ),
                          subtitle: Text(video.canal),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 4,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(child: Text('Nenhum video encontrado'));
            }

            break;
        }
      },
    );
  }
}
