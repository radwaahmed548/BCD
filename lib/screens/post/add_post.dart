import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/models/postdetails.dart';

class  addpost extends StatefulWidget {
  const addpost({Key key}) : super(key: key);

  @override
  _addpostState createState() => _addpostState();
}

class _addpostState extends State<addpost> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form =GlobalKey<FormState>();
  var _editedpost = Post(id: null, title: '', description: '', imageUrl: '',);

  @override
  void initState(){
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();

  }
  @override
   void dispose(){
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }
  void _updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      setState(() {});
    }
  }
  void _saveform(){
    _form.currentState.save();
    print(_editedpost.title);

    print(_editedpost.imageUrl);
    print(_editedpost.description);

  }
  Widget build(BuildContext context) {
     GlobalKey <FormState> formkey;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: KMainColor,
     title:const Text('add post'),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.save),onPressed:
            _saveform,


        )
      ],
    ),
body: Padding(padding: EdgeInsets.all(8),
child:Form(
  key:  _form,

  child: ListView(
    children: <Widget>[
      SizedBox(height: 40,),
      TextFormField(
        decoration: InputDecoration(labelText:'title' ),
      textInputAction: TextInputAction.next,
        onSaved: (value){
          _editedpost = Post(
              title: value,description: _editedpost.description,imageUrl: _editedpost.imageUrl,id: null);
        },
      ),
      SizedBox(height: 40,),
      TextFormField(
        decoration: InputDecoration(labelText:'description' ),
        textInputAction: TextInputAction.next,
        onSaved: (value){
          _editedpost = Post(
              title: _editedpost.title,description: value,imageUrl: _editedpost.imageUrl,id: null);
        },
      ),
      SizedBox(height: 40,),
      Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top:8,right:10),
            decoration: BoxDecoration(border: Border.all(width:1,color: KMainColor)),
        child:_imageUrlController.text.isEmpty ? 
            Text('enter the url') :
            FittedBox(child: Image.network(_imageUrlController.text,
            fit:BoxFit.cover
              ,) ,),

          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(labelText:'Image Url' ),
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.done,
              controller: _imageUrlController,
              focusNode: _imageUrlFocusNode ,
  onFieldSubmitted: (_) =>{_saveform() },
              onSaved: (value){
                _editedpost = Post(
                    title: _editedpost.title,description: _editedpost.description,imageUrl: value,id: null);
              },
            ),
          ),
        ],
      )
    ],
  ),
))


);
  }
}
