class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  factory Video.formJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        titulo: json['snippet']['title'],
        imagem: json['snippet']['thumbnails']['high']['url'],
        canal: json['snippet']['channelTitle'],
        descricao: json['snippet']['description']);
  }
}
