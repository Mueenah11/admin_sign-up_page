import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
@override
  State<MyApp> createState() => CreateAdminPage();
  }
  class CreateAdminPage extends  State<MyApp> {
    // store controllers/ forms and disposes and all other weird stuffs
    final lecturerIdController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    // formKeys => for validations
    final _formkeys = GlobalKey<FormState>();
    // dropdown value
   
     String? selectedLevel;
   
   
    @override
  void dispose() {
    lecturerIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  
return MaterialApp(
  home: Scaffold(
  backgroundColor: Colors.white,
  body: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    // wrapping inside form so it would work
    child: Form(
      key: _formkeys,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ const SizedBox( height: 20),
        Icon(Icons.school, size: 70, color: Colors.black87),
        const SizedBox( height: 10),
  
        const Text('Create Admin Account'
        , style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 17, 92, 19)
        ),),
           const SizedBox(height: 5),
           const Text('As a lecturer', style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
           ),),
  
           const SizedBox(height: 20),
           // 1=>2=>3 steps
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(radius: 12,backgroundColor: Color(0xFF00A000),
              child: Text('1',style: TextStyle(color: Colors.white))),
  
  SizedBox(width: 20),
  
             CircleAvatar(radius: 12,backgroundColor: Color(0xFFEAEAEA),
             child: Text('2',style: TextStyle(color: Colors.black87))),
  
  
  
  SizedBox(width: 20),
            CircleAvatar(radius: 12,backgroundColor: Color(0xFFEAEAEA),
            child: Text('3',style: TextStyle(color: Colors.black87))),
  
            ],
           ),
  const SizedBox(height: 30),
  // form, hello?
  Container(
  padding: const EdgeInsets.all(20),
  decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Color(0xFF00A000), width: 1)
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Account information', style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold
      ),),
      const SizedBox(height: 16),
  
  
      //Lecturer ID
      const Text('Lecturer ID'),
      SizedBox(height: 6),
      TextFormField(
        controller: lecturerIdController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
  
  
  
       // To validate
       validator:(value) {
         if (value == null || value.trim().isEmpty){
          return 'Lecturer ID is required';
         }
         return null;
       },),
  
    
    const SizedBox(height: 16),
  // password
  const Text('Password'),
      SizedBox(height: 6),
      TextFormField(
        controller: passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          
        ),
  
        obscureText: true,
  
       // To validate
       validator:(value) {
         if (value == null || value.trim().isEmpty){
          return 'Lecturer ID is required';
         }
  
         if (value.length<6){
          return 'Password must be atleast 6 characters';
         }
         return null;
       },
       ),
  
  
  
  
  
  
  const SizedBox(height: 16),
       // confirm password
  const Text('Confirm Password'),
      SizedBox(height: 6),
      TextFormField(
        controller: confirmPasswordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
         obscureText: true,
  
  
       // To validate
       validator:(value) {
         if (value != passwordController.text){
          return 'Password do not match';
         }
         return null;
       },),
  
  
  
  const SizedBox(height: 16),
  // dropdown val for level
  Text('choose level'),
  const SizedBox(height: 6),
  DropdownButtonFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder()),
  
    
    
    items: const [
      DropdownMenuItem( value :'100', child: Text('100 Level')),
      DropdownMenuItem( value :'200', child: Text('200 Level')),
      DropdownMenuItem( value :'300', child: Text('300 Level')),
      DropdownMenuItem( value :'400', child: Text('400 Level')),
      DropdownMenuItem( value :'500', child: Text('500 Level')),
    ],
    
    
    
    
    
     onChanged: (value){
      selectedLevel = value;
     },
     validator: (value) {
       if (value == null){
        return 'Please select a level';
       }
       return null;
     },)
  
  
  
  
       
    ],
  ),
  ),
  SizedBox(height: 10),
  // Continue button
   SizedBox(
    width: 260,
    
    
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF00A000),
        padding: EdgeInsets.symmetric(vertical: 22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      
      onPressed:() {
        if (_formkeys.currentState!.validate()){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('waiting...')));
        }
      },
        child: const Text('Continue', style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),),),
   ),
   const SizedBox(height: 20),
   // login link
   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [const Text('or'),
    SizedBox(width: 4,),
    GestureDetector(
      onTap: () {},
      child: const Text('Login?', style: TextStyle(
        color: Color(0xFF00A000),
        fontWeight: FontWeight.bold,
      ),),
    )],
   )
  
  
  
  
  
  
        ],
      )),
  
  
  
  
  ),
  
  ),
);
  }

  }
