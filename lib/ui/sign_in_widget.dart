import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  TextEditingController emailController;
  TextEditingController passwordController;
  Function(String email, String password) signIn;

  SignInWidget(this.emailController, this.passwordController, this.signIn);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Увійдіть\nщоб продовжити',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 10,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff4267B2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Facebook'),
                        ));
                      },
                      child: Text(
                        'Facebook',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Google'),
                        ));
                      },
                      child: Text(
                        'Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 40.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey,
                      )),
                ),
                Text(
                  "або",
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 40.0),
                      child: Divider(
                        color: Colors.grey,
                      )),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Поштова скринька'),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Пароль'),
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: passwordController,
            ),
            Flexible(
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Забули пароль?'),
                  ));
                },
                child: Text(
                  'Забули пароль?',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        signIn(emailController.text, passwordController.text);
                      },
                      child: Text(
                        'Увійти',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
