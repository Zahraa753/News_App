import 'package:docdoc/core/customs/custom_button.dart';
import 'package:docdoc/core/customs/custom_text_field.dart';
import 'package:docdoc/core/styles/colors.dart';
import 'package:docdoc/pages/doctors_detail/logic/doctor_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DoctorDetailsProvider>(
        builder: (context, provider, _) {
          if (provider.doctor == null) {
            return Center(child: CircularProgressIndicator());
          }
          final doctor = provider.doctor!;
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              spacing: 16,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        width: 80,
                        height: 80,
                        imageUrl:
                            'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorCore.cl1,
                          ),
                        ),
                        Text(
                          '${doctor.specialization.name} | ${doctor.degree}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorCore.cl1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TabBar(
                  dividerColor: ColorCore.cl1,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  onTap: (index) {
                    provider.changeIndex(index);
                  },
                  unselectedLabelStyle: TextStyle(
                    color: ColorCore.cl1,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: 'About'),
                    Tab(text: 'Location'),
                  ],
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      provider.getDoctorDetails(doctor.id);
                    },
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        width: double.infinity,
                        child: provider
                            .doctorDetailsScreens[provider.currentIndex],
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.all(10),
                          title: Text(
                            'Make An Appointment',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10,
                            children: [
                              CustomTextFormField(
                                controller: provider.startTimeController,
                                label: 'Start Time',
                                ontap: () async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (time != null) {
                                    provider.startTimeController.text = time
                                        .format(context);
                                  }
                                },
                              ),
                              CustomTextFormField(
                                controller: provider.notesController,
                                hint: 'Notes',
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancel',
                                      color: Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                    child: PrimaryButton(
                                      onPressed: () {
                                        provider.storeAppointment(context);
                                      },
                                      text: 'Book',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  text: 'Make An Appointment',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
