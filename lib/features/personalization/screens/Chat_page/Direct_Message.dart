
import '../../../../../utils/constants/exports.dart';

class DirectMessage extends StatelessWidget {
  const DirectMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColor.darkGrey,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.cancel,
            color: CColor.primary,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'How can we help?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: CColor.black),
        ),
      ),
      body: Column(children: [
        SizedBox(height: size.height * 0.05,),

        //My Account
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatPage(initialMessage: 'My Account'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width * 0.04,),
              const Icon(Icons.account_circle),
              const SizedBox(width: 10,),
              const Text('My Account', style: TextStyle(fontSize: 20,)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_sharp, color: Colors.purple,),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 2,),
        const SizedBox(height: 20,),

        //Payment and refunds
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatPage(initialMessage: 'Payment and refunds'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width * 0.04,),
              const Icon(Icons.payment),
              const SizedBox(width: 10,),
              const Text('Payment and refunds', style: TextStyle(fontSize: 20,)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_sharp, color: Colors.purple,),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 2,),
        const SizedBox(height: 20,),

        //Get help with my orders
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatPage(initialMessage: 'Get help with my orders'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width * 0.04,),
              const Icon(Icons.shopping_bag_outlined),
              const SizedBox(width: 10,),
              const Text('Get help with my orders', style: TextStyle(fontSize: 20,)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_sharp, color: Colors.purple,),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 2,),
        const SizedBox(height: 20,),

        //My Support Request
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatPage(initialMessage: 'My Support Request'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width * 0.04,),
              const Icon(Icons.email),
              const SizedBox(width: 10,),
              const Text('My Support Request', style: TextStyle(fontSize: 20,)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_sharp, color: Colors.purple,),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 2,),
        const SizedBox(height: 20,),

        //Others
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatPage(initialMessage: 'Others'), // Replace with the selected text
              ),
            );
          },
          child: Row(
            children: [
              SizedBox(width: size.width * 0.04,),
              const Icon(Icons.account_circle),
              const SizedBox(width: 10,),
              const Text('Others', style: TextStyle(fontSize: 20,)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_sharp, color: Colors.purple,),
            ],
          ),
        ),

        const SizedBox(height: 20,),
        const Divider(thickness: 1,),
      ]),
    );
  }
}
