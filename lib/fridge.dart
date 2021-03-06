import 'package:flutter/material.dart';

class Fridge {
  Fridge({this.key, this.name, this.description, this.permissions});
  String key;
  String name;
  String description;
  int permissions = 0;

  @override
  String toString() {
    // ignore: unnecessary_brace_in_string_interps
    return '${key}: ${name}';
  }
}

class FridgeItem extends StatelessWidget {
  FridgeItem(
      {this.fridge, this.onView, this.onEdit, this.onDelete, this.onLeave});
  final Fridge fridge;
  final onView;
  final onEdit;
  final onDelete;
  final onLeave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                fridge.name != null ? fridge.name : '',
                style: TextStyle(fontSize: 24.0),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                  top: 2.0,
                  bottom: 8.0,
                ),
                child: Text(
                  fridge.description != null ? fridge.description : '',
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      onPressed: onView,
                      child: Text('View'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      onPressed: fridge.permissions == 2 ? onEdit : null,
                      child: Text('Edit'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: fridge.permissions == 2 ? onDelete : onLeave,
                    child: Text(fridge.permissions == 2 ? 'Delete' : 'Leave'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
