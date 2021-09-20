import 'package:flutter/material.dart';
import 'package:time_tracker/generated/l10n.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_bloc.dart';
import 'package:time_tracker/src/bloc/list_bloc/list_event.dart';
import 'package:time_tracker/src/theme/dimen.dart';
import 'package:time_tracker/src/widget/tt_elevated_button.dart';

class AddTaskPopUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _project;
  String? _desc ;
  AddTaskPopUp({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _pop(context),
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
                const SizedBox(
                  height: Dimen.defaultMargin,
                ),
                TextFormField(
                  validator: (value)=>_notEmptyValidator(context  ,value ),
                  onSaved: (value) => _title = value,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S.of(context).title,
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Dimen.defaultMargin),
                TextFormField(
                  validator: (value)=>_notEmptyValidator(context  ,value ),
                  onSaved: (value) => _project = value,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S.of(context).project,
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Dimen.defaultMargin),
                TextFormField(
                  validator: (value)=>_notEmptyValidator(context  ,value ),
                  onSaved: (value) => _desc = value,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S.of(context).description,
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Dimen.defaultMargin),
                SizedBox(
                  width: double.infinity,
                  child: TTElevatedButton(
                    child: Text(S.of(context).add),
                    mainColor: Theme.of(context).primaryColor,
                    onPressed: () => _next(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  String? _notEmptyValidator(BuildContext context ,String? value) {
    if (value==null || value.isEmpty) {
      return S.of(context).validation_message;
    }
    return null;
  }
  void _next(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _addTask(context , _title! , _project! , _desc!);
    } else {
      var snackBar = SnackBar(content: Text(S.of(context).validation_message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  void _addTask(BuildContext context , String title , String project , String description) {
    ListBloc.of(context).add(ListEvent.addTask(title , project, description));
    _pop(context);
  }

  void _pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
