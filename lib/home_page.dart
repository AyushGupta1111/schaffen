import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> listItems = List<String>.generate(20, (i) => "Item ");
  final ScrollController _scrollController = ScrollController();
  bool scroll=false;
  bool showSearchBar=false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.hasClients){
        if(_scrollController.offset >=180 && !scroll){
          scroll=true;
          setState(() {});
        }

        else if (_scrollController.offset <200 && scroll){
          scroll=false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.red,
                pinned: true,

                expandedHeight: 250,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: (scroll)?Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('asset/images/img.png'),
                      ),
                      const SizedBox(width: 8,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("The Weeknd",style: TextStyle(fontSize: 20),),
                          Text("Community . +11k Members",style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
                    ],
                  )
                  :const SizedBox(height: 0,),
                  background: Image.asset("asset/images/img_3.png"),
                ),
              ),



              
               SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showSearchBar) // Conditionally render the search bar
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...Read more"),
                    const SizedBox(height: 10,),
                    Wrap(
                      spacing: 10,

                      children: [
                        Chip(label: Text('Outdoor'),
                        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 5),),
                        Chip(label: Text('Outdoor'),
                          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 5),),
                        Chip(label: Text('Outdoor'),
                          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 5),),
                        Chip(label: Text('+1'),
                          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 5),),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Media, docs and links',style: TextStyle(fontSize: 20),),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'asset/images/img.png',
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                  ),
              ),


              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SwitchListTile(
                      title: const Text('Mute notification'),
                      value: false,
                      onChanged: (bool value) {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('Clear chat'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.lock),
                      title: const Text('Encryption'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text('Exit community'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('Report'),
                      onTap: () {},
                    ),

                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Memebers"),
                    Spacer(),
                    IconButton(onPressed: (){
                      showSearchBar = !showSearchBar;
                      _scrollController.offset==210;
                      setState(() {});
                    }, icon: const Icon(Icons.search))
                  ],
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('asset/images/face.png'),
                      ),
                      title: const Text('Yashika',style: TextStyle(color: Colors.black)),
                      subtitle: const Text('29, India',style: TextStyle(color: Colors.black38),),
                      trailing: ElevatedButton(
                        onPressed: (){},
                        child: const Text("Add"),
                      ),
                    );
                  },
                  childCount: 30,
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}