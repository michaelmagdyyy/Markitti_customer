import 'package:e_commerce/blocs/favoritebloc/favorite_bloc.dart';
import 'package:e_commerce/core/widgets/app_bar.dart';
import 'package:e_commerce/models/FavoriteModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routes/app_routes_fun.dart';
import '../../core/routes/routes.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/empty_list.dart';
import '../../models/sub_category_brand.dart';
import '../nav_bar/new_service/widgets/service_item.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final bloc = sl<FavoriteBloc>();
  List<FavoriteData>? listFavorite=[];
  @override
  void initState() {
    bloc.add(GetFavoriteEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Favorite List",),
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is FavoriteLoaded) {
            listFavorite = state.model.data?? [];
            setState(() {});
          }
        },
        builder: (context, state) {
          if (listFavorite!.isEmpty) return const EmptyList();
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: listFavorite?.length??0,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                push(NamedRoutes.brandDetails,
                    arg: {"id": listFavorite?[index].brandId, "brandModel": SubBrandModel(
                      brandId: listFavorite?[index].brandId,
                      bannerImage: listFavorite?[index].bannerImage,
                      brandLogo: listFavorite?[index].brandLogo,
                      brandName: listFavorite?[index].brandName,
                      // customerBrandDiscountPercentage: listFavorite?[index].,
                      // customerBrandPurchasesLimit: listFavorite?[index].
                    )});
              },
              child: ServiceItem(withHeart:true,model:SubBrandModel(
                brandId: listFavorite?[index].brandId,
                bannerImage: listFavorite?[index].bannerImage,
                brandLogo: listFavorite?[index].brandLogo,
                brandName: listFavorite?[index].brandName,
                // customerBrandDiscountPercentage: listFavorite?[index].,
                // customerBrandPurchasesLimit: listFavorite?[index].
              )),
            ),
          );
        },
      ),
    );
  }
}
