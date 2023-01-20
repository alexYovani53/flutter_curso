import 'package:flutter/material.dart';
class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);
  static const routeName = 'listviewbuilder';

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();  
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent){
        fetchData();
      }
    });
  }

  Future fetchData() async{
    if(isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120 , 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  void add5(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => e+lastId)
    );
    setState(() {});
  }

  Future<void> onRefresh() async {    
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewBuilder'),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh ,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (context, index) => FadeInImage(
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                  fadeOutCurve: Curves.bounceIn,
                  fadeOutDuration: const Duration(milliseconds: 500),
                  placeholder: const AssetImage("assets/img/loading.gif"),
                  image: NetworkImage('https://picsum.photos/200/300?image=${imagesIds[index]}'),       
                )
              ),
            ),
            if(isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
            
          ],
        ),
      )
    );
  }
}