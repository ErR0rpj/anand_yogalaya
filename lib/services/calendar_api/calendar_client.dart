import 'package:get/get.dart';
import 'package:googleapis/calendar/v3.dart';

class CalendarClient {
  //
  static CalendarApi? calendar;

  //Creates new calendar event and meet
  Future<Map<String, String>?> insert({
    required String title,
    String description = '',
    List<EventAttendee>? attendeeEmailList,
    bool shouldNotifyAttendee = true,
    bool hasConferenceSupport = true,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    attendeeEmailList ??= [];

    Map<String, String>? eventData;
    //The account can have multiple calendars, we are selecting the primary one.
    String calendarId = 'primary';
    //Event object is the event created for the calendar.
    Event event = Event();

    event.summary = title;
    event.description = description;
    event.attendees = attendeeEmailList;

    if (hasConferenceSupport) {
      ConferenceData conferenceData = ConferenceData();
      CreateConferenceRequest conferenceRequest = CreateConferenceRequest();
      conferenceRequest.requestId =
          '${startTime.millisecondsSinceEpoch}-${endTime.millisecondsSinceEpoch}';
      conferenceData.createRequest = conferenceRequest;

      event.conferenceData = conferenceData;
    }

    EventDateTime start = EventDateTime();
    start.dateTime = startTime;
    start.timeZone = 'GMT+05:30';
    event.start = start;

    EventDateTime end = EventDateTime();
    end.dateTime = endTime;
    end.timeZone = 'GMT+05:30';
    event.end = end;

    try {
      Event? value = await calendar?.events.insert(event, calendarId,
          conferenceDataVersion: hasConferenceSupport ? 1 : 0,
          sendUpdates: shouldNotifyAttendee ? 'all' : 'none');

      if (value != null) {
        print('Calendar event status: ${value.status}');
        if (value.status == 'confirmed') {
          String joiningLink = '';
          String eventId = '';

          eventId = value.id!;

          if (hasConferenceSupport) {
            joiningLink =
                'https://meet.google.com/${value.conferenceData?.conferenceId}';
          }

          eventData = {
            'id': eventId,
            'link': joiningLink,
          };

          print('Event added to Google calendar');
          Get.snackbar(
            'Event Scheduled',
            'Event successfully scheduled!',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      print('Unable to add event to Google Calendar: $e');
      Get.snackbar(
        'Failed',
        'Event scheduling failed!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return eventData;
  }

  //For modifying a calendar event or meet
  Future<Map<String, String>?> modify({
    required String id,
    required String title,
    String description = '',
    List<EventAttendee>? attendeeEmailList,
    bool shouldNotifyAttendees = true,
    bool hasConferenceSupport = true,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    attendeeEmailList ??= [];
    Map<String, String>? eventData;

    String calendarId = 'primary';
    Event event = Event();

    event.summary = title;
    event.description = description;
    event.attendees = attendeeEmailList;

    EventDateTime start = EventDateTime();
    start.dateTime = startTime;
    start.timeZone = 'GMT+05:30';
    event.start = start;

    EventDateTime end = EventDateTime();
    end.dateTime = endTime;
    end.timeZone = 'GMT+05:30';
    event.end = end;

    try {
      Event? value = await calendar?.events.patch(
        event,
        calendarId,
        id,
        conferenceDataVersion: hasConferenceSupport ? 1 : 0,
        sendUpdates: shouldNotifyAttendees ? 'all' : 'none',
      );

      if (value != null) {
        print('Event status: ${value.status}');

        if (value.status == 'confirmed') {
          String joiningLink = '';
          String eventId = '';

          eventId = value.id!;

          if (hasConferenceSupport) {
            joiningLink =
                'https://meet.google.com/${value.conferenceData?.conferenceId}';
          }

          eventData = {
            'id': eventId,
            'link': joiningLink,
          };

          print('Event modified to Google calendar');
          Get.snackbar(
            'Event Modified',
            'Event successfully modified!',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      print('Unable to modify event to Google Calendar: $e');
      Get.snackbar(
        'Failed',
        'Event modification failed!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return eventData;
  }

  // For deleting a calendar event or meet
  Future<void> delete(String eventId, bool shouldNotify) async {
    String calendarId = 'primary';

    try {
      await calendar?.events.delete(
        calendarId,
        eventId,
        sendUpdates: shouldNotify ? 'all' : 'none',
      );

      print('Event deleted from Google Calendar');
      Get.snackbar(
        'Event Deleted',
        'Event successfully deleted!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('Unable to delete event from Google Calendar: $e');
      Get.snackbar(
        'Failed',
        'Event deletion failed!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
