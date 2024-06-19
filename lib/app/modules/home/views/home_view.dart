import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mindease/app/modules/home/data/model/allmusic_model.dart';
import 'package:mindease/app/modules/home/data/model/doctor_available_model.dart';
import 'package:mindease/app/modules/home/data/services/allmusic_services.dart';
import 'package:mindease/app/modules/home/data/services/inspirational_stories_services.dart';
import 'package:mindease/app/modules/home/views/components/inspirationalStories_card.dart';
import 'package:mindease/app/routes/app_pages.dart';
import 'package:mindease/constant/constant.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../utils/helper/calendar_icon.dart';
import '../controllers/home_controller.dart';
import 'package:gap/gap.dart';
import '../data/model/inspirational_stories_model.dart';
import '../data/services/doctor_available_services.dart';
import 'components/doctor_card.dart';
import 'components/mood_card.dart';
import 'components/music_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 32),
                child: Column(
                  children: [
                    //app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo Bayu',
                              style: semiBold.copyWith(
                                  fontSize: 24, color: Primary.mainColor),
                            ),
                            const Gap(8),
                            Text(
                              'Temukan ketenangan anda di MindEase',
                              style: regular.copyWith(
                                  fontSize: 12, color: Neutral.dark3),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.NOTIFICATION);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/Bell.svg',
                            width: 24,
                          ),
                        )
                      ],
                    ),
                    const Gap(32),
                    TextFormField(
                      style: light.copyWith(fontSize: 14, color: Neutral.dark3),
                      decoration: searchStyle.copyWith(
                          hintText: 'Temukan yang kamu inginkan',
                          prefixIcon: SvgPicture.asset(
                            'assets/icons/Search.svg',
                            width: 20,
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 50)),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //mood tracker section
                    Text(
                      'Pantau suasana hati anda!',
                      style: semiBold.copyWith(
                          fontSize: 16, color: Primary.mainColor),
                    ),
                    const Gap(10),
                    SizedBox(
                      height: 110,
                      child: GetBuilder<HomeController>(
                        id: 'mood',
                        builder: (controller) => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            final day = controller.daysInWeek[index];
                            final isSelected =
                                controller.selectedDate.isAtSameMomentAs(day);
                            final moodCheck = controller.getMoodForDate(day);
                            final moodColor = moodStatusColor(moodCheck);
                            final icon = moodStatusIconBig(moodCheck);
                            return MoodCard(
                              day: DateFormat.E().format(day), // Mengisi hari
                              date: day.day, // Mengisi tanggal
                              textColor: isSelected
                                  ? Primary.mainColor
                                  : Neutral.dark3,
                              onTap: () {
                                controller.selectDate(day);
                              },
                              icon: icon,
                              iconColor: moodColor,
                              selectedColor: isSelected
                                  ? Primary.mainColor
                                  : Colors.transparent,
                            );
                          },
                        ),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.MOOD_TRACK),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Primary.mainColor),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Yuk Lihat Trackermu!',
                          style: semiBold.copyWith(
                              fontSize: 12, color: Primary.mainColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Gap(20),
                    //carousel section
                    Image.asset('assets/images/carousel.png'),
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Temukan psikiater anda',
                          style: semiBold.copyWith(
                              fontSize: 16, color: Primary.mainColor),
                        ),
                        Text(
                          'Lihat Semua',
                          style: semiBold.copyWith(
                              fontSize: 12, color: Neutral.dark3),
                        )
                      ],
                    ),
                    const Gap(20),
                    //doctor card
                    SizedBox(
                      height: Get.height * 0.28,
                      child: FutureBuilder(
                          future:
                              DoctorAvailableServices().getAvailableDoctor(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DoctorAvailableModel> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              final doctorAvailable = snapshot.data!.data;
                              return Skeletonizer(
                                enabled: snapshot.connectionState ==
                                    ConnectionState.waiting,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: doctorAvailable.length,
                                  itemBuilder: (context, index) {
                                    final doctor = doctorAvailable[index];
                                    return DoctorCard(
                                      imageUrl: doctor.profilePicture ==
                                                  'http://gambar.com' ||
                                              doctor.profilePicture ==
                                                  'ini link fotonya'
                                          ? 'https://www.eyeconsultants.net/wp-content/uploads/2023/10/doctor-happy.jpg'
                                          : doctor.profilePicture,
                                      name: doctor.name,
                                      experience: '${doctor.experience} tahun',
                                      rating: '4.5',
                                    );
                                  },
                                ),
                              );
                            }
                          }),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Explor lebih ketenangan',
                          style: semiBold.copyWith(
                              fontSize: 16, color: Primary.mainColor),
                        ),
                        Text(
                          'Lihat Semua',
                          style: semiBold.copyWith(
                              fontSize: 12, color: Neutral.dark3),
                        )
                      ],
                    ),
                    FutureBuilder(
                      future: AllmusicServices().getAllMusic(),
                      builder: (BuildContext context,
                          AsyncSnapshot<AllMusicModel> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          final allMusic = snapshot.data!.data;
                          return Skeletonizer(
                            enabled: snapshot.connectionState ==
                                ConnectionState.waiting,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: allMusic.length,
                              itemBuilder: (context, index) {
                                final music = allMusic[index];
                                return MusicCard(
                                  title: music.title,
                                  singer: music.singer,
                                  imageUrl: music.imageUrl ==
                                          'http://gambar.com'
                                      ? 'https://i.discogs.com/BDWHa9KIT-GGjYXnfU35Q5AHMLRmIXzAGbhI0nROKAc/rs:fit/g:sm/q:90/h:535/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTc2MTIw/Mi0xNTAwNzE0MzIx/LTk4NDIuanBlZw.jpeg'
                                      : music.imageUrl,
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                    const Gap(8),
                    FutureBuilder(
                        future: InspirationalStoriesServices().getStories(),
                        builder: (BuildContext context,
                            AsyncSnapshot<AllStories> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            final inspirationalStories = snapshot.data!.data;
                            return Skeletonizer(
                              enabled: snapshot.connectionState ==
                                  ConnectionState.waiting,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: inspirationalStories.length,
                                itemBuilder: (context, index) {
                                  final stories = inspirationalStories[index];
                                  return InspirationalstoriesCard(
                                    image: stories.imageUrl ==
                                            'http://gambar.com'
                                        ? '"https://cdn-2.tstatic.net/bali/foto/bank/images/ilustrasi-meditasi.jpg"'
                                        : stories.imageUrl,
                                    title: stories.title,
                                    author: stories.doctor.name,
                                    time:
                                        DateFormat.yMMMd().format(stories.date),
                                  );
                                },
                              ),
                            );
                          }
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'therapy',
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {
          Get.toNamed(Routes.AI_CHAT);
        },
        child: SvgPicture.asset('assets/icons/HeadsetMic.svg'),
      ),
    );
  }
}
