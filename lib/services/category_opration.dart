import 'package:flutter_application_1/models/category.dart';

class categoryOperration {
  categoryOperration._();
  static List <category>   getCategories()
   {
     return <category>[
    
            category("Comedy", "https://wikibio.in/wp-content/uploads/2020/08/Anubhav-Singh-Bassi.jpg"),
             
             category("Nency songs", "https://i.pinimg.com/550x/ff/f8/55/fff855bf6b96615084cdd17851b0cfa4.jpg"),
            category("Kem chho !", "https://a10.gaanacdn.com/gn_img/song/BZgWoQOK2d/gWoea8q4K2/size_l_1569642086.jpg"),
            category("pop songs", "https://c-fa.cdn.smule.com/rs-s42/arr/45/61/6574b980-f479-434e-ba84-c3f78c5f5219.jpg"),
            category("Bpplerry songs", "https://dt-media.dhakatribune.com/?width=256&height=256&cropratio=4:5&quality=80&image=en/uploads/2022/02/16/74963-phffyjmgsk-1511770549.jpeg&anchor=top"),
     ];
   }
}