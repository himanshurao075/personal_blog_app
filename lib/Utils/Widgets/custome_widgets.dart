import 'package:flutter/material.dart';

class CustomeTextFField extends StatelessWidget {
  const CustomeTextFField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.validator,
  });
  final TextEditingController controller ;
  final String label ; 
  final String hintText ; 
  final IconData? prefixIcon ;
  final Function(dynamic value) validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 6.0),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {},
        validator:  (value) {
      return   validator(value);
        },
        decoration:InputDecoration(
        
        label: Text(label),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(5))),
        prefixIcon: prefixIcon==null ?null : Icon(prefixIcon,color: theme.primaryColor,)
        )),
    );
  }
}


class CustomeBodyTextFField extends StatelessWidget {
  const CustomeBodyTextFField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.validator,
  });
  final TextEditingController controller ;
  final String label ; 
  final String hintText ; 
  final IconData? prefixIcon ;
  final Function(dynamic value) validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 6.0),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {},
        validator:  (value) {
      return   validator(value);
        },
        // expands: true,
        // maxLines: null,
        keyboardType: TextInputType.multiline,
minLines: 1,
maxLines: 20,
maxLength: 10000,
        decoration:InputDecoration(
        
        label: Text(label),
        hintText: hintText,
        
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(5))),
        prefixIcon: prefixIcon==null ?null :  Icon(prefixIcon,color: theme.primaryColor,)
        )),
    );
  }
}



class CustomTextLabel extends StatelessWidget {
  const CustomTextLabel({
    super.key,
    required this.label,
    required this.onTap,
  });

  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
   final theme = Theme.of(context);
    return GestureDetector(
      onTap: (){onTap();},
      child: Text(label,style: TextStyle(color: theme.primaryColor,fontWeight: FontWeight.w500,fontSize: 16),));
  }
}


class CustomeLargeButton extends StatelessWidget {
  const CustomeLargeButton({
    super.key,
    required this.onTap,
    this.isExapaned = false,
    required this.textLabel
  });
  final Function onTap;
  final String textLabel ;
  final bool isExapaned ;

  @override
  Widget build(BuildContext context) {
    if(isExapaned) {
      return ElevatedButton(onPressed: (){
            onTap();
          }, child: Text(textLabel,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width:300,
          height: 50,
          child: ElevatedButton(onPressed: (){
            onTap();
          }, child: Text(textLabel,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),))),
      ],
    );
  }
}
