import 'package:flutter/material.dart';
import 'package:time_tracker/generated/l10n.dart';

class AddTaskPopUp extends StatelessWidget{
  const AddTaskPopUp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    backgroundColor: Colors.white,
    elevation: 4,
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
              Text(
               S.of(context).add,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color:Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

}