class OnBoardingContent {
  final String title;
  final String description;
  final String image;

  OnBoardingContent({
    required this.title,
    required this.description,
    required this.image,
  });
}

var onBoardingContent = [
  OnBoardingContent(
    title: 'Welcome to GameFlix!',
    description: 'We are excited to bring you the latest and greatest video games right at your fingertips. Our extensive database includes games from all platforms, genres, and publishers. Swipe up and down to browse, tap to learn more, and add your favorites to your list. Let us start playing!',
    image: 'assets/images/fortnite.png',
  ),
  OnBoardingContent(
    title: 'Discover your next favorite game!',
    description: 'GameFlix is your one-stop-shop for discovering new games. Our easy-to-use interface allows you to quickly search and filter games based on your interests. With detailed descriptions, screenshots, and videos, you can make informed decisions about which games to try.',
    image: 'assets/images/thanos.png',
  ),
  OnBoardingContent(
    title: 'Ready to level up?',
    description: "GameFlix, powered by RawG API is your one-stop-shop for all your gaming needs. From console to PC, we've got you covered. Our app allows you to browse and discover games, create your own personalized library, and stay up to date with the latest news and releases. Let's dive in!",
    image: 'assets/images/riot.png',
  ),
];