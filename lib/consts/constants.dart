const String NO_IMAGE_AVAILABLE = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png';

List dummyImages = [
  "assets/logo1.png",
  "assets/logo2.png",
  "assets/logo3.png",
  "assets/logo4.png",
  "assets/logo5.png",
];

class ServicesData {
  final String title;
  final String description;

  ServicesData({required this.title, required this.description});
}

List<ServicesData> dummyServiceData = [
  ServicesData(
      title: "Software Development",
      description:
          "App development involves designing, creating, and maintaining software applications for various platforms, including mobile devices and desktops."),
  ServicesData(
      title: "App Development",
      description:
          "App development involves designing, creating, and maintaining software applications for various platforms, including mobile devices and desktops."),
  ServicesData(
      title: "Website Design",
      description:
          "App development involves designing, creating, and maintaining software applications for various platforms, including mobile devices and desktops."),
  ServicesData(
      title: "Content Writing",
      description:
          "App development involves designing, creating, and maintaining software applications for various platforms, including mobile devices and desktops."),
  ServicesData(
      title: "UI UX Design",
      description:
          "App development involves designing, creating, and maintaining software applications for various platforms, including mobile devices and desktops."),
];

class TechnologyData {
  final String title;
  final String image;

  TechnologyData({required this.title, required this.image});
}

List<TechnologyData> dummyTechnologyData = [
  TechnologyData(title: "Web\nDevelopment", image: "assets/web.png"),
  TechnologyData(title: "App\nDevelopment", image: "assets/app.png"),
  TechnologyData(title: "Content\nWriting", image: "assets/writing.png"),
  TechnologyData(title: "UI UX\nDesign", image: "assets/uiux.png"),
  TechnologyData(title: "Blockchain\nDevelopment", image: "assets/blockchain.png"),
];
