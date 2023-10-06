import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_comp_app/features/categories/presentation/views/categories_view.dart';
import 'package:nasa_comp_app/features/info/presentation/views/info_view.dart';
import 'package:nasa_comp_app/features/profile/presentation/views/profile_view.dart';
import 'package:nasa_comp_app/features/settings/presentation/views/settings_view.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int navBarIndex=0;
  bool isLevels=false;
  List<Widget>pages=[
    const CategoriesView(),
    const InfoView(),
    const ProfileView(),
    const SettingsView(),
  ];
  List<String>pagesName=[
    "Categories",
    "Info",
    "Profile",
    "Mission & Tools"
  ];
  changeNavBarIndex(int index){
    navBarIndex=index;
    emit(ChangeNavBarIndexState());
  }
  changeLevelPage(bool level){
    isLevels=level;
    emit(ChangeLevelPageState());
  }

}
