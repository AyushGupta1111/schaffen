import 'package:flutter/material.dart';
import 'package:schaffen_assignment/bottom_sheet.dart';
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
  late double screenHeight;


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
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetWidget();
      },
    );
  }

  void _toggleSearchBar() {
    setState(() {
      showSearchBar = !showSearchBar;
      if (showSearchBar) {
        _scrollController.animateTo(
          screenHeight,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

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
                      IconButton(onPressed: (){
                        _showBottomSheet(context);
                      }, icon: const Icon(Icons.more_vert))
                    ],
                  )
                  :const SizedBox(height: 0,),
                  background: Image.asset("asset/images/img_3.png"),
                ),
              ),



              
               const SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if (showSearchBar) // Conditionally render the search bar
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       decoration: InputDecoration(
                    //         hintText: 'Search...',
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(8.0),
                    //         ),
                    //         prefixIcon: Icon(Icons.search),
                    //       ),
                    //     ),
                    //   ),

                     SizedBox(height: 15,),
                     Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...Read more"),

                     SizedBox(height: 10,),
                     Wrap(
                      spacing: 10,

                      children: [
                        Chip(label: Text('Outdoor'),
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                          labelStyle: TextStyle(color: Colors.red),
                          side: BorderSide(color: Colors.red),),
                        Chip(label: Text('Outdoor'),
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                          labelStyle: TextStyle(color: Colors.red),
                          side: BorderSide(color: Colors.red),),
                        Chip(label: Text('Outdoor'),
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                          labelStyle: TextStyle(color: Colors.red),
                          side: BorderSide(color: Colors.red),),
                        Chip(label: Text('+1'),
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                          labelStyle: TextStyle(color: Colors.red),
                          side: BorderSide(color: Colors.red),),
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
                      leading: const Icon(Icons.exit_to_app,color: Colors.red,),
                      title: const Text('Exit community',style: TextStyle(color: Colors.red),),
                      onTap: () {},
                    ),
                    ListTile(

                      leading: Image.asset("asset/images/icon.png",height: 30,),
                      title: const Text('Report',style: TextStyle(color: Colors.red),),
                      onTap: () {},
                    ),

                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Memebers"),
                    const Spacer(),
                    IconButton(onPressed: _toggleSearchBar,
                        icon: const Icon(Icons.search))
                  ],
                ),
              ),

              // SliverToBoxAdapter(
              //   child: AnimatedOpacity(
              //     opacity: showSearchBar ? 1.0 : 0.0,
              //     duration: const Duration(milliseconds: 300),
              //     child: IgnorePointer(
              //       ignoring: !showSearchBar,
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: TextField(
              //           decoration: InputDecoration(
              //             hintText: 'Search Member',
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(8.0),
              //             ),
              //             prefixIcon: Icon(Icons.search),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: showSearchBar
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Member',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                )
                    : const SizedBox.shrink(),
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