import 'package:allabtbooks/screens/chat/chat.dart';
import 'package:allabtbooks/screens/profile/profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Book extends StatefulWidget {
  final data;
  const Book({Key? key, this.data}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  List review_list=[];
  int star_index = 0;
  bool contains=false;

  TextEditingController description = TextEditingController();
  @override
  void initState() {
    super.initState();
    _init_review();
    _contains();
  }
  _init_review() async {
    await FirebaseDatabase.instance.ref('bookreviews/'+widget.data['name']).get().then((event) {
      var review_data = Map<String, dynamic>.from(event.value as dynamic);
      review_data.forEach((key, value) {
        review_list.add([key,value]);
      });
    });
    setState((){
      review_list=review_list;
    });
  }
  _contains() async {
    final pref = await SharedPreferences.getInstance();
    FirebaseDatabase.instance.ref('users/'+pref.getString('username')!+'/collection').get().then((event){
      var collection_data = Map<String, dynamic>.from(event.value as dynamic);
    collection_data.forEach((key, value) {
      if(collection_data[key]['name']==widget.data['name']){
        setState((){
          contains=true;
        });
      }
    });
    });
  }
  @override
  Widget build(BuildContext context) {
    /*
    Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 4)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 18.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Nigel",
                      style: GoogleFonts.rosarivo(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ),
                    const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ),
                    const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ),
                    const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ),
                    const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Its a great book",
                    style: GoogleFonts.rosarivo(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
     */
    List<Widget> review_list_render = [
      Container(
        height: 176,
        width: 123,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (NetworkImage(widget.data['url_image'])),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 30,
                blurRadius: 50,
                offset: const Offset(0, 4)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 36, 5, 8),
        child: Text(
          widget.data['name'],
          textAlign: TextAlign.center,
          style: GoogleFonts.mali(
              fontSize: 32, fontWeight: FontWeight.w300),
        ),
      ),
      Text(
        widget.data['author'],
        style: GoogleFonts.rosarivo(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black54),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => Profile(
                    username: widget.data['isbn_username']
                        .split('&')[1],
                  )));
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
                  (states) => EdgeInsets.zero),
          overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent),
        ),
        child: Text(
          widget.data['isbn_username'].split('&')[1],
          style: GoogleFonts.rosarivo(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black38),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(padding:
        const EdgeInsets.fromLTRB(30, 16.0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews",
                style: GoogleFonts.mali(
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                ),
              ),
              contains? IconButton(onPressed: (){
                dialogue();
              }, icon: Icon(Icons.add,size: 27,)):Container()
            ],
          ),
        ),
      ),
    ];
    review_list.forEach((element) {
      review_list_render.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 4)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 18.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      element[0],
                      style: GoogleFonts.rosarivo(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    element[1]['stars']>0? const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ):Container(),
                    element[1]['stars']>1? const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ):Container(),
                    element[1]['stars']>2? const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ):Container(),
                    element[1]['stars']>3? const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ):Container(),
                    element[1]['stars']>4? const Icon(
                      Icons.star_sharp,
                      color: Color(0xffFFB800),
                    ):Container(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    element[1]['desc'],
                    style: GoogleFonts.rosarivo(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });

    return Scaffold(resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.data['url_image']),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9),
                  BlendMode.luminosity,
                )),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 110,
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 27,
                            color: Color(0xff000000),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final pref = await SharedPreferences.getInstance();
                                FirebaseDatabase.instance.ref('users'+'/'+pref.getString('username')!+'/'+'interested').child(widget.data['isbn_username'].split('&')[0]).set(
                                    {
                                      "author":widget.data['author'],
                                      "genre":widget.data['genre'],
                                      "isbn":widget.data['isbn_username'].split('&')[0],
                                      "name":widget.data['name'],
                                      "url_image":widget.data['url_image'],
                                    });
                              },
                              icon: const Icon(
                                Icons.bookmark,
                                size: 27,
                                color: Color(0xff000000),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                final pref = await SharedPreferences.getInstance();
                                List content =[];
                                await FirebaseDatabase.instance.ref('users/'+pref.getString('username')!+'/friend').get().then((event)
                                {
                                var data = Map<String, dynamic>.from(event.value as dynamic);
                                data.forEach((key, value) {
                                  content.add(
                                      key);
                                });

                                });
                                showModalBottomSheet(context: context, builder: (builder)=>Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [Text("Recommend to a friend",style: GoogleFonts.mali(fontSize: 20,fontWeight: FontWeight.bold),),
                                        Expanded(
                                          child: ListView.builder(shrinkWrap: true,itemCount: content.length,itemBuilder: (context,int i){
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(content[i],style: GoogleFonts.rosarivo(fontSize: 16),),
                                                  TextButton(onPressed: (){
                                                    FirebaseDatabase.instance.ref('users/'+content[i]+'/recommended').child(widget.data['isbn_username'].split('&')[0]).set(
                                                        {
                                                          "author":widget.data['author'],
                                                          "genre":widget.data['genre'],
                                                          "isbn":widget.data['isbn_username'].split('&')[0],
                                                          "name":widget.data['name'],
                                                          "url_image":widget.data['url_image'],
                                                          "recommendation":pref.getString('username'),
                                                        });
                                                  }, child: Text("SEND"))
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),);
                              },
                              icon: const Icon(
                                Icons.local_library,
                                size: 27,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: review_list_render,
                  ),
                ]),
              ),
              TextButton(
                onPressed: exchange,
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Center(
                        child: Text(
                          "Exchange",
                          style: GoogleFonts.rosarivo(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  exchange() async {
    final pref = await SharedPreferences.getInstance();
    FirebaseDatabase.instance
        .ref('users/' +
            pref.getString('username')! +
            '/chat/' +
            widget.data['isbn_username'].split('&')[1] +
            '/case2/')
        .set({'empty': true});
    await FirebaseDatabase.instance
        .ref('users/' +
            widget.data['isbn_username'].split('&')[1] +
            '/chat/' +
            pref.getString('username')! +
            '/case2/')
        .set({'empty': true});
    Navigator.push(context, MaterialPageRoute(builder: (builder) => Chat()));
  }
  dialogue(){
    showDialog(context: context, builder: (builder)=>AlertDialog(content: SizedBox(height: 90,
      child: Column(
        children: [
          Row(children: [
            IconButton(
              onPressed: () {
                setState((){
                  star_index=1;
                });
                Navigator.pop(context);
                dialogue();
              },padding: EdgeInsets.zero,constraints: BoxConstraints(),splashRadius: 20,
              icon: Icon(
                Icons.star_sharp,
                color: star_index>0?Color(0xffFFB800):Color(0xffB0BEC5),
              ),
            ),
            IconButton(
              onPressed: () {setState((){
                star_index=2;
              });
              Navigator.pop(context);
              dialogue();
              },padding: EdgeInsets.zero,constraints: BoxConstraints(),splashRadius: 20,
              icon: Icon(
                Icons.star_sharp,
                color: star_index>1?Color(0xffFFB800):Color(0xffB0BEC5),
              ),
            ),
            IconButton(
              onPressed: () {setState((){
                star_index=3;
              });
              Navigator.pop(context);
              dialogue();
              },padding: EdgeInsets.zero,constraints: BoxConstraints(),splashRadius: 20,
              icon: Icon(
                Icons.star_sharp,
                color: star_index>2?Color(0xffFFB800):Color(0xffB0BEC5),
              ),
            ),
            IconButton(
              onPressed: () {setState((){
                star_index=4;
              });
              Navigator.pop(context);
              dialogue();
              },padding: EdgeInsets.zero,constraints: BoxConstraints(),splashRadius: 20,
              icon: Icon(
                Icons.star_sharp,
                color: star_index>3?Color(0xffFFB800):Color(0xffB0BEC5),
              ),
            ),
            IconButton(
              onPressed: () {setState((){
                star_index=5;
              });
              Navigator.pop(context);
              dialogue();
              },padding: EdgeInsets.zero,constraints: BoxConstraints(),splashRadius: 20,
              icon: Icon(
                Icons.star_sharp,
                color: star_index>4?Color(0xffFFB800):Color(0xffB0BEC5),
              ),
            ),
          ],),TextField(controller: description,
            decoration: InputDecoration(
              labelText: "Description",),
          )
        ],
      ),
    ),title: Text("Add a Review"),actions: [
      TextButton(onPressed: () async{
        final pref = await SharedPreferences.getInstance();
        FirebaseDatabase.instance.ref('bookreviews/'+widget.data['name']+'/'+pref.getString('username')!).set(
            {
              'desc':description.text,
              'stars':star_index,
            });
      }, child: const Text('Add'))
    ],));
  }
}
