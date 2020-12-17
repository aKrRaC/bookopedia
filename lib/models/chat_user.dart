
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
  name: 'Nick Fury',
  imageUrl: 'assets/images/nick-fury.jpg',
  isOnline: true,
);

// USERS
final User1 ironMan = User1(
  id: 1,
  name: 'Iron Man',
  imageUrl: 'assets/images/ironman.jpeg',
  isOnline: true,
);
final User1 captainAmerica = User1(
  id: 2,
  name: 'Captain America',
  imageUrl: 'assets/images/captain-america.jpg',
  isOnline: true,
);
final User1 hulk = User1(
  id: 3,
  name: 'Hulk',
  imageUrl: 'assets/images/hulk.jpg',
  isOnline: false,
);
final User1 scarletWitch = User1(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: 'assets/images/scarlet-witch.jpg',
  isOnline: false,
);
final User1 spiderMan = User1(
  id: 5,
  name: 'Spider Man',
  imageUrl: 'assets/images/spiderman.jpg',
  isOnline: true,
);
final User1 blackWindow = User1(
  id: 6,
  name: 'Black Widow',
  imageUrl: 'assets/images/black-widow.jpg',
  isOnline: false,
);
final User1 thor = User1(
  id: 7,
  name: 'Thor',
  imageUrl: 'assets/images/thor.png',
  isOnline: false,
);
final User1 captainMarvel = User1(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: 'assets/images/captain-marvel.jpg',
  isOnline: false,
);