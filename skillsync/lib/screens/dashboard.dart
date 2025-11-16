import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isConnected = true;
  bool _gpsActive = true;
  int _unitsNearby = 2;

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> _confirmEmergency() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Send Emergency Alert?'),
        content: const Text(
          'This will notify emergency responders with your current status.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Send'),
          ),
        ],
      ),
    );

    if (result == true) {
      _showMessage('Emergency alert sent');
    }
  }




  Widget  _buildDrawer(BuildContext context){

    return Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red.shade600,
                      Colors.red.shade400,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.shield, color: Colors.red, size: 25),
                    ),
                    SizedBox(width: 8,),
                    Text(
                      "SafeCampus",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ]),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.person, color: Colors.blue.shade700, size: 24),
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context , '/profile');
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 4),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.settings, color: Colors.grey.shade700, size: 24),
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.pushNamed(context , "/settings");
                  print("Navigating to Settings page");
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 16),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey.shade200,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.logout, color: Colors.red.shade700, size: 24),
                ),
                title: Text(
                  "LogOut",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.red.shade700,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  print("Logout Button Clicked");
                  Navigator.pushNamed(context , "/signup");
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.shield, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Text(
              'SafeCampus',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ServerStatusCard(
                isConnected: _isConnected,
                onToggle: () => setState(() => _isConnected = !_isConnected),
              ),
              const SizedBox(height: 16),
              _LocationCard(
                gpsActive: _gpsActive,
                unitsNearby: _unitsNearby,
                onGpsToggle: () => setState(() => _gpsActive = !_gpsActive),
              ),
              const SizedBox(height: 16),
              Text(
                'Quick Actions',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              _QuickActionsGrid(
                onAction: (name) => _showMessage('$name tapped'),
              ),
              const SizedBox(height: 20),
              _EmergencyButton(onPressed: _confirmEmergency),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServerStatusCard extends StatelessWidget {
  final bool isConnected;
  final VoidCallback onToggle;

  const _ServerStatusCard({
    required this.isConnected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = isConnected ? Colors.green.shade50 : Colors.red.shade50;
    final Color dot = isConnected ? Colors.green.shade500 : Colors.red.shade500;
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isConnected ? Colors.green.shade100 : Colors.red.shade100,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isConnected
                      ? 'Connected to Emergency Server'
                      : 'Disconnected from Server',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  isConnected
                      ? 'All systems operational'
                      : 'Tap the switch to reconnect',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(
                        color: isConnected
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                      ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                isConnected ? Icons.check_circle : Icons.error,
                color: isConnected ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Switch.adaptive(
                value: isConnected,
                onChanged: (_) => onToggle(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final bool gpsActive;
  final int unitsNearby;
  final VoidCallback onGpsToggle;

  const _LocationCard({
    required this.gpsActive,
    required this.unitsNearby,
    required this.onGpsToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          )
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Location',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: gpsActive ? Colors.blue.shade50 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: gpsActive ? Colors.blue : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          gpsActive ? 'Live' : 'Paused',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: gpsActive ? Colors.blue.shade700 : Colors.grey.shade700,
                              ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Switch.adaptive(value: gpsActive, onChanged: (_) => onGpsToggle()),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 160,
              width: double.infinity,
              color: Colors.blue.shade100,
              alignment: Alignment.center,
              child: Icon(Icons.map_rounded, color: Colors.blue.shade600, size: 48),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16, color: Colors.blueGrey),
                  const SizedBox(width: 6),
                  Text(
                    '$unitsNearby units nearby',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.blueGrey,
                        ),
                  ),
                ],
              ),
              Text(
                gpsActive ? 'GPS Active' : 'GPS Off',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.blueGrey,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  final void Function(String) onAction;
  final List<_QuickAction> actions = const [
    _QuickAction(
      title: 'Voice Message',
      subtitle: 'Record & Send',
      icon: Icons.mic,
      color: Color(0xFF4F8EF7),
    ),
    _QuickAction(
      title: 'Capture Photo',
      subtitle: 'Take Picture',
      icon: Icons.camera_alt,
      color: Color(0xFF8A63F8),
    ),
    _QuickAction(
      title: 'Record Video',
      subtitle: 'Start Recording',
      icon: Icons.videocam_rounded,
      color: Color(0xFFF5A524),
    ),
    _QuickAction(
      title: 'Send Audio',
      subtitle: 'Upload File',
      icon: Icons.headset_mic,
      color: Color(0xFF2BB673),
    ),
  ];

  const _QuickActionsGrid({required this.onAction});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 110,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return _QuickActionCard(action: action, onTap: () => onAction(action.title));
      },
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final _QuickAction action;
  final VoidCallback onTap;

  const _QuickActionCard({required this.action, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: action.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Icon(action.icon, color: action.color, size: 20),
              ),
              const Spacer(),
              Text(
                action.title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                action.subtitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAction {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _QuickAction({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class _EmergencyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _EmergencyButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF5350),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning_rounded),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EMERGENCY',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Tap to send alert',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 