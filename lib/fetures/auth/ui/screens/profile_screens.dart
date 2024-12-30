import 'package:ecommerce/fetures/auth/ui/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreens extends StatefulWidget {
  const ProfileScreens({super.key});
  static const String name='/profile-screens';
  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
 final TextEditingController _firstNameController=TextEditingController();
 final TextEditingController _lastNameController=TextEditingController();
 final TextEditingController _mobileController=TextEditingController();
 final TextEditingController _cityController=TextEditingController();
 final TextEditingController _shoppingAddressController=TextEditingController();
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80,),
                AppIconWidget(),
                const SizedBox(height: 24,),
                Text('Complete Profile' ,style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 5),
                Text('Get started with us with your details' , style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),),
                const SizedBox(height: 24,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your first name';
                    }
                    return null;
                  },
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                      hintText: 'First Name '
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your last name';
                    }
                    return null;
                  },
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name '
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your mobile';
                    }
                    if(RegExp(r'^01[3-9]\d{8}$').hasMatch(value!)==false){
                      return 'Enter your valid mobile number';
                    }
                    return null;
                  },
                  controller: _mobileController,
                  decoration: const InputDecoration(
                      hintText: 'Mobile ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    )
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your City';
                    }

                    return null;
                  },
                  controller: _cityController,
                  decoration: const InputDecoration(
                      hintText: 'City '
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your shipping adress';
                    }
                    if(value!.length<=30){
                      return 'Text cannot exceed 30 characters';
                    }
                    return null;
                  },
                  maxLines: 5,
                  maxLength: 30,
                  controller: _shoppingAddressController,
                  decoration: const InputDecoration(
                      hintText: 'Shopping Address ',
                  ),
                ),
                const SizedBox(height: 24,),
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                  }
                }, child: Text('Complete'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cityController.dispose();
    _mobileController.dispose();
    _shoppingAddressController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
