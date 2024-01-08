import 'package:events/features/data/model/speaker.dart';
import 'package:faker/faker.dart';

import 'event.dart';

final List<String> categories = [
  'all',
  'art',
  'tech',
  'design',
  'movies',
  'business',
];

List<Event> generateEvents = [
  Event(
    image: 'assets/imgs/city/st_petersburg.jpg',
    startDate: "15 jun 2023",
    endDate: '16 jun 2023',
    name: 'DevOpsDay Birmingham 2023',
    location: 'Saint-Petersburg',
    cost: '2400',
    discountCost: null,
    speakers: speakers,
    description: faker.lorem.sentences(40).join(' '),
  ),
  Event(
    image: 'assets/imgs/city/moscow.jpg',
    startDate: "20 jun 2023",
    endDate: '22 jun 2023',
    name: 'Flutter Conference',
    location: 'Moscow',
    cost: '1500',
    discountCost: '120',
    speakers: speakers.sublist(0, 3),
    description: faker.lorem.sentences(30).join(' '),
  ),
  Event(
    image: 'assets/imgs/city/kazan.jpg',
    startDate: "25 feb 2023",
    endDate: '26 feb 2023',
    name: 'AI Summit',
    location: 'Kazan',
    cost: '3000',
    discountCost: '250',
    speakers: speakers.sublist(3, 5),
    description: faker.lorem.sentences(20).join(' '),
  ),
  Event(
    image: 'assets/imgs/city/nizhny_novgorod.jpg',
    startDate: "5 march 2023",
    endDate: null,
    name: 'Web Development Summit',
    location: 'Nizhny Novgorod',
    cost: '1800',
    discountCost: '150',
    speakers: speakers.sublist(5, 8),
    description: faker.lorem.sentences(40).join(' '),
  ),
  Event(
    image: 'assets/imgs/city/ekaterinburg.jpg',
    startDate: "10 jul 2023",
    endDate: '12 jul 2023',
    name: 'Data Science Expo',
    location: 'Ekaterinburg',
    cost: '2800',
    discountCost: null,
    speakers: speakers.sublist(1, 5),
    description: faker.lorem.sentences(40).join(' '),
  ),
  Event(
    image: 'assets/imgs/city/kaliningrad.jpg',
    startDate: "25 jul 2023",
    endDate: '27 jul 2023',
    name: 'Mobile App Workshop',
    location: 'Kaliningrad',
    cost: '1200',
    discountCost: '90',
    speakers: speakers.sublist(0, 4),
    description: faker.lorem.sentences(50).join(' '),
  ),
  Event(
    image: 'assets/imgs/city/arkhangelsk.jpg',
    startDate: "20 aug 2023",
    endDate: '22 aug 2023',
    name: 'Blockchain Summit',
    location: 'Arkhangelsk',
    cost: '3200',
    discountCost: '280',
    speakers: speakers.sublist(0, 6),
    description: faker.lorem.sentences(40).join(' '),
  ),
  Event(
    image: 'assets/imgs/city/sochi.jpg',
    startDate: "25 aprl 2023",
    endDate: '27 aprl 2023',
    name: 'UX/UI Design Conference',
    location: 'Soshi',
    cost: '2000',
    discountCost: null,
    speakers: speakers.sublist(5, 8),
    description: faker.lorem.sentences(47).join(' '),
  ),
];
List<Speaker> speakers = const [
  Speaker(
    name: 'John Smith',
    profession: 'Mobile App Developer',
    imagePath: 'assets/imgs/photos/people1.jpg',
    bio: 'Experienced mobile app developer with a focus on Flutter and Dart.',
  ),
  Speaker(
    name: 'Alice Johnson',
    profession: 'Web Developer',
    imagePath: 'assets/imgs/photos/people4.jpg',
    bio: 'Passionate web developer specializing in front-end technologies.',
  ),
  Speaker(
    name: 'Bob Brown',
    profession: 'Data Scientist',
    imagePath: 'assets/imgs/photos/people2.jpg',
    bio:
        'Data scientist with expertise in machine learning and data analytics.',
  ),
  Speaker(
    name: 'Eva White',
    profession: 'Game Developer',
    imagePath: 'assets/imgs/photos/people5.jpg',
    bio: 'Creative game developer with a background in Unity and game design.',
  ),
  Speaker(
    name: 'Michael Lee',
    profession: 'AI Engineer',
    imagePath: 'assets/imgs/photos/people3.jpg',
    bio:
        'AI engineer specializing in natural language processing and deep learning.',
  ),
  Speaker(
    name: 'Sophia Rodriguez',
    profession: 'UX/UI Designer',
    imagePath: 'assets/imgs/photos/people7.jpg',
    bio: 'Creative UX/UI designer with a passion for user-centered design.',
  ),
  Speaker(
    name: 'Daniel Harris',
    profession: 'Blockchain Developer',
    imagePath: 'assets/imgs/photos/people6.jpg',
    bio: 'Blockchain developer specializing in smart contract development.',
  ),
  Speaker(
    name: 'Olivia Martinez',
    profession: 'Cybersecurity Expert',
    imagePath: 'assets/imgs/photos/people8.jpg',
    bio:
        'Cybersecurity expert with experience in network security and threat analysis.',
  ),
  Speaker(
    name: 'Emma Clark',
    profession: 'Augmented Reality Developer',
    imagePath: 'assets/imgs/photos/people9.jpg',
    bio:
        'Innovative AR developer exploring the possibilities of augmented reality.',
  ),
];
