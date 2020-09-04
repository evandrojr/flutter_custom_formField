import 'package:flutter/material.dart';

class CounterFormField extends FormField<int> {
  CounterFormField(
      {FormFieldSetter<int> onSaved,
      FormFieldValidator<int> validator,
      int initialValue = 0,
      bool autovalidate = false})
      : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (FormFieldState<int> state) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        state.didChange(state.value - 1);
                      },
                    ),
                    Text(state.value.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        state.didChange(state.value + 1);
                      },
                    ),
                  ],
                ),
                state.hasError
                    ? Text(
                        state.errorText,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container()
              ],
            );
          },
        );
}
