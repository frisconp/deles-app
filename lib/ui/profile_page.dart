import 'package:delesapp/bloc/profile_bloc/profile_bloc.dart';
import 'package:delesapp/bloc/profile_bloc/profile_event.dart';
import 'package:delesapp/bloc/profile_bloc/profile_state.dart';
import 'package:delesapp/data/models/user_model.dart';
import 'package:delesapp/ui/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(GetUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Profile',
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          var _returnCondition;
          if (state is ProfileInitialState) {
            _returnCondition = BasePage().buildLoading();
          } else if (state is ProfileLoadingState) {
            _returnCondition = BasePage().buildLoading();
          } else if (state is ProfileSucceedState) {
            _returnCondition = _buildProfileInfo(state.user);
          } else if (state is ProfileErrorState) {
            _returnCondition = BasePage().buildErrorUi(state.message);
          }
          return _returnCondition;
        },
      ),
    );
  }

  Widget _buildProfileInfo(User user) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        children: <Widget>[
          _profileTop(user),
          _contactInfo(user),
          _personalInfo(user),
          _changePasswordButton(),
          _logoutButton(),
        ],
      ),
    );
  }

  Widget _profileTop(User user) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: .5,
          color: Color.fromRGBO(219, 219, 219, 1),
        ),
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey[350],
            backgroundImage: user.avatar != null
                ? NetworkImage(user.avatar)
                : AssetImage('assets/images/avatar_default.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user.name,
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 37,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Color.fromRGBO(240, 165, 0, 1),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Center(
                  child: Text(
                    'Edit Profile',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(240, 165, 0, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactInfo(User user) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: .5,
          color: Color.fromRGBO(219, 219, 219, 1),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Contacts Info',
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.email,
                color: Color.fromRGBO(240, 165, 0, 1),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                user.email,
                style: GoogleFonts.nunitoSans(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.phone,
                color: Color.fromRGBO(240, 165, 0, 1),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                user.phoneNumber,
                style: GoogleFonts.nunitoSans(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _personalInfo(User user) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: .5,
          color: Color.fromRGBO(219, 219, 219, 1),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Personal Info',
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Date of Birth',
                style: GoogleFonts.nunitoSans(fontSize: 15),
              ),
              Text(
                user.dateOfBirth ?? 'Not filled',
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  fontStyle: user.dateOfBirth != null
                      ? FontStyle.normal
                      : FontStyle.italic,
                  color: user.dateOfBirth != null ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Address',
                style: GoogleFonts.nunitoSans(fontSize: 15),
              ),
              Text(
                user.address ?? 'Not filled',
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  fontStyle: user.address != null
                      ? FontStyle.normal
                      : FontStyle.italic,
                  color: user.address != null ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'City',
                style: GoogleFonts.nunitoSans(fontSize: 15),
              ),
              Text(
                user.city ?? 'Not filled',
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  fontStyle:
                      user.city != null ? FontStyle.normal : FontStyle.italic,
                  color: user.city != null ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _changePasswordButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          'Change Password',
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          'Logout',
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
