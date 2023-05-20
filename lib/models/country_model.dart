class Country {
  Country(this.name, this.domain);
  final String name;
  final String domain;
}

Country unitedArabEmirates = Country("United Arab Emirates", "ae");
Country switzerland = Country("Switzerland", "ch");
Country russia = Country("Россия", "ru");
Country india = Country("India", "in");
Country unitedStates = Country("United States", "us");
Country korea = Country("Korea", "kr");
Country turkey = Country("Türkiye", "tr");
Country ukraine = Country("Українф", "ua");
Country italy = Country("Italy", "it");

Set<Country> countries = {
  unitedArabEmirates,
  switzerland,
  russia,
  india,
  unitedArabEmirates,
  korea,
  turkey,
  ukraine,
  italy,
};
