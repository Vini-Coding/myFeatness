import 'package:hive/hive.dart';

class FirstEntryAdapter {
  static const String _boxName = 'appSettings';
  static const String _isFirstEntryKey = 'isFirstEntry';

  // Inicializar a caixa do Hive
  static Future<void> initSettings() async {
    await Hive.openBox(_boxName);
  }

  // Verificar se é a primeira vez que o app é aberto
  static Future<bool> isFirstEntry() async {
    var box = Hive.box(_boxName);

    // Usar o valor padrão 'true' para garantir que o tipo retornado seja 'bool'
    bool isFirstEntry = box.get(_isFirstEntryKey, defaultValue: true) as bool;

    // Se for a primeira vez, salvar como false para não exibir novamente
    if (isFirstEntry) {
      await box.put(_isFirstEntryKey, false);
    }

    return isFirstEntry;
  }
}
