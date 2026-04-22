import 'package:flutter/material.dart';

void main() {
  runApp(const AnaComparisonApp());
}

class AnaComparisonApp extends StatelessWidget {
  const AnaComparisonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comparación ANA: IFI vs ELISA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E5BFF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const ComparisonScreen(),
    );
  }
}

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparación: ANA por IFI vs ELISA'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const IntroCard(),
          const SizedBox(height: 24),
          Text(
            'Comparación Detallada',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const ComparisonItem(
            title: 'Concepto y Principio',
            icon: Icons.science,
            ifiText:
                'Considerado el "Patrón de Oro" (Gold Standard). Detecta anticuerpos uniéndose a células HEp-2 en un portaobjetos, los cuales son visualizados a través de un microscopio de fluorescencia.',
            elisaText:
                'Ensayo en fase sólida. Utiliza antígenos específicos (purificados o recombinantes) fijados a los pocillos de una placa de laboratorio.',
          ),
          const ComparisonItem(
            title: 'Resultados Reportados',
            icon: Icons.assignment,
            ifiText:
                'Proporciona un Título (ej. 1:160) y un Patrón de fluorescencia (Homogéneo, Moteado, Centromérico, etc.) que orienta fuertemente el diagnóstico clínico.',
            elisaText:
                'Proporciona un valor numérico cuantitativo o semicuantitativo (ej. UI/mL). Reporta un resultado positivo/negativo para antígenos específicos.',
          ),
          const ComparisonItem(
            title: 'Sensibilidad vs Especificidad',
            icon: Icons.analytics,
            ifiText:
                'Alta sensibilidad para un amplio espectro de autoanticuerpos, ideal para tamizaje. Menor especificidad (puede dar falsos positivos en población sana).',
            elisaText:
                'Alta especificidad para los anticuerpos que incluye el kit. Menor sensibilidad global como tamizaje inicial, ya que no detectará anticuerpos contra antígenos ausentes en la placa.',
          ),
          const ComparisonItem(
            title: 'Automatización e Interpretación',
            icon: Icons.precision_manufacturing,
            ifiText:
                'Lectura manual, laboriosa y altamente subjetiva. Requiere personal técnico muy experimentado para interpretar los patrones visuales de manera correcta.',
            elisaText:
                'Proceso altamente automatizable, lectura objetiva mediante equipos (espectrofotómetro), permitiendo procesar grandes volúmenes de muestras rápidamente.',
          ),
          const ComparisonItem(
            title: 'Utilidad Clínica Ideal',
            icon: Icons.medical_services,
            ifiText:
                'Prueba de tamizaje (screening) inicial de elección para enfermedades autoinmunes sistémicas como Lupus, Sjögren o Esclerodermia.',
            elisaText:
                'Ideal como prueba confirmatoria para identificar anticuerpos específicos (perfil ENA) después de tener un IFI positivo.',
          ),
        ],
      ),
    );
  }
}

class IntroCard extends StatelessWidget {
  const IntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Anticuerpos Antinucleares (ANA)',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Los ANA son biomarcadores utilizados en el diagnóstico de enfermedades autoinmunes (como Lupus Eritematoso Sistémico, Síndrome de Sjögren, etc.). '
              'Existen dos métodos principales para su detección en el laboratorio: IFI y ELISA. A continuación, exploramos sus principales diferencias científicas y técnicas.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComparisonItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String ifiText;
  final String elisaText;

  const ComparisonItem({
    super.key,
    required this.title,
    required this.icon,
    required this.ifiText,
    required this.elisaText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                children: [
                  Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            // Body
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IFI (Inmunofluorescencia)',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ifiText,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Theme.of(context).dividerColor.withOpacity(0.1),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ELISA (Fase Sólida)',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            elisaText,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 13, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
