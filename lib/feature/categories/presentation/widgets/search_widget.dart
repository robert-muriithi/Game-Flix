import 'package:flutter/material.dart';
import 'package:game_flix_flutter/config/theme/colors.dart';
import '../../../search/presentation/pages/search_page.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: SearchDelegatePage());
      },
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: _border(AppColors.orange),
              border: _border(AppColors.darkGrey),
              enabledBorder: _border(AppColors.darkGrey),
              hintText: 'Start search',
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              prefixIcon: const Icon(Icons.search, color: AppColors.darkGrey),
            ),
            onFieldSubmitted: (value) {},
          )),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
