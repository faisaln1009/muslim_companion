import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/prayer_provider.dart';


class PrayerScreen extends StatefulWidget {

  const PrayerScreen({super.key});


  @override
  State<PrayerScreen> createState() => _PrayerScreenState();

}


class _PrayerScreenState extends State<PrayerScreen> {


  @override
  void initState() {

    super.initState();


    Future.microtask(() {

      if (!mounted) return;


      context
          .read<PrayerProvider>()
          .loadPrayerTimes();

    });

  }



  @override
  Widget build(BuildContext context) {


    final provider = context.watch<PrayerProvider>();


    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Prayer Times",
        ),

        backgroundColor: Colors.green,

      ),


      body: provider.isLoading

          ? const Center(

        child: CircularProgressIndicator(),

      )


          : provider.prayerModel == null

          ? const Center(

        child: Text(
          "No Prayer Data Found",
        ),

      )


          : ListView(

        padding: const EdgeInsets.all(16),


        children: [


          prayerTile(
            "Fajr",
            provider.prayerModel!.fajr,
          ),


          prayerTile(
            "Sunrise",
            provider.prayerModel!.sunrise,
          ),


          prayerTile(
            "Dhuhr",
            provider.prayerModel!.dhuhr,
          ),


          prayerTile(
            "Asr",
            provider.prayerModel!.asr,
          ),


          prayerTile(
            "Maghrib",
            provider.prayerModel!.maghrib,
          ),


          prayerTile(
            "Isha",
            provider.prayerModel!.isha,
          ),


        ],

      ),

    );

  }




  Widget prayerTile(
      String title,
      String time,
      ) {


    return Card(


      margin: const EdgeInsets.only(
        bottom: 12,
      ),


      child: ListTile(


        leading: const Icon(

          Icons.access_time,

          color: Colors.green,

        ),


        title: Text(title),


        trailing: Text(

          time,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),


      ),

    );

  }


}