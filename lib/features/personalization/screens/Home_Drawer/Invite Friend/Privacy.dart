
import '../../../../../utils/constants/exports.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        title: Text('How it works:', style: CtextTheme.Welcomestyle),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/home-app-62d66.appspot.com/o/Assets%2Fshare%2Fworks.jfif?alt=media&token=d92b6dce-397f-4e9d-a57d-149711cd5b76"),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Share your invite link with friends. Once they sign up for a free account with your link, a fee voucher is automatically applied at checkout for them. After they place their first order, your voucher will be sent to you and automatically applied at checkout for you.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              const Text(
                '• You can invite up to 10 friends who have never made an order before',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Your voucher expires 30 days after you receive it',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Your friends’ voucher expires 30 days after they have signed up',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
