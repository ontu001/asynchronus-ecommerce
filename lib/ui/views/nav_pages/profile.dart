import 'package:ecommerce/model/user_profile.dart';
import 'package:ecommerce/services/firestore_db.dart';
import 'package:ecommerce/ui/widgets/custom_button.dart';
import 'package:ecommerce/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _uidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreDB().getUserProfile(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserProfile userProfile = snapshot.data as UserProfile;
              _nameController.text = userProfile.name;
              _emailController.text = userProfile.email;
              _uidController.text = userProfile.uid;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
                  child: Column(
                    children: [
                      customFormField(TextInputType.text, _nameController,
                          context, 'user name', (val) {},
                          prefixIcon: Icons.person_outline),
                      customFormField(
                        TextInputType.emailAddress,
                        _emailController,
                        context,
                        'email',
                        (val) {},
                        prefixIcon: Icons.email_outlined,
                        readOnly: true,
                      ),
                      customFormField(TextInputType.text, _uidController,
                          context, 'uid', (val) {},
                          prefixIcon: Icons.verified_outlined, readOnly: true),
                      customButton(
                        'Update Profile',
                        () async{
                          final updateData = UserProfile(name: _nameController.text.trim(), email: _emailController.text.trim(), uid: _uidController.text.trim());
                         await FirestoreDB().userProfileUpdate(updateData);
                        
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('something went wrong'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
