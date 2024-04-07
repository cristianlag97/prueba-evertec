part of features.login.presentation.widgets;

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.image,
    required this.size,
    required this.onTap,
  });

  final String image;
  final double size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            radius: 0.8,
            stops: [0.1, 0.8],
            colors: [colorLightGrayF2, colorLightGrayB0],
          ),
        ),
        child: Transform.scale(
          scale: size,
          child: Image.asset(image),
        ),
      ),
    );
  }
}
