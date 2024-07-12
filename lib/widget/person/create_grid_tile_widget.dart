import 'package:avatar_better/avatar_better.dart';
import 'package:flutter/material.dart';

class CreateGridTileWidget extends StatefulWidget {
  final String url;
  final Size size;

  const CreateGridTileWidget(
      {super.key, required this.url, required this.size});

  @override
  _CreateGridTileWidgetState createState() => _CreateGridTileWidgetState();
}

class _CreateGridTileWidgetState extends State<CreateGridTileWidget> {
  void _showDialog(BuildContext context, String url) {
    final isPortraitImage = _isPortrait(url); // Check image orientation

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          child: Dialog(
            alignment: Alignment.center,
            insetPadding: const EdgeInsets.all(0.0),
            child: SizedBox(
              width: widget.size.width * 0.80,
              height: isPortraitImage
                  ? widget.size.height * 0.80 // More height for vertical images
                  : widget.size.height *
                      0.40, // Less height for horizontal images
              child: GridTile(
                header: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Avatar(text: "text", radius: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "jacob_w",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                footer: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.heart_broken_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_4_sharp),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ),
                child: Image.network(url, fit: BoxFit.cover),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isPortrait(String url) {
    // You can implement logic to check image orientation from the URL or image metadata (if available)
    // Here's a placeholder assuming the URL contains a height and width indicator (replace with your logic)
    return url.contains("height") &&
        url.contains("width") &&
        int.parse(url.split("height=")[1].split("&")[0]) >
            int.parse(url.split("width=")[1].split("&")[0]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showDialog(context, widget.url);
        setState(() {});
      },
      onLongPressEnd: (d) {
        setState(() {
          Navigator.pop(context);
        });
      },
      child: GridTile(
        child: Image.network(widget.url, fit: BoxFit.cover),
      ),
    );
  }
}
