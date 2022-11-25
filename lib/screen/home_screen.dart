import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final _formField = GlobalKey<FormState>();
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   bool passToggle = true;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
              title: const Text('Form Sign'),
              centerTitle: true,
           ),
           body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Form(
                key: _formField,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/avatar.png",
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                        
                        if(value.isEmpty){
                          return "Enter Email";
                        } else if(!emailValid) {
                          return "Enter Valid Email";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;    
                            });
                          },
                          child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Enter Password";
                        } else if (passwordController.text.length < 6) {
                          return "Password Length Showld be more than 6 characters";
                        }
                      },
                    ),
                    const SizedBox(height: 60),
                    InkWell(
                      onTap: (){
                        if(_formField.currentState!.validate()){
                          print("Sucesso");
                          emailController.clear();
                          passwordController.clear();
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text("Log In", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(
                       height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have a account?", style: TextStyle(
                            fontSize: 17
                          ),
                        ),
                        TextButton(child: const Text(
                            "Sing Up", 
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
           ),
       );
  }
}