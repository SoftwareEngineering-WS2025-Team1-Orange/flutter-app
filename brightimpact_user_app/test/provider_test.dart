import 'package:bright_impact/state/entity_provider/ngo_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bright_impact/state/app_state.dart';


void main() {
  // Binding initialisieren
  TestWidgetsFlutterBinding.ensureInitialized();

  late NgoProvider ngoProvider;
  late AppState appState;

  setUp(() async {
    // Mock für SharedPreferences bereitstellen
    SharedPreferences.setMockInitialValues({});

    // AppState initialisieren und Login simulieren
    appState = AppState();
    await appState.login("john@gmx.de", "Blablabla!0");

    // NGOProvider initialisieren
    ngoProvider = NgoProvider(donatorId: 1);
  });

  group("NgoProvider", () {
    test("fetches NGO entity with id 1 for donatorId 1", () async {
      try {
        // ID setzen und NGO laden
        await ngoProvider.setIdAndFetch(1);

        // Prüfen, ob das Laden erfolgreich war
        if (ngoProvider.loadingError != null) {
          fail("Loading error: ${ngoProvider.loadingError}");
        }

        // Prüfen, ob die NGO-Daten korrekt geladen wurden
        final ngo = ngoProvider.entity;
        expect(ngo, isNotNull, reason: "NGO entity should not be null");
        expect(ngo!.id, equals(1), reason: "NGO ID should be 1");
        print("Fetched NGO: ${ngo.name}");
      } catch (e) {
        fail("Test failed with exception: $e");
      }
    });
  });
}
