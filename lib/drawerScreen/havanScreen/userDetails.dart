import 'package:flutter/material.dart';

class Userdetails extends StatefulWidget {
  final String name;
  final String address;
  final String mobileNumber;
  final String havanDate;
  final int totalHavan;
  final List trass;

  const Userdetails({
    super.key,
    required this.name,
    required this.address,
    required this.mobileNumber,
    required this.havanDate,
    required this.totalHavan,
    required this.trass,
  });

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'वापरकर्ता तपशील',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              _buildDetailRow('नाव:', widget.name),
          
              // Address
              _buildDetailRow('पत्ता:', widget.address),
          
              // Mobile Number
              _buildDetailRow('फोन नंबर:', widget.mobileNumber),
          
              // Havan Date
              _buildDetailRow('हवन तारीख:', widget.havanDate),
          
              // Total Havan
              // _buildDetailRow('एकूण हवन:', widget.totalHavan.toString()),
          
              // Problems/Trass
              const SizedBox(height: 8),
              const Text(
                'होणारा त्रास:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...widget.trass.map(
                    (trass) => Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    '- $trass',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// A helper widget to build a row of details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
