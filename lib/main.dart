import 'package:flutter/material.dart';

import 'pages/home/home_screen.dart';
import 'pages/publish/publish_screen.dart';
import 'pages/profile/profile_screen.dart';
import 'pages/notifications/notifications_screen.dart';
import 'pages/trips/trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoStudy',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF4B32E3),
          secondary: Color(0xFF7D3CFF),
          background: Colors.white,
        ),
      ),
      routes: {
        '/': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
        '/notifications': (_) => const NotificationsScreenWidget(),
      },
      initialRoute: '/',
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3921A3),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF4236D6), Color(0xFF9E3CFF)],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.school, color: Colors.white, size: 34),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'GoStudy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Covoiturage Interuniversitaire\nISSTM Mahajanga',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Connexion',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: 'Email étudiant',
                            hintText: 'votre.nom@isstm.mg',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF4F6FF),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline),
                            labelText: 'Mot de passe',
                            hintText: '••••••••',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF4F6FF),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: const Color(0xFF5D4BFF),
                          ),
                          child: const Text('Se connecter', style: TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(height: 14),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Pas encore de compte ? S’inscrire'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    'Réservé aux étudiants ISSTM uniquement',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    const HomeScreenWidget(),
    const PublishScreenWidget(),
    const ProfileScreenWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 12,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavItem(
                icon: Icons.home_filled,
                label: 'Accueil',
                selected: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
              ),
              _NavItem(
                icon: Icons.add_circle_outline,
                label: 'Publier',
                selected: _selectedIndex == 1,
                onTap: () => _onItemTapped(1),
              ),
              const SizedBox(width: 48),
              _NavItem(
                icon: Icons.person_outline,
                label: 'Profil',
                selected: _selectedIndex == 2,
                onTap: () => _onItemTapped(2),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(1),
        backgroundColor: const Color(0xFF4B32E3),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF4B32E3) : Colors.grey;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4B32E3), Color(0xFF7D3CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'GoStudy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pushNamed(context, '/notifications'),
                          icon: const Icon(Icons.notifications_none, color: Colors.white),
                        ),
                        const SizedBox(width: 6),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person_outline, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text(
                  'Bonjour, Jean 👋',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Rechercher un trajet...',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA0FB)),
                    hintText: 'Rechercher un trajet...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Publier'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF4B32E3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_month, size: 18),
                        label: const Text('Mes trajets'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7D3CFF),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Trajets récents', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Voir tout', style: TextStyle(color: Color(0xFF4B32E3), fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        RideCard(
                          driverName: 'Jean Rakoto',
                          rating: 4.8,
                          trips: 24,
                          departure: 'Campus ISSTM',
                          destination: 'Centre-ville Mahajanga',
                          date: '23 mai',
                          time: '14:30',
                          seats: 3,
                          duration: '15 min',
                          price: '2000 Ar',
                        ),
                        SizedBox(height: 16),
                        RideCard(
                          driverName: 'Marie Ravelo',
                          rating: 5.0,
                          trips: 18,
                          departure: 'Résidence Universitaire',
                          destination: 'Campus ISSTM',
                          date: '23 mai',
                          time: '07:00',
                          seats: 2,
                          duration: '10 min',
                          price: '1500 Ar',
                        ),
                        SizedBox(height: 16),
                        RideCard(
                          driverName: 'Paul Andria',
                          rating: 4.6,
                          trips: 31,
                          departure: 'Gare routière',
                          destination: 'Campus ISSTM',
                          date: '24 mai',
                          time: '09:15',
                          seats: 4,
                          duration: '20 min',
                          price: '2500 Ar',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PublishTab extends StatelessWidget {
  const PublishTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4B32E3), Color(0xFF7D3CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Publier', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Créer un trajet rapide pour ISSTM.', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Nouveau trajet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const Text('Remplissez les détails du trajet puis appuyez sur Publier.', style: TextStyle(color: Colors.black54, fontSize: 14)),
                  const SizedBox(height: 22),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Point de départ',
                      filled: true,
                      fillColor: const Color(0xFFF4F6FF),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Destination',
                      filled: true,
                      fillColor: const Color(0xFFF4F6FF),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Heure',
                      filled: true,
                      fillColor: const Color(0xFFF4F6FF),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4B32E3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Publier mon trajet'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4B32E3), Color(0xFF7D3CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profil', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Vos informations et vos trajets récents.', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFECEAFE),
                        child: Icon(Icons.person, size: 30, color: Color(0xFF4B32E3)),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jean Rakoto', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Étudiant ISSTM • 24 voyages', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Email', style: TextStyle(color: Colors.black54, fontSize: 12)),
                  SizedBox(height: 4),
                  Text('jean.rakoto@isstm.mg', style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 14),
                  Text('Téléphone', style: TextStyle(color: Colors.black54, fontSize: 12)),
                  SizedBox(height: 4),
                  Text('+261 34 12 345 67', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RideCard extends StatelessWidget {
  const RideCard({
    super.key,
    required this.driverName,
    required this.rating,
    required this.trips,
    required this.departure,
    required this.destination,
    required this.date,
    required this.time,
    required this.seats,
    required this.duration,
    required this.price,
  });

  final String driverName;
  final double rating;
  final int trips;
  final String departure;
  final String destination;
  final String date;
  final String time;
  final int seats;
  final String duration;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFFEEF0FF),
                child: Icon(Icons.person, color: Color(0xFF4B32E3)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(driverName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFC107), size: 16),
                      const SizedBox(width: 4),
                      Text('$rating • $trips voyages', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(price, style: const TextStyle(color: Color(0xFF2A4EDE), fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          const SizedBox(height: 18),
          _TripPoint(label: departure, color: Colors.green),
          const SizedBox(height: 10),
          _TripPoint(label: destination, color: Colors.red),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16, color: Colors.black54),
                  const SizedBox(width: 6),
                  Text('$date • $time', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.event_seat, size: 16, color: Colors.black54),
                  const SizedBox(width: 6),
                  Text('$seats places', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                  const SizedBox(width: 12),
                  const Icon(Icons.access_time, size: 16, color: Colors.black54),
                  const SizedBox(width: 6),
                  Text(duration, style: const TextStyle(color: Colors.black54, fontSize: 13)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TripPoint extends StatelessWidget {
  const _TripPoint({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        ),
      ],
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.black87),
                      ),
                      const SizedBox(width: 6),
                      const Text('Notifications', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Tout marquer comme lu'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('3 non lues', style: TextStyle(color: Colors.black54)),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  NotificationCard(
                    icon: Icons.directions_car,
                    title: 'Nouvelle réservation',
                    subtitle: 'Marie Ravelo a réservé 2 places pour votre trajet Campus → Centre-ville',
                    date: '22 mai',
                    unread: true,
                  ),
                  SizedBox(height: 12),
                  NotificationCard(
                    icon: Icons.star_border,
                    title: 'Nouvel avis',
                    subtitle: 'Paul Andria vous a laissé un avis 5 étoiles',
                    date: '22 mai',
                    unread: true,
                  ),
                  SizedBox(height: 12),
                  NotificationCard(
                    icon: Icons.alarm,
                    title: 'Rappel de trajet',
                    subtitle: 'Votre trajet vers le Centre-ville commence dans 2 heures',
                    date: '22 mai',
                    unread: true,
                  ),
                  SizedBox(height: 12),
                  NotificationCard(
                    icon: Icons.check_circle,
                    title: 'Réservation confirmée',
                    subtitle: 'Jean Rakoto a confirmé votre réservation pour demain 14h30',
                    date: '21 mai',
                    unread: false,
                  ),
                  SizedBox(height: 12),
                  NotificationCard(
                    icon: Icons.close,
                    title: 'Trajet annulé',
                    subtitle: 'Le conducteur a annulé le trajet Résidence → Campus du 24 mai',
                    date: '21 mai',
                    unread: false,
                  ),
                  SizedBox(height: 12),
                  NotificationCard(
                    icon: Icons.chat_bubble_outline,
                    title: 'Nouveau message',
                    subtitle: 'Sophie Lanto vous a envoyé un message concernant votre trajet',
                    date: '20 mai',
                    unread: false,
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.unread,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String date;
  final bool unread;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE8E9F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFF4F6FF),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF4B32E3)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
                const SizedBox(height: 10),
                Text(date, style: const TextStyle(color: Colors.black38, fontSize: 12)),
              ],
            ),
          ),
          if (unread)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(color: Color(0xFF4B32E3), shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }
}
