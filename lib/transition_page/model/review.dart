class Review {
  final String username;
  final String urlImage;
  final String date;
  final String description;

  Review({
    required this.username,
    required this.urlImage,
    required this.date,
    required this.description,
  });
}

class Reviews {
  static List<Review> allReviews = [
    Review(
      date: 'FEB 14th',
      username: 'Michael Scoffield',
      urlImage: 'assets/transitionlocation/user1.png',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'JAN 24th',
      username: 'Daniel Kraig',
      urlImage: 'assets/transitionlocation/user2.png',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'MAR 18th',
      username: 'Amanda Linn',
      urlImage: 'assets/transitionlocation/user3.png',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'AUG 15th',
      username: 'Kim Wexler',
      urlImage: 'assets/transitionlocation/user4.png',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
  ];
}
