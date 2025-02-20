import 'package:cimalite/core/hook/hook.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.lighten,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/splash/bg.jpg',
              //'assets/backgroundimg/indian rupees.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white12, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}
