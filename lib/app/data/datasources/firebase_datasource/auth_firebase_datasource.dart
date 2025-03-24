import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tasks/app/data/dto/user_dto.dart';
import 'package:firebase_tasks/app/domain/entities/user_entity.dart';

import '../../../core/errors/failure.dart';

class AuthFirebaseDatasource {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<(Failure? failure, UserEntity? userEntity)> signup(UserEntity user) async {
      try{
        ///EXECUTAR O CODIGO
        final UserCredential userCredential =
         await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);

        if(userCredential.user != null){

          user.uid = userCredential.user!.uid;

          ///Users
          await _firestore.collection('users').doc(userCredential.user!.uid)
          .set(UserDTO(name: '', email: 'email').toMap(user));
          
          ///Retornando o usuario
          return (null, user);

        } else {
          return (Failure('[POPULAR ERROR]: Não foi possivel salvar o usuario'), null);
        }

      } on FirebaseAuthException catch (error) {
        ///Erro do Firebase Auth
        return (Failure('[AUTH ERROR]:${error.message}'), null);
      } on FirebaseException catch (error) {
          ///Erro do Firebase FIRESTORE
        return (Failure('[FIRESTORE ERROR]:${error.message}'), null);
      } catch (error){
          ///Qualquer ERRO EXETO OS DE CIMA
          return (Failure('[POPULAR ERROR]:$error'), null);
      }
  }
}