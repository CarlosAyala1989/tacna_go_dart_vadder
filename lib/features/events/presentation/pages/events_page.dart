import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  // Estado para controlar el calendario
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Datos de ejemplo. En el futuro, esto vendría de un BLoC.
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2024, 5, 5): ['Día de la Madre'],
    DateTime.utc(2024, 5, 26): ['Batalla del Alto de la Alianza - 1880'],
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  List<String> _getEventsForDay(DateTime day) {
    // Implementación simple para obtener eventos del día
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Efemérides')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendar(),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Eventos', style: TextStyles.heading3),
            ),
            const SizedBox(height: 8),
            ..._buildEventList(), // Usamos el spread operator para añadir los widgets a la columna
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TableCalendar(
        locale: 'es_ES', // Para que los días de la semana salgan en español
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // Actualizamos ambos
          });
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyles.bodyLg.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: AppColors.surface.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildEventList() {
    final eventsForDay = _getEventsForDay(_selectedDay!);
    if (eventsForDay.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Center(
            child: Text(
              'No hay eventos para este día.',
              style: TextStyles.bodyLg,
            ),
          ),
        ),
      ];
    }
    return eventsForDay.map((event) {
      // Separamos año y descripción si es posible
      final parts = event.split(' - ');
      final description = parts[0];
      final year = parts.length > 1 ? parts[1] : '';

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(year, style: TextStyles.bodyLgMedium),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyles.bodySm.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }).toList();
  }
}
