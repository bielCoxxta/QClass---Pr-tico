enum FlavorsType {
  prod(title: 'QClass Prático', name: 'prod'),
  dev(title: 'QClass Prático DEV', name: 'dev');

  const FlavorsType({required this.title, required this.name});
  final String name;
  final String title;

  static FlavorsType? selectedType;
}
