import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScreen extends StatefulWidget {
  const InfiniteScreen({super.key});

  @override
  State<InfiniteScreen> createState() => _InfiniteScreenState();
}

class _InfiniteScreenState extends State<InfiniteScreen> {
  List<int> countList = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addMoreImages() {
    final lastItem = countList.last;
    countList.addAll([1, 2, 3, 4, 5].map((e) => lastItem + e));
  }

  @override
  void initState() {
    super.initState();

    // Simular la carga de más imágenes cuando se llegue al final del scroll
    scrollController.addListener(() {
      if (scrollController.position.pixels +
              500 >= // un poco antes de llegar al final
          scrollController.position.maxScrollExtent) {
        print('Cargar más imágenes');
        // cargar más imágenes
        //addMoreImages();
        loadNextPage();
      }
    });
  }

  @override
  dispose() {
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    addMoreImages();
    isLoading = false;
    if (isMounted) return;
    setState(() {});
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));

    if (!isMounted) return;
    isLoading = false;

    final lastId = countList.last;
    print(lastId);
    countList.clear();
    countList.add(lastId + 1);
    addMoreImages();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Infinite Screen')),
      body: MediaQuery.removePadding(
        // elimina los espacios automaticos del SO. (arriba y abajo)
        context: context,
        removeTop: true,
        removeBottom: true,

        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10, //distancia x desde la parte superior
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: countList.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover, //la imagen llene todo el contenedor
                width: double.infinity, // la imagen llene  el ancho disponible
                height: 300,
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${countList[index]}/200/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
