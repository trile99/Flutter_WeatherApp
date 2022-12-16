class EnvironmentalAttribute {
  EnvironmentalAttribute.development() : apiUrl = 'https://v2.jokeapi.dev/';

  EnvironmentalAttribute.staging() : apiUrl = '';

  EnvironmentalAttribute.production() : apiUrl = '';

  final String apiUrl;
}
