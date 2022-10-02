class Projects
{


  Projects(this.proje_key,this.proje_no, this.proje_adi,this.proje_turu, this.proje_ag, this.proje_aciklama,
      this.proje_fon, this.proje_twitter, this.proje_discord,
      this.proje_telegram, this.proje_linkedin, this.proje_network,
      this.proje_icon_url, this.proje_resim_url,this.proje_website,this.proje_onecikarilan);

  String proje_key;
  int proje_no;
  String proje_adi;
  String proje_turu;
  String proje_ag;
  String proje_aciklama;
  String proje_fon;
  String proje_twitter;
  String proje_discord;
  String proje_telegram;
  String proje_linkedin;
  String proje_network;
  String proje_icon_url;
  String proje_resim_url;
  String proje_website;
  bool proje_onecikarilan;
  factory Projects.fromJson(Map<String,dynamic> json)
  {
    return Projects(json["id"],
        json["proje_no"]as int,
        json["proje_adi"]as String,
        json["proje_turu"] as String,
      json["proje_ag"] as String,
      json["proje_aciklama"] as String,
      json["proje_fon"] as String,
      json["proje_twitter"] as String,
      json["proje_discord"] as String,
      json["proje_telegram"] as String,
      json["proje_linkedin"] as String,
      json["proje_network"] as String,
      json["proje_icon_url"] as String,
      json["proje_resim_url"] as String,
      json["proje_website"] as String,
      json["proje_onecikarilan"] as bool,
    );
  }
}