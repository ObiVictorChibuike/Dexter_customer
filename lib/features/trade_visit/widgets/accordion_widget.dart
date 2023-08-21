import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:nettapp/core/app_colors/app_colors.dart';
import 'package:nettapp/core/widgets/text_widget.dart';

class AccordionWidget extends StatelessWidget //__
{
  const AccordionWidget({Key? key}) : super(key: key);

  @override
  build(context) => Accordion(
        headerBackgroundColorOpened: Colors.black54,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: false,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            headerBackgroundColor: AppColors.blue,

            headerBackgroundColorOpened: AppColors.blue,
            header: const TextWidget(
              text: 'Monday',
              color: Colors.white,
              fontSize: 23,
            ),
            content: const SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Jendol",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "New Horizon",
                  )
                ],
              ),
            ),
            contentBackgroundColor: const Color(0xFFEEEEEE),
            contentBorderColor: AppColors.blue,
            contentHorizontalPadding: 0.0,
            contentBorderWidth: 1,

            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            headerBackgroundColor: AppColors.blue,

            headerBackgroundColorOpened: AppColors.blue,
            header: const TextWidget(
              text: 'Tuesday',
              color: Colors.white,
              fontSize: 23,
            ),
            content: const SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Jendol",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "New Horizon",
                  )
                ],
              ),
            ),
            contentBackgroundColor: const Color(0xFFEEEEEE),
            contentBorderColor: AppColors.blue,
            contentHorizontalPadding: 0.0,
            contentBorderWidth: 1,

            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            headerBackgroundColor: AppColors.blue,

            headerBackgroundColorOpened: AppColors.blue,
            header: const TextWidget(
              text: 'Wednesday',
              color: Colors.white,
              fontSize: 23,
            ),
            content: const SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Jendol",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "New Horizon",
                  )
                ],
              ),
            ),
            contentBackgroundColor: const Color(0xFFEEEEEE),
            contentBorderColor: AppColors.blue,
            contentHorizontalPadding: 0.0,
            contentBorderWidth: 1,

            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            headerBackgroundColor: AppColors.blue,

            headerBackgroundColorOpened: AppColors.blue,
            header: const TextWidget(
              text: 'Thursday',
              color: Colors.white,
              fontSize: 23,
            ),
            content: const SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Jendol",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "New Horizon",
                  )
                ],
              ),
            ),
            contentBackgroundColor: const Color(0xFFEEEEEE),
            contentBorderColor: AppColors.blue,
            contentHorizontalPadding: 0.0,
            contentBorderWidth: 1,

            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
          AccordionSection(
            isOpen: false,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            headerBackgroundColor: AppColors.blue,

            headerBackgroundColorOpened: AppColors.blue,
            header: const TextWidget(
              text: 'Friday',
              color: Colors.white,
              fontSize: 23,
            ),
            content: const SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Jendol",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "New Horizon",
                  )
                ],
              ),
            ),
            contentBackgroundColor: const Color(0xFFEEEEEE),
            contentBorderColor: AppColors.blue,
            contentHorizontalPadding: 0.0,
            contentBorderWidth: 1,

            // onOpenSection: () => print('onOpenSection ...'),
            // onCloseSection: () => print('onCloseSection ...'),
          ),
        ],
      );
} //__


