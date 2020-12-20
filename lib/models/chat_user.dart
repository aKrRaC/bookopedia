
class User1 {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User1({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User1 currentUser = User1(
  id: 0,
  name: 'Test User',
  imageUrl: 'assets/images/pic.png',
  isOnline: true,
);

// USERS
final User1 test1 = User1(
  id: 1,
  name: 'Test 1',
  imageUrl: 'assets/images/pic.png',
  isOnline: true,
);
final User1 test2 = User1(
  id: 2,
  name: 'Test 2',
  imageUrl: 'assets/images/pic.png',
  isOnline: true,
);