import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_flix_flutter/config/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           SpinKitCubeGrid(
            color: AppColors.orange,
          ),
          Text(
            'Loading',
            style: TextStyle(color: AppColors.orange),
          )
        ],
    );
  }
}
