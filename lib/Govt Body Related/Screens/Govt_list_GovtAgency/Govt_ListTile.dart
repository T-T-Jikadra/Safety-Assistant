import 'package:flutter/material.dart';

class NgoListTile extends StatefulWidget {
  final String index;
  final String regNo;
  final String nameOfNGO;
  final String serviceList;
  final String contact;
  final String website;
  final String email;
  final String state;
  final String city;
  final String pinCode;
  final String address;
  final String pwd;

  const NgoListTile({
    Key? key,
    required this.index,
    required this.regNo,
    required this.nameOfNGO,
    required this.serviceList,
    required this.contact,
    required this.website,
    required this.email,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.address,
    required this.pwd,
  }) : super(key: key);

  @override
  _NgoListTileState createState() => _NgoListTileState();
}

class _NgoListTileState extends State<NgoListTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heightAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          if (isExpanded) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(widget.index),
                ),
                title: Text(widget.nameOfNGO),
                subtitle: AnimatedContainer(
                  decoration: const BoxDecoration(
                      // color: Colors.black38
                      ),
                  duration: const Duration(milliseconds: 300),
                  height: isExpanded ? null : 0,
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.regNo),
                      Text(widget.nameOfNGO),
                      Text(widget.email),
                      Text(widget.serviceList),
                      Text(widget.contact),
                      Text(widget.website),
                      Text(widget.email),
                      Text(widget.state),
                      Text(widget.city),
                      Text(widget.pinCode),
                      Text(widget.address),
                      Text(widget.pwd),
                    ],
                  ),
                ),
                // Add more fields as needed
              ),
            ),
          ),
          if (isExpanded)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SizedBox(
                  height: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            isExpanded = false;
                            _controller.reverse();
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
