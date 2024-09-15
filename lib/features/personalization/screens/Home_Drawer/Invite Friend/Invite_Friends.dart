
import '../../../../../utils/constants/exports.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                       Navigator.pop(context);
                      },
                      child:  const Icon(
                        Icons.arrow_back,size: 30,color: CColor.black,)),
                  //SizedBox(width: 220,),
                  const Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) {
                        return const Privacy();
                      },)
                      );
                    },
                    child:  const Text('How it works ?',
                      style: TextStyle(
                          color:CColor.primary,
                          fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              Container(
                  height: size.height*0.30,
                  margin: const EdgeInsets.only(top: 20,right: 20),
                  child: const Image(
                      image: 
                      NetworkImage("https://firebasestorage.googleapis.com/v0/b/home-app-62d66.appspot.com/o/Assets%2Fshare%2Fshare%20pic.jfif?alt=media&token=f52a825f-5b82-4096-9fd2-c288061fe6a0")
                  )),

              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text('Invite Friend, get Rs.400',
                  style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('1. Your friends get Rs. 500',
                  style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ), const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('when they sign up with your invite link',
                  style: TextStyle(
                    fontSize: 15,),
                ),
              ), const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('2. Then you get Rs.400',
                  style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('once they place their first order',
                  style: TextStyle(
                    fontSize: 15,),
                ),
              ),
              const SizedBox(height: 80,),

              OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(CColor.primary),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 90),
                      ),
                      //fixedSize: WidgetStatePropertyAll(Size(350, 50)),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                  ),
                  onPressed: (){},
                  child:  const Text('Share your Link',
                    style: TextStyle(
                        color: CColor.white,
                        fontSize: 20,fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20,),
              OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(CColor.white),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 100),
                      ),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:  const BorderSide(
                                color: Colors.purpleAccent,width: 10
                            )
                        ),
                      )
                  ),
                  onPressed: (){},
                  child:  const Text('Scan QR Code',
                    style: TextStyle(
                        color: CColor.black,
                        fontSize: 20,fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
