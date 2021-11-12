import 'package:app/ui/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavigationTypes {
  static const int home = 0;
  static const int reports = 1;
  static const int requests = 2;
  static const int profile = 3;
}

class _NavigationIcons {
  static const String homeActive =
      '<svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2 10.25C1.59 10.25 1.25 9.91 1.25 9.5V7C1.25 4.1 3.61 1.75 6.5 1.75H9C9.41 1.75 9.75 2.09 9.75 2.5C9.75 2.91 9.41 3.25 9 3.25H6.5C4.43 3.25 2.75 4.93 2.75 7V9.5C2.75 9.91 2.41 10.25 2 10.25Z" fill="#52AA63"/><path d="M22 10.25C21.59 10.25 21.25 9.91 21.25 9.5V7C21.25 4.93 19.57 3.25 17.5 3.25H15C14.59 3.25 14.25 2.91 14.25 2.5C14.25 2.09 14.59 1.75 15 1.75H17.5C20.39 1.75 22.75 4.1 22.75 7V9.5C22.75 9.91 22.41 10.25 22 10.25Z" fill="#52AA63"/><path d="M17.5 23.25H16C15.59 23.25 15.25 22.91 15.25 22.5C15.25 22.09 15.59 21.75 16 21.75H17.5C19.57 21.75 21.25 20.07 21.25 18V16.5C21.25 16.09 21.59 15.75 22 15.75C22.41 15.75 22.75 16.09 22.75 16.5V18C22.75 20.9 20.39 23.25 17.5 23.25Z" fill="#52AA63"/><path d="M9 23.25H6.5C3.61 23.25 1.25 20.9 1.25 18V15.5C1.25 15.09 1.59 14.75 2 14.75C2.41 14.75 2.75 15.09 2.75 15.5V18C2.75 20.07 4.43 21.75 6.5 21.75H9C9.41 21.75 9.75 22.09 9.75 22.5C9.75 22.91 9.41 23.25 9 23.25Z" fill="#52AA63"/><path d="M9 5.75H7C5.86 5.75 5.25 6.35 5.25 7.5V9.5C5.25 10.65 5.86 11.25 7 11.25H9C10.14 11.25 10.75 10.65 10.75 9.5V7.5C10.75 6.35 10.14 5.75 9 5.75Z" fill="#52AA63"/><path d="M17 5.75H15C13.86 5.75 13.25 6.35 13.25 7.5V9.5C13.25 10.65 13.86 11.25 15 11.25H17C18.14 11.25 18.75 10.65 18.75 9.5V7.5C18.75 6.35 18.14 5.75 17 5.75Z" fill="#52AA63"/><path d="M9 13.75H7C5.86 13.75 5.25 14.35 5.25 15.5V17.5C5.25 18.65 5.86 19.25 7 19.25H9C10.14 19.25 10.75 18.65 10.75 17.5V15.5C10.75 14.35 10.14 13.75 9 13.75Z" fill="#52AA63"/><path d="M17 13.75H15C13.86 13.75 13.25 14.35 13.25 15.5V17.5C13.25 18.65 13.86 19.25 15 19.25H17C18.14 19.25 18.75 18.65 18.75 17.5V15.5C18.75 14.35 18.14 13.75 17 13.75Z" fill="#52AA63"/></svg>';
  static const String homeInactive =
      '<svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2 9.5V7C2 4.51 4.01 2.5 6.5 2.5H9" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M15 2.5H17.5C19.99 2.5 22 4.51 22 7V9.5" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M22 16.5V18C22 20.49 19.99 22.5 17.5 22.5H16" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M9 22.5H6.5C4.01 22.5 2 20.49 2 18V15.5" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M10.5 7.5V9.5C10.5 10.5 10 11 9 11H7C6 11 5.5 10.5 5.5 9.5V7.5C5.5 6.5 6 6 7 6H9C10 6 10.5 6.5 10.5 7.5Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M18.5 7.5V9.5C18.5 10.5 18 11 17 11H15C14 11 13.5 10.5 13.5 9.5V7.5C13.5 6.5 14 6 15 6H17C18 6 18.5 6.5 18.5 7.5Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M10.5 15.5V17.5C10.5 18.5 10 19 9 19H7C6 19 5.5 18.5 5.5 17.5V15.5C5.5 14.5 6 14 7 14H9C10 14 10.5 14.5 10.5 15.5Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M18.5 15.5V17.5C18.5 18.5 18 19 17 19H15C14 19 13.5 18.5 13.5 17.5V15.5C13.5 14.5 14 14 15 14H17C18 14 18.5 14.5 18.5 15.5Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';
  static const String reportsActive =
      '<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.69 2.60889H8.31C4.67 2.60889 2.5 4.77889 2.5 8.41889V16.7889C2.5 20.4389 4.67 22.6089 8.31 22.6089H16.68C20.32 22.6089 22.49 20.4389 22.49 16.7989V8.41889C22.5 4.77889 20.33 2.60889 16.69 2.60889ZM8.13 18.7589C8.13 19.1689 7.79 19.5089 7.38 19.5089C6.97 19.5089 6.63 19.1689 6.63 18.7589V16.6889C6.63 16.2789 6.97 15.9389 7.38 15.9389C7.79 15.9389 8.13 16.2789 8.13 16.6889V18.7589ZM13.25 18.7589C13.25 19.1689 12.91 19.5089 12.5 19.5089C12.09 19.5089 11.75 19.1689 11.75 18.7589V14.6089C11.75 14.1989 12.09 13.8589 12.5 13.8589C12.91 13.8589 13.25 14.1989 13.25 14.6089V18.7589ZM18.37 18.7589C18.37 19.1689 18.03 19.5089 17.62 19.5089C17.21 19.5089 16.87 19.1689 16.87 18.7589V12.5389C16.87 12.1289 17.21 11.7889 17.62 11.7889C18.03 11.7889 18.37 12.1289 18.37 12.5389V18.7589ZM18.37 9.37889C18.37 9.78889 18.03 10.1289 17.62 10.1289C17.21 10.1289 16.87 9.78889 16.87 9.37889V8.40889C14.32 11.0289 11.13 12.8789 7.56 13.7689C7.5 13.7889 7.44 13.7889 7.38 13.7889C7.04 13.7889 6.74 13.5589 6.65 13.2189C6.55 12.8189 6.79 12.4089 7.2 12.3089C10.57 11.4689 13.57 9.69889 15.95 7.19889H14.7C14.29 7.19889 13.95 6.85889 13.95 6.44889C13.95 6.03889 14.29 5.69889 14.7 5.69889H17.63C17.67 5.69889 17.7 5.71889 17.74 5.71889C17.79 5.72889 17.84 5.72889 17.89 5.74889C17.94 5.76889 17.98 5.79889 18.03 5.82889C18.06 5.84889 18.09 5.85889 18.12 5.87889C18.13 5.88889 18.13 5.89889 18.14 5.89889C18.18 5.93889 18.21 5.97889 18.24 6.01889C18.27 6.05889 18.3 6.08889 18.31 6.12889C18.33 6.16889 18.33 6.20889 18.34 6.25889C18.35 6.30889 18.37 6.35889 18.37 6.41889C18.37 6.42889 18.38 6.43889 18.38 6.44889V9.37889H18.37Z" fill="#52AA63"/></svg>';
  static const String reportsInactive =
      '<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7.38 18.7589V16.6889" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round"/><path d="M12.5 18.7589V14.6189" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round"/><path d="M17.62 18.7589V12.5389" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round"/><path d="M17.62 6.45889L17.16 6.99889C14.61 9.97889 11.19 12.0889 7.38 13.0389" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round"/><path d="M14.6899 6.45889H17.6199V9.37889" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M9.5 22.6089H15.5C20.5 22.6089 22.5 20.6089 22.5 15.6089V9.60889C22.5 4.60889 20.5 2.60889 15.5 2.60889H9.5C4.5 2.60889 2.5 4.60889 2.5 9.60889V15.6089C2.5 20.6089 4.5 22.6089 9.5 22.6089Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';

