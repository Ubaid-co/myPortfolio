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
  final String image;

  ServicesData({required this.title, required this.description, required this.image});
}

List<ServicesData> dummyServiceData = [
  ServicesData(
      title: "Android Applications",
      description:
          "Crafting seamless Android experiences with a blend of innovation and functionality. My apps are designed to be user-centric, ensuring fluid performance and intuitive interfaces.",
  image: "assets/app.png"),
  ServicesData(
      title: "IOS Applications",
      description:
          "Delivering polished iOS applications that shine on every device. My focus is on creating elegant and robust solutions that elevate the user experience to new heights.",
  image: "assets/app.png"),
  ServicesData(
      title: "Desktop Applications",
      description:
          "Creating desktop applications that are reliable, efficient, and visually appealing. My goal is to provide solutions that enhance productivity and user engagement.",
  image: "assets/desktop.png"),
  ServicesData(
      title: "MacOs Applications",
      description:
          "Developing macOS applications that are not only powerful but also beautifully integrated with the ecosystem. I bring a touch of finesse to every desktop solution I create.",
  image: "assets/desktop.png"),
  ServicesData(
      title: "Web Applications",
      description:
          "Building responsive and dynamic web applications that captivate users. My web solutions are crafted to offer seamless interactions and exceptional performance across all browsers.",
  image: "assets/web.png"),
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
