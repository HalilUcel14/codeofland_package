# Welcom To My Package

## My Contact Info

### Youtube Channel : <https://youtube.com/@HalilUcel>

### Mail Address : <hucelsoft@gmail.com>

### My Gihthub : <https://github.com/HalilUcel14>

### Linkedin : <https://www.linkedin.com/in/halilucel/>

### <------------------------------------------------------------------>

### Installing

Tr: Paketimizi projenize eklemek için aşağıdaki adımları takip edebilirsiniz.
En: bla bla bla

### Code sample: Base Model

What does it do : Base Model Service Example
Ne işe yarar: Base Model Servis Örneği

```dart

    // En: This code is available in the package. You just need to call.
    // TR: Bu kod paketin içerisinde mevcuttur. Sadece çağırmanız yeterlidir.
    abstract class BaseModel<T> {
        Map<String, dynamic> toJson();
        T fromJson(Map<String, dynamic> json) ;
    }

    //------------------[USAGE]----------------------
    //------------------[KULLANIM]-------------------
    class ExampleModel extends BaseModel<ExampleExtends>{
        // bla bla code
        // bla bla code
    }
    // -------------------[Sample]---------------------
    class NoteModel extends BaseModel<NoteModel>{
        String? note;
        String? title;

        NoteModel({this.note,this.title});

        @override
        NoteModel fromJson(Map<String,dynamic> json){
            return NoteModel(
                title: json['title'],
                note: json['note'],
            );
        }

        @override
        Map<String, dynamic> toJson(){
            return {
                'note': note,
                'title': title,
            };
        }

    }

```