  static const String requestsActive =
      '<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M8.5 12.8089H15.5" stroke="#52AA63" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/><path d="M8.5 16.8089H12.88" stroke="#52AA63" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/><path d="M10.5 6.60889H14.5C16.5 6.60889 16.5 5.60889 16.5 4.60889C16.5 2.60889 15.5 2.60889 14.5 2.60889H10.5C9.5 2.60889 8.5 2.60889 8.5 4.60889C8.5 6.60889 9.5 6.60889 10.5 6.60889Z" stroke="#52AA63" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/><path d="M16.5 4.62888C19.83 4.80888 21.5 6.03888 21.5 10.6089V16.6089C21.5 20.6089 20.5 22.6089 15.5 22.6089H9.5C4.5 22.6089 3.5 20.6089 3.5 16.6089V10.6089C3.5 6.04888 5.17 4.80888 8.5 4.62888" stroke="#52AA63" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/></svg>';
  static const String requestsInactive =
      '<svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M8.5 12.8089H15.5" stroke="#A7A7A7" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/><path d="M8.5 16.8089H12.88" stroke="#A7A7A7" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/><path d="M10.5 6.60889H14.5C16.5 6.60889 16.5 5.60889 16.5 4.60889C16.5 2.60889 15.5 2.60889 14.5 2.60889H10.5C9.5 2.60889 8.5 2.60889 8.5 4.60889C8.5 6.60889 9.5 6.60889 10.5 6.60889Z" stroke="#A7A7A7" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/><path d="M16.5 4.62888C19.83 4.80888 21.5 6.03888 21.5 10.6089V16.6089C21.5 20.6089 20.5 22.6089 15.5 22.6089H9.5C4.5 22.6089 3.5 20.6089 3.5 16.6089V10.6089C3.5 6.04888 5.17 4.80888 8.5 4.62888" stroke="#A7A7A7" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/></svg>';

