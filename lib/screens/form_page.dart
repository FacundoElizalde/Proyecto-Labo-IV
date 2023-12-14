import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/themes/default_theme.dart';


import '../widgets/inputs_form.dart';

class FormScreen extends StatefulWidget {
   
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final Map<String, dynamic> valuesForm = {
      'firstname'    : 'Sebastian',
      'lastname'     : 'Gañan',
      'email'         : 'sebag@google.com',
      'dni'           : '123456',
      'estudios'      : '',
      'genero':'masculino',
      'extranjero': false,
    };
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(         
         centerTitle:true,
         title: const Text('FormScreen'),
         elevation:10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Column(
               children: [
                const SizedBox(height: 15,),
                InputsForm(labelText:'DNI', maxLength: 8, helperText: 'EJ.22123456',keyboardType: TextInputType.number, inputName: 'dni',inputValues: valuesForm,),
                const SizedBox(height: 15,),
                InputsForm(helperText: 'Ej: name@dominio.com',keyboardType: TextInputType.emailAddress,suffixIcon: Icons.email, inputName: 'email',inputValues: valuesForm,),
                const SizedBox(height: 15,),
                InputsForm(labelText: 'Nombre', inputName: 'firstname',inputValues: valuesForm,),
                const SizedBox(height: 15,),
                InputsForm(labelText: 'Apellido',inputName: 'lastname',inputValues: valuesForm,),
                const SizedBox(height: 15,),
                DropdownButtonFormField<String>(                    
                    value: '',   
                    icon: Icon(Icons.arrow_downward_sharp),     
                    borderRadius: BorderRadius.circular(10),            
                    
                    items: const[
                      DropdownMenuItem( value: '', child: Text('Estudios alcanzados', style: TextStyle(fontSize: 12, color: Colors.grey),)),
                      DropdownMenuItem( value: 'Primarios', child: Text('Primarios')),
                      DropdownMenuItem( value: 'Secundarios', child: Text('Secundarios')),
                      DropdownMenuItem( value: 'Terciarios', child: Text('Terciarios')),
                      DropdownMenuItem( value: 'Universitarios', child: Text('Universitarios')),
                    ],
                    onChanged: ( value ) {
                      print(value);
                      valuesForm['estudios'] = value ?? '';
                    }
                  ),
                const SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(                  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Femenino'),
                      Radio(
                        value: 'femenino',
                        groupValue: valuesForm['genero'],
                        onChanged: (value) {
                          setState(() {
                            print(value);
                            valuesForm['genero'] = value ?? '';
                          });
                        },
                      ),
                      Text('Masculino'),
                      Radio(
                        value: 'masculino',
                        activeColor: DefaultTheme.primary,
                        groupValue: valuesForm['genero'],
                        onChanged: (value) {
                          setState(() {
                            print(value);
                            valuesForm['genero'] = value ?? '';
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Extranjero'),
                    Checkbox(
                      checkColor: Colors.white, 
                      activeColor: DefaultTheme.primary, 
                      value: valuesForm['extranjero'],
                      onChanged: (bool? value) {
                        setState(() {
                          valuesForm['extranjero'] = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                     child: const SizedBox(
                       width: double.infinity,
                       height: 50,
                       child: Center(child: const Text('Guardar'))
                      ),
                     onPressed: () {
                        print(valuesForm);
                        FocusManager.instance.primaryFocus?.unfocus();
        
                        if ( !keyForm.currentState!.validate() ) {
                          print('Formulario no válido');
                          return;
                        }                      
                        print(valuesForm);
                     }, 
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

