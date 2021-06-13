# Flutter Recurrence
## Package: recurrence

# Overview
**Flutter Recurrence** is a Dart-native package intended for use in cross-platform Flutter projects (but may be used elsewhere).

Easily track recurring events with a set of `Recurrence` rules, including:

  * Time of Day
  * Interval Date
  * Day of the Month
  * Day of the Week
  * Weekday of the Month
  * Interval Month
  * Month of the Year
  * Interval Year

Almost any recurrence interval can be modeled using one or a combination of these rules.

# Usage

To use these rules, instantiate the rule with the logic needed for your interval and then test it against a `DateTime` object using the `occursOn(DateTime)` method available on every `Recurrence` object.

# Rules

All `Recurrence` rules implement the abstract `Recurrence` base class and take a `List<int>` and a `DateTime` as their constructor parameters. All rules will use the [DateTime] in the constructor to limit the earliest occurrences of the rule; some rules will also use this value to determine the day of the month or weekday on which the rule occurs.

## Time of Day

The `TimeOfDay` rule occurs at a specific time of day. This is the only rule that deals with time. This is also the only rule that doesn't require a `List<int>` in the constructor.

This rule allows you to specify a `depth` of comparison:

  * 1 - hours only
  * 2 - hours and minutes
  * 3 - hours, minutes, and seconds
  * 4 - hours, minutes, seconds, and milliseconds
  * 5 - full matching: hours, minutes, seconds, milliseconds, and microseconds

For example, a rule that matches the hour and minute:

```
TimeOfDay(2, <DateTime containing desired time of day>);
```

## Interval Date

The `IntervalDate` rule occurs every _n_ days. For example, a rule that occurs every `25` days:

```
IntervalDate([25], <DateTime>);
```

## Day of the Month

The `DayOfMonth` rule occurs on **one or more** specific days of the month. This rule supports negative indexing.

For example: an event that occurs on the fifteenth and the _last_ day of the month:

```
DayOfMonth([15, -1], <DateTime>);
```

## Day of the Week

The `DayOfWeek` rule occurs on **one or more** specific days of the week, following the Dart standard of Monday (1) through Sunday (7). 

For example, a rule occuring on Wednesday:

```
DayOfWeek([DateTime.wednesday], <DateTime>);
```

## Weekday of the Month

The `WeekdayOfMonth` rule occurs on **one or more** specific weekdays of the month. This rule supports negative indexing.

This rule combines the weekday-targeting functionality of the `DayOfWeek` rule while also targeting **one or more** specific _weeks_ of the month. 

For example, a rule targeting the **first** and **third** Wednesday:

```
WeekdayOfMonth([1, 3], <DateTime occuring on a Wednesday>);
```

## Month of the Year

The `MonthOfYear` rule occurs in **one or more** specific months of the year. 

For example, a rule occuring in February and August:

```
MonthOfYear([DateTime.february, DateTime.august], <DateTime>);
```

## Interval Year

The `IntervalYear` rule occurs every _n_ years. 

For example, a rule that occurs every _three_ years:

```
IntervalYear([3], <DateTime in 2021>);
```
