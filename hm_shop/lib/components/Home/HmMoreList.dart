import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  final List<dynamic> recommendList;
  HmMoreList({Key? key, required this.recommendList}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    // if (widget.recommendList.isEmpty) {
    //   return const SliverToBoxAdapter(child: SizedBox.shrink());
    // }
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // child: Text("商品$index", style: const TextStyle(color: Colors.white)),
          child: _getChildren(index),
        );
      },
    );
  }

  Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          // Expanded(
          // child: ClipRRect(
          ClipRRect(
            //ClipRRect 圆角
            borderRadius: BorderRadius.circular(8),

            child: AspectRatio(
              //AspectRatio  宽高比  aspectRatio
              aspectRatio: 1.0,
              child: Image.network(
                widget.recommendList[index].picture ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/asset/images/1.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          // ),
          const SizedBox(height: 6),
          Padding(
            //Padding 名称
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.recommendList[index].name ?? "",
              maxLines: 2,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "¥${widget.recommendList[index].price ?? ""}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                    ),
                    children: [
                      const TextSpan(text: "  "),
                      TextSpan(
                        text: "${widget.recommendList[index].price ?? ""}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount ?? "0"}人付款",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
