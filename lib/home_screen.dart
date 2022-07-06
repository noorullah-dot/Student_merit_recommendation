// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smr/aboutus.dart';
import 'package:smr/login_screen.dart';
import 'package:smr/notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geocoding/geocoding.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
String bisepurl = 'https://www.bisep.edu.pk/';
String edwardsCollegeurl = 'https://edwardes.edu.pk/Home';
String govtCollegeurl = 'https://gcp.kp.gov.pk/';
String hadafCollegeurl = 'https://hadaf.edu.pk/';
String islamiaCollegeurl = 'https://www.icp.edu.pk/';
String peshawardegreeCollegeboysurl = 'http://www.pmdc.edu.pk/';
String peshawardegreeCollegegirlsurl = 'http://www.pmdc.edu.pk/'; 
String icmsCollegeurl = 'https://icms.edu.pk/';
 String leedsCollegeurl = 'http://leeds.edu.pk/';
String globleCollegeurl = 'http://college.globalgroup.edu.pk/';
String brillientCollegeurl = 'https://topschools.pk/university/brilliant-college-of-science-dalazak-road-campus-peshawar/16417';
String quidazamCollegeurl = 'https://www.ilmkidunya.com/colleges/quaid-e-azam-degree-college-peshawar-fee-structure.aspx';
String fazaiaclgurl = 'https://fazaia.edu.pk/fazaiadegreecollegepeshawar/home';
String cdc = "https://www.capital.edu.pk/";
String NWI = "https://www.nwihs.edu.pk/";
String MC = "https://www.themuslim.edu.pk/";
String GFC = "https://www.facebook.com/Govt-Frontier-College-For-Women-Peshawar-645781155791863/";
//String GCP = "https://gandhara.edu.pk/GCP/index.html";
String PES = "https://pimspsh.edu.pk/";
String NES = "https://www.niceeducationsystem.edu.pk/";
String GIM = "https://www.kmu.edu.pk/ghazali-institute-medical-sciences-peshawar";
String PCM = "https://pcms.edu.pk/";
String PIM = "https://www.pimmspesh.edu.pk/";
String HIM = "https://www.hims.edu.pk/";
String PEFC = "https://pefcollege.edu.pk/";
String RIMS = "https://rims.edu.pk/";
String BPG = "https://brains.edu.pk/";
String FHM = "https://fhmc.edu.pk/";
String BCSP = "https://bcsp.edu.pk/";
String RNC = "https://rnc.prime.edu.pk/";
String ICHS = "https://ichs.edu.pk/";




class _HomeScreenState extends State<HomeScreen> {
   Future<void>launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true,enableJavaScript: true,enableDomStorage: false);
    } else {
      throw 'could not launch $url';
    }
  }

  List colleges_images = ['assets/biseppic.jpg',
  'assets/edward college.png','assets/govt pesh.jpg',
  'assets/hadaf.png','assets/islamiaclg.jpg',
  'assets/pmdc.jpg','assets/pmdcGirl.jpg',
   'assets/icms.jpg','assets/leedsclg.png','assets/globalclg.jpg',
   'assets/briliantclg.jpg','assets/quideazam.jpg','assets/fazaiaclg.jpg',
   'assets/cdc.jpg','assets/NWI.jpg','assets/MC.jpg',
   'assets/GFC.jpg','assets/PES.jpg',
   'assets/NES.jpg','assets/GIM.jpg','assets/PCM.jpg',
   'assets/PIM.jpg','assets/Hims.jpg','assets/PEF.jpg',
   'assets/RIMS.jpg','assets/BPG.jpg','assets/FHM.png',
   'assets/BCSP.png','assets/RNC.jpg','assets/ICHS.jpg'

   
   
   
   
   
   
   
   
   
   
   ];
   
   
  //  List colleges_names=['Bisep','Edwards College Boys','Govt.CollegePeshawar Boys','Hadaf College Boys','Islamia College Boys',
  //  'Peshawar model Degree College Boys','Peshawar Model Degree College Girls','www.ICMSCollege.com','www.LeedsCollege.com','www.GlobalCollege.com','www.BriliantCollege.com','www.Quid_E_AzamCollege.com','www.FazaiaCollege.com'];

   List colleges_url = [bisepurl,edwardsCollegeurl,govtCollegeurl,hadafCollegeurl,islamiaCollegeurl,peshawardegreeCollegeboysurl,peshawardegreeCollegegirlsurl,
   icmsCollegeurl,leedsCollegeurl,globleCollegeurl,brillientCollegeurl,quidazamCollegeurl,fazaiaclgurl];


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled){
    await Geolocator.openLocationSettings();
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

// Future<void> GetAdressFromLatLong(Position position) async {
//  List<Placemark> placemark = (await PlacemarkFromCoordinates(position.longitude,position.latitude)) as List;
//   print(placemark);
//   Placemark place = placemark[0];
// }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton:FloatingActionButton(child: Icon(Icons.add_location),onPressed: () async{
      Position position = await _determinePosition();
      print(position.latitude);

      // location = ('Lat: ${position. latitude}, Long: ${position.longitude}');   
      },),
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        title: Text('Student Merit Recommendation',style: TextStyle(fontSize: 14),),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.add)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        bottom: PreferredSize(preferredSize: Size(14 ,10), child: Container(),),
        
      ),
      drawer:Drawer(
      child:Column(
        children:[
          DrawerHeader(decoration: BoxDecoration(color: Colors.white),
          child:  Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/SMR_logo.png'),
                      radius: 50,
                      //: Text('SMR',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(alignment: Alignment.center,
                    child: Text('Student Merit Recommendation',style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)))
                ],
              ),
              ),
           ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
            ),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications())); 
            },),
            SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
            ),onTap: (){
              Navigator.of(context).pop();
            },),
            SizedBox(height: 10,),

            ListTile(
            leading: Icon(Icons.contacts_rounded),
            title: Text('About us',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
            
            ),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutus()));
            }),

            ListTile(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginscreen()));
            },
              leading: Icon(Icons.logout_outlined),
              title:Text('Logout',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold)
                ),),
            ],
      )
    ),
     body: ListView.builder(
       itemCount: colleges_images.length,
       itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(colleges_images[index],fit: BoxFit.fitWidth,),
                    ),
                    
                onTap: (){
                  launchURL(colleges_url[index]);
                },
              ),
            ],
          );
         
       }));


  }
}