  static const String profileActive =
      '<svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12.12 13.3889C12.05 13.3789 11.96 13.3789 11.88 13.3889C10.12 13.3289 8.71997 11.8889 8.71997 10.1189C8.71997 8.3089 10.18 6.8389 12 6.8389C13.81 6.8389 15.28 8.3089 15.28 10.1189C15.27 11.8889 13.88 13.3289 12.12 13.3889Z" stroke="#52AA63" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M18.74 19.9889C16.96 21.6189 14.6 22.6089 12 22.6089C9.40001 22.6089 7.04001 21.6189 5.26001 19.9889C5.36001 19.0489 5.96001 18.1289 7.03001 17.4089C9.77001 15.5889 14.25 15.5889 16.97 17.4089C18.04 18.1289 18.64 19.0489 18.74 19.9889Z" stroke="#52AA63" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M12 22.6089C17.5228 22.6089 22 18.1317 22 12.6089C22 7.08604 17.5228 2.60889 12 2.60889C6.47715 2.60889 2 7.08604 2 12.6089C2 18.1317 6.47715 22.6089 12 22.6089Z" stroke="#52AA63" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';
  static const String profileInactive =
      '<svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12.12 13.3889C12.05 13.3789 11.96 13.3789 11.88 13.3889C10.12 13.3289 8.71997 11.8889 8.71997 10.1189C8.71997 8.3089 10.18 6.8389 12 6.8389C13.81 6.8389 15.28 8.3089 15.28 10.1189C15.27 11.8889 13.88 13.3289 12.12 13.3889Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M18.74 19.9889C16.96 21.6189 14.6 22.6089 12 22.6089C9.40001 22.6089 7.04001 21.6189 5.26001 19.9889C5.36001 19.0489 5.96001 18.1289 7.03001 17.4089C9.77001 15.5889 14.25 15.5889 16.97 17.4089C18.04 18.1289 18.64 19.0489 18.74 19.9889Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M12 22.6089C17.5228 22.6089 22 18.1317 22 12.6089C22 7.08604 17.5228 2.60889 12 2.60889C6.47715 2.60889 2 7.08604 2 12.6089C2 18.1317 6.47715 22.6089 12 22.6089Z" stroke="#A7A7A7" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';
}

Widget createBottomNavigation(
    BuildContext context, int selectedIndex, Size screenSize) {
  return Container(
    margin: EdgeInsets.only(bottom: screenSize.height * 0.015),
    decoration: const BoxDecoration(
      border:
          Border(top: BorderSide(width: 1, color: ExtryColors.backgroundColor)),
    ),
    height: screenSize.height * .105,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        createItem(
          context,
          "/employee-home",
          activeImage: _NavigationIcons.homeActive,
          inactiveImage: _NavigationIcons.homeInactive,
          label: "ورود و خروج",
          isSelected: (selectedIndex == NavigationTypes.home),
        ),
        createItem(
          context,
          "/reports",
          activeImage: _NavigationIcons.reportsActive,
          inactiveImage: _NavigationIcons.reportsInactive,
          label: "گزارش ها",
          isSelected: (selectedIndex == NavigationTypes.reports),
        ),
        createItem(
          context,
          "/requests",
          activeImage: _NavigationIcons.requestsActive,
          inactiveImage: _NavigationIcons.requestsInactive,
          label: "درخواست ها",
          isSelected: (selectedIndex == NavigationTypes.requests),
        ),
        createItem(
          context,
          "/profile",
          activeImage: _NavigationIcons.profileActive,
          inactiveImage: _NavigationIcons.profileInactive,
          label: "پروفایل",
          isSelected: (selectedIndex == NavigationTypes.profile),
        ),
      ],
    ),
  );
}

Widget createItem(BuildContext context, String routeName,
    {required String activeImage,
    required String inactiveImage,
    required String label,
    required bool isSelected,
    bool isNotify = false}) {
  return Stack(
    children: [
      Builder(builder: (context) {
        if (isSelected) {
          return Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                SvgPicture.string(activeImage, width: 30, height: 30),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                      color: ExtryColors.accent,
                      fontFamily: 'IRANYekan',
                      fontSize: 14),
                ),
              ],
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              if (routeName == "/employee-home") {
                Navigator.pop(context);
              } else if (routeName == "/reports") {
                Navigator.pushNamedAndRemoveUntil(
                    context, routeName, (route) => route.isFirst);
              } else {
                Fluttertoast.showToast(
                  msg: 'Coming soon :)',
                  backgroundColor: ExtryColors.description,
                  fontSize: 14,
                );
                return;
              }
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  SvgPicture.string(inactiveImage, width: 30, height: 30),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                        color: ExtryColors.placeHolder,
                        fontFamily: 'IRANYekan',
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    ],
  );
}
