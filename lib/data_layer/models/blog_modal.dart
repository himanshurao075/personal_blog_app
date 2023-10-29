
class BlogModal {
  BlogModal({required this.title,required this.body,this.bgColor,this.textColor});

  String title;
  String body;
  int? bgColor ;
  int? textColor;

  factory BlogModal.fromJson(Map<String, dynamic> json) => BlogModal(
        title: json["title"]??'',
        body: json["body"]??'',
        bgColor: json ["bgColor"]  ,
        textColor: json["textColor"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "bgColor": bgColor,
        "textColor" : textColor
    }; 
}