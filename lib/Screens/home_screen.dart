import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/game_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final TextEditingController player1Controller=TextEditingController();
  final TextEditingController player2Controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: const Color(0xFF323D5B),
          body: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Text("Enter Players name",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: player1Controller,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                        decoration: const InputDecoration(
                          hintText: "Player 1 Name",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          ),
                        ),
                      validator:(value){
                      if(value==null || value.isEmpty){
                        return "Please enter Player 1 name.";
                      }
                      return null;
                      }
                      ),
                  ),
                  Padding(padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                        controller: player2Controller,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Player 2 Name",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)
                          ),
                        ),
                        validator:(value){
                          if(value==null || value.isEmpty){
                            return "Please enter Player 2 name.";
                          }
                          return null;
                        }
                    ),
                  ),
                  ElevatedButton(
                      onPressed:(){
                        if(_formKey.currentState!.validate()){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>
                              GameScreen(player1: player1Controller.text, player2: player2Controller.text))
                          );
                        }
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(50, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                      child:const Text("Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                      ),
                  )
                ]
              ),
            ),
          ),
        ));
  }
}
