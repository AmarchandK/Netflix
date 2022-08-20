class HomeData{
    String? backtropPath;
  String? posterPath;
  String? title;
 HomeData({ this.backtropPath,this.posterPath,this.title});
 HomeData.fromJson(Map<String, dynamic> json) {
     backtropPath=json["backdrop_path"];

    posterPath=json["poster_path"];

    title=json['original_title'];
 }
 Map<String,dynamic>toJson(){
    final Map<String,dynamic> data= <String,dynamic>{};
    data["backdrop_path"]=backtropPath;
    data["poster_path"]=posterPath;
    data["original_title"]=title;
    return data;
  } 
}