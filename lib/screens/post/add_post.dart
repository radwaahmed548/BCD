import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/models/finalpost.dart';
import 'package:gp/models/postdetails.dart';
import 'package:provider/provider.dart';

class  addpost extends StatefulWidget {
  const addpost({Key key}) : super(key: key);

  @override
  _addpostState createState() => _addpostState();
}

class _addpostState extends State<addpost> {
  final _imageUrlController = TextEditingController();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _form =GlobalKey<FormState>();
  var _editedpost = Post(id: null, title: '', description: '', imageUrl: '',);
  var _initValues = {
    'title': '',
    'description': '',
    'imageUrl': '',
  };
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState(){
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();

  }
  void didChangeDependencies() {
    if (_isInit) {
      final postId = ModalRoute.of(context).settings.arguments as String;
      if (postId != null) {
        _editedpost =
            Provider.of<Posts>(context, listen: false).findById(postId);
        _initValues = {
          'title': _editedpost.title,
          'description': _editedpost.description,

          // 'imageUrl': _editedProduct.imageUrl,
          'imageUrl': '',
        };
        _imageUrlController.text = _editedpost.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
   void dispose(){
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }
  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedpost.id != null) {
      await Provider.of<Posts>(context, listen: false)
          .updatePost(_editedpost.id, _editedpost);
    } else {
      try {
        await Provider.of<Posts>(context, listen: false)
            .addpost(_editedpost);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }
  Widget build(BuildContext context) {
     GlobalKey <FormState> formkey;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: KMainColor,
     title:const Text('add post'),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.save),onPressed:() {
          _saveForm();
         Navigator.pushNamed(context, '/Community');


        }
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
        initialValue: _initValues['title'],
        decoration: InputDecoration(labelText:'title' ),
      textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_titleFocusNode);
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please provide a value.';
          }
          return null;
        },
        onSaved: (value){
          _editedpost = Post(
              title: value,
              description: _editedpost.description,
              imageUrl: _editedpost.imageUrl,id: _editedpost.id);
        },
      ),
      SizedBox(height: 40,),
      TextFormField(
        initialValue: _initValues['description'],
        decoration: InputDecoration(labelText:'description' ),
        textInputAction: TextInputAction.next,
        focusNode: _descriptionFocusNode,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a description.';
          }
          if (value.length < 10) {
            return 'Should be at least 10 characters long.';
          }
          return null;
        },
        onSaved: (value){
          _editedpost = Post(
              title: _editedpost.title,description: value,
              imageUrl: _editedpost.imageUrl,
              id: _editedpost.id);
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
  onFieldSubmitted: (_) =>{_saveForm() },
              onSaved: (value){
                _editedpost = Post(
                    title: _editedpost.title,
                    description: _editedpost.description,
                    imageUrl: value,
                    id: _editedpost.id);
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
