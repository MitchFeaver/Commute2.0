import 'package:commute/theme/components/custom_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicy {
  final String _tempContent = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque risus purus, congue sit amet lobortis quis, tincidunt ut nunc. Duis felis mauris, iaculis a nisi porttitor, placerat interdum tortor. Suspendisse in mauris at urna blandit cursus nec ut eros. Suspendisse suscipit sed turpis sed bibendum. Phasellus viverra erat et erat gravida facilisis. Sed egestas, urna ac dignissim ultricies, nibh tortor fermentum mi, quis commodo mi mi quis dolor. Phasellus mattis maximus gravida. Sed ac lorem ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam at rutrum ipsum. In gravida venenatis dolor, non laoreet arcu.\n\n" +
      "Phasellus sed libero vitae diam dictum viverra. Nullam pulvinar aliquet nulla sit amet suscipit. Proin luctus pulvinar orci, quis vulputate sapien ornare ut. Pellentesque in ex pharetra arcu cursus ullamcorper quis non dui. Praesent massa mi, tempus eget eros vitae, feugiat elementum metus. Maecenas vitae elementum erat. Aenean libero nisi, rutrum eget maximus ut, commodo eu est. Nulla rhoncus, dolor eget posuere dictum, enim metus tincidunt felis, quis ornare metus augue id justo.\n\n" +
      "Aliquam eget sem elementum, maximus tortor vel, suscipit odio. Maecenas suscipit luctus elit vitae varius. Donec a egestas enim. Suspendisse eget ante ligula. Vivamus malesuada aliquam felis id rhoncus. Nullam est magna, consectetur vitae sem eget, condimentum dictum urna. Nunc ultricies pulvinar auctor. Ut efficitur nulla vel lectus molestie, sed dictum augue facilisis. Nullam pellentesque mauris justo, id volutpat ipsum rhoncus vel. Maecenas tempus sagittis quam, at fringilla dui pharetra eget. Vivamus tincidunt imperdiet laoreet. Curabitur quis nisi massa. Ut interdum mattis iaculis. Maecenas semper porttitor erat viverra interdum. Maecenas ullamcorper fermentum enim, quis imperdiet nisi accumsan suscipit. Fusce eu diam sit amet ligula consectetur dictum.\n\n" +
      "Aliquam fringilla dictum dui sit amet viverra. Curabitur eget eros ligula. Ut pharetra fermentum lobortis. In dolor massa, semper nec malesuada id, tincidunt non tortor. Vestibulum vel nisi scelerisque, euismod orci quis, pharetra ipsum. Praesent sem lorem, maximus tristique ante sit amet, ornare pellentesque turpis. Maecenas varius magna sit amet felis ultrices, id pulvinar lorem euismod. Donec volutpat commodo ligula, at interdum arcu varius sit amet.\n\n" +
      "Suspendisse id feugiat lectus. Aliquam eu justo consectetur, pharetra libero sit amet, sagittis nulla. Mauris consequat, eros in vestibulum accumsan, magna elit pulvinar enim, sed porta arcu eros vehicula augue. Aliquam dolor lacus, mollis fringilla mattis ac, pulvinar vitae quam. Donec convallis diam eget condimentum pellentesque. Vestibulum efficitur volutpat mauris fermentum varius. Pellentesque ac nunc eu enim malesuada sodales euismod quis dolor. Fusce arcu enim, aliquam et turpis vel, ullamcorper venenatis arcu. Ut ullamcorper augue eu libero lacinia fermentum. Suspendisse volutpat efficitur diam dignissim lobortis. Phasellus eget lectus tellus. Vivamus sollicitudin risus vel eros suscipit, quis scelerisque metus pharetra. Suspendisse eget turpis vitae ligula gravida congue in auctor mi.\n\n" +
      "Nam porttitor in metus nec molestie. Nam vitae auctor ligula. Aliquam mi libero, facilisis sed consequat eget, ornare id quam. Integer suscipit purus a vulputate posuere. Donec in tempus neque. Etiam ut est a felis euismod euismod sit amet eget metus. Donec nec lectus augue. Integer et tortor laoreet, condimentum nunc rhoncus, tristique dolor. Duis sit amet laoreet mauris, a pellentesque massa. Ut id leo lectus. Mauris in porta erat. Aliquam cursus pellentesque dui. Fusce luctus magna in maximus sollicitudin. Etiam aliquam justo a elit euismod, luctus posuere augue pellentesque.\n\n" +
      "In vehicula a lorem a maximus. Nam condimentum, arcu sed suscipit aliquet, sapien diam sollicitudin metus, et mollis felis est a neque. Sed iaculis, tortor sed tincidunt malesuada, tellus nisi feugiat massa, vel efficitur arcu orci nec orci. Mauris nunc odio, tincidunt vitae massa vitae, cursus molestie metus. Fusce rhoncus tortor ex, eu vehicula magna tincidunt ac. Praesent non ex vel velit laoreet eleifend. Nulla elementum urna non mi pulvinar euismod. Quisque mattis sed nunc ut egestas.\n\n" +
      "Pellentesque sed hendrerit diam. Aenean elementum mauris urna, id vehicula nisl consequat non. Fusce cursus dolor ut maximus rhoncus. Nullam viverra sapien ac diam tristique, dapibus fringilla ante tristique. Nam nec metus nec quam maximus mollis. Nam a odio faucibus, blandit libero sit amet, pharetra felis. Ut fringilla ex id nisl porta, eget luctus quam auctor. Donec eu suscipit ex. Donec ornare ex ac massa euismod, non mattis nisi ultricies. Donec vitae feugiat est, at malesuada erat. Nulla eu sodales ipsum, id tincidunt risus. Nulla eget fermentum dui. In porttitor tortor sed arcu dictum pharetra. Aenean vitae maximus sapien, sed eleifend urna.\n\n" +
      "Sed dui mi, tincidunt vel magna nec, auctor semper tortor. Integer nec massa sit amet eros commodo interdum sagittis sit amet dui. Donec neque odio, viverra vel vestibulum dignissim, ornare sed ante. Donec eget ipsum vestibulum, pretium nunc eu, venenatis leo. Nam ultrices est id blandit volutpat. Suspendisse potenti. Sed consectetur eu metus ut ornare.\n\n" +
      "Duis ut odio metus. Vivamus dapibus vitae elit et sollicitudin. Sed euismod scelerisque ipsum condimentum tincidunt. Proin euismod ipsum congue, finibus est in, hendrerit turpis. Suspendisse efficitur lorem lectus, sed blandit sem lacinia sed. Etiam imperdiet sit amet quam nec eleifend. Vestibulum et dapibus libero. Fusce finibus quam sit amet leo commodo, at aliquet diam ultrices. Mauris ex arcu, iaculis in ante ut, consectetur ultricies lorem. Proin vehicula mollis nisi id eleifend. Morbi bibendum velit diam, sit amet congue justo ornare sit amet.";

  void show(BuildContext context) async {
    await showSlidingBottomSheet(
      context,
      builder: (context) {
        return SlidingSheetDialog(
          avoidStatusBar: true,
          cornerRadiusOnFullscreen: 0,
          liftOnScrollHeaderElevation: 0,
          snapSpec: const SnapSpec(
            initialSnap: SnapSpec.expanded,
          ),
          headerBuilder: (context, state) => Container(
            padding: EdgeInsets.fromLTRB(
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_16),
            child: Text(
              AppLocalizations.of(context)!.privacyPolicy,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          footerBuilder: (context, state) => Container(
            padding: EdgeInsets.fromLTRB(
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_16),
            child: SizedBox(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!.close),
              ),
              width: double.infinity,
            ),
          ),
          builder: (context, state) => Container(
            child: Column(
              children: [
                Text(
                  _tempContent,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_8,
                CustomSpacing.spacing_16,
                CustomSpacing.spacing_8),
          ),
        );
      },
    );
  }
}
