class Pelicula {
    String? nombrePelicula;
    int? idPelicula;
    String? generoPelicula;

    Pelicula({this.nombrePelicula, this.idPelicula, this.generoPelicula});

    Pelicula.fromJson(Map<String, dynamic> json) {
        nombrePelicula = json["nombre_pelicula"];
        idPelicula = json["id_pelicula"];
        generoPelicula = json["genero_pelicula"];
    }



    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["nombre_pelicula"] = nombrePelicula;
        _data["id_pelicula"] = idPelicula;
        _data["genero_pelicula"] = generoPelicula;
        return _data;
    }
}


