import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptrapp/class/projects.dart';
import 'package:cryptrapp/repo/projects_repo.dart';

class ProjectsCubit extends Cubit<List<Projects>>
{
ProjectsCubit() : super(<Projects>[]);

var repom=ProjectsRepo();



Future<void> getProjeler() async
{
var liste=await repom.getProjects();
emit(liste);
}





}