import 'package:flutter/material.dart';
import 'package:hekkathon/consts/colors.dart';
import 'package:hekkathon/consts/dimensions.dart';
import 'package:hekkathon/widgets/app_bar_container.dart';
import 'package:hekkathon/widgets/button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateScreen extends StatelessWidget {
  static const routeName = '/screens/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: "Select date",
      child: Column(
        children: [
          SizedBox(height: kMediumPadding * 1.5),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              } else {
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          ButtonWidget(
            title: "Select",
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: "Cancel",
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
        ],
      ),
    );
  }
}
