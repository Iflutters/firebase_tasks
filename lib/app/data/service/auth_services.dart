import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tasks/app/core/errors/firebase_erros.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../dto/user_dto.dart';

class AuthServices {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<Either<Failure, UserEntity?>> signup(UserEntity user) async {
    try {
      ///EXECUTAR O CODIGO
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: user.email, password: user.password!);

      if (userCredential.user != null) {
        user.uid = userCredential.user!.uid;

        ///Users
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(UserDTO(name: '', email: 'email').toMap(user));

        ///Retornando o usuario
        return Right(user);
      } else {
        return Left(
            Failure('[POPULAR ERROR]: Não foi possivel salvar o usuario'));
      }
    } on FirebaseAuthException catch (error) {
      ///Erro do Firebase Auth
      return Left(Failure('[AUTH ERROR]:${error.message}'));
    } on FirebaseException catch (error) {
      ///Erro do Firebase FIRESTORE
      return Left(Failure('[FIRESTORE ERROR]:${error.message}'));
    } catch (error) {
      ///Qualquer ERRO EXETO OS DE CIMA
      return Left(Failure('[POPULAR ERROR]:$error'));
    }
  }

  Future<Either<Failure, UserEntity>> login(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (credential.user == null) {
        return Left(Failure(
            '[POPULAR ERROR]: Não foi possivel logar com o email: $email.'));
      }

        final userResult = await _firestore.collection('users')
        .doc(credential.user!.uid).get();

        UserDTO userDTO = UserDTO.fromMap(userResult.data()!);

        return Right(userDTO);

      //
    } on FirebaseAuthException catch (error) {
      return Left(Failure('[AUTH ERROR]:${FirebaseErros.error(error.code)}'));
    } catch (error) {
      ///Qualquer ERRO EXETO OS DE CIMA
      return Left(Failure('[POPULAR ERROR]:$error'));
    }
  }

  Future<Either<Failure, bool>> recoveryPass(String userEmail) async {
    try {

      await _auth.sendPasswordResetEmail(email: userEmail);

      return Right(true);
    } on FirebaseAuthException catch (error) {
      return Left(Failure('[AUTH ERROR]:${FirebaseErros.error(error.code)}'));
    } catch (error) {
      ///Qualquer ERRO EXETO OS DE CIMA
      return Left(Failure('[POPULAR ERROR]:$error'));
    }
  }
}
