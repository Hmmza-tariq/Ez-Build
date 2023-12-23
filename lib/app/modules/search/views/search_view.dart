import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  // final _startSearchFieldController = TextEditingController();
  // final _endSearchFieldController = TextEditingController();

  // DetailsResult? startPosition;
  // DetailsResult? endPosition;

  // late FocusNode startFocusNode;
  // late FocusNode endFocusNode;

  // late GooglePlace googlePlace;
  // List<AutocompletePrediction> predictions = [];
  // Timer? _debounce;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   String apiKey = 'AIzaSyAeq_m6Xus_Isb8jtVQ7TbZP9Q2hV4shR0';
  //   googlePlace = GooglePlace(apiKey);

  //   startFocusNode = FocusNode();
  //   endFocusNode = FocusNode();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   startFocusNode.dispose();
  //   endFocusNode.dispose();
  // }

  // void autoCompleteSearch(String value) async {
  //   var result = await googlePlace.autocomplete.get(value);
  //   if (result != null && result.predictions != null && mounted) {
  //     print(result.predictions!.first.description);
  //     setState(() {
  //       predictions = result.predictions!;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading: const BackButton(color: Colors.black),
        //   elevation: 0,
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     children: [
        //       TextField(
        //         controller: _startSearchFieldController,
        //         autofocus: false,
        //         focusNode: startFocusNode,
        //         style: TextStyle(fontSize: 24),
        //         decoration: InputDecoration(
        //             hintText: 'Starting Point',
        //             hintStyle: const TextStyle(
        //                 fontWeight: FontWeight.w500, fontSize: 24),
        //             filled: true,
        //             fillColor: Colors.grey[200],
        //             border: InputBorder.none,
        //             suffixIcon: _startSearchFieldController.text.isNotEmpty
        //                 ? IconButton(
        //                     onPressed: () {
        //                       setState(() {
        //                         predictions = [];
        //                         _startSearchFieldController.clear();
        //                       });
        //                     },
        //                     icon: Icon(Icons.clear_outlined),
        //                   )
        //                 : null),
        //         onChanged: (value) {
        //           if (_debounce?.isActive ?? false) _debounce!.cancel();
        //           _debounce = Timer(const Duration(milliseconds: 1000), () {
        //             if (value.isNotEmpty) {
        //               //places api
        //               autoCompleteSearch(value);
        //             } else {
        //               //clear out the results
        //               setState(() {
        //                 predictions = [];
        //                 startPosition = null;
        //               });
        //             }
        //           });
        //         },
        //       ),
        //       SizedBox(height: 10),
        //       TextField(
        //         controller: _endSearchFieldController,
        //         autofocus: false,
        //         focusNode: endFocusNode,
        //         enabled: _startSearchFieldController.text.isNotEmpty &&
        //             startPosition != null,
        //         style: TextStyle(fontSize: 24),
        //         decoration: InputDecoration(
        //             hintText: 'End Point',
        //             hintStyle: const TextStyle(
        //                 fontWeight: FontWeight.w500, fontSize: 24),
        //             filled: true,
        //             fillColor: Colors.grey[200],
        //             border: InputBorder.none,
        //             suffixIcon: _endSearchFieldController.text.isNotEmpty
        //                 ? IconButton(
        //                     onPressed: () {
        //                       setState(() {
        //                         predictions = [];
        //                         _endSearchFieldController.clear();
        //                       });
        //                     },
        //                     icon: Icon(Icons.clear_outlined),
        //                   )
        //                 : null),
        //         onChanged: (value) {
        //           if (_debounce?.isActive ?? false) _debounce!.cancel();
        //           _debounce = Timer(const Duration(milliseconds: 1000), () {
        //             if (value.isNotEmpty) {
        //               //places api
        //               autoCompleteSearch(value);
        //             } else {
        //               //clear out the results
        //               setState(() {
        //                 predictions = [];
        //                 endPosition = null;
        //               });
        //             }
        //           });
        //         },
        //       ),
        //       ListView.builder(
        //           shrinkWrap: true,
        //           itemCount: predictions.length,
        //           itemBuilder: (context, index) {
        //             return ListTile(
        //               leading: CircleAvatar(
        //                 child: Icon(
        //                   Icons.pin_drop,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               title: Text(
        //                 predictions[index].description.toString(),
        //               ),
        //               onTap: () async {
        //                 final placeId = predictions[index].placeId!;
        //                 final details = await googlePlace.details.get(placeId);
        //                 if (details != null &&
        //                     details.result != null &&
        //                     mounted) {
        //                   if (startFocusNode.hasFocus) {
        //                     setState(() {
        //                       startPosition = details.result;
        //                       _startSearchFieldController.text =
        //                           details.result!.name!;
        //                       predictions = [];
        //                     });
        //                   } else {
        //                     setState(() {
        //                       endPosition = details.result;
        //                       _endSearchFieldController.text =
        //                           details.result!.name!;
        //                       predictions = [];
        //                     });
        //                   }

        //                   if (startPosition != null && endPosition != null) {
        //                     print('navigate');
        //                     // Navigator.push(
        //                     //   context,
        //                     //   MaterialPageRoute(
        //                     //     builder: (context) => MapScreen(),
        //                     //   ),
        //                     // );
        //                   }
        //                 }
        //               },
        //             );
        //           })
        //     ],
        //   ),
        // ),
        );
  }
}
