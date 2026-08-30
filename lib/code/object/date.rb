# frozen_string_literal: true

class Code
  class Object
    class Date < Object
      CLASS_DOCUMENTATION = {
        name: "Date",
        description:
          "represents a calendar date with date arithmetic and formatting.",
        examples: [
          "Date.today",
          "Date.tomorrow > Date.today",
          "Date.new(\"2024-03-05\").year"
        ]
      }.freeze
      DEFAULT_ZONE = "Etc/UTC"
      CLASS_FUNCTIONS = {
        "zone" => {
          name: "zone",
          description: "returns the current default time zone name.",
          examples: [
            "Date.zone",
            "Time.zone = \"Etc/UTC\" Date.zone",
            "Time.zone = \"Europe/Paris\" Date.zone"
          ]
        },
        "zone=" => {
          name: "zone=",
          description: "sets the default time zone and returns it.",
          examples: [
            "Date.zone = \"Etc/UTC\"",
            "Date.zone = \"Europe/Paris\"",
            "Date.zone = \"America/New_York\""
          ]
        },
        "today" => {
          name: "today",
          description: "returns the current date.",
          examples: [
            "Date.today",
            "Time.zone = \"Etc/UTC\" Date.today",
            "Date.today.to_date"
          ]
        },
        "current" => {
          name: "current",
          description: "returns the current date.",
          examples: [
            "Date.current",
            "Time.zone = \"Etc/UTC\" Date.current",
            "Date.current.to_date"
          ]
        },
        "now" => {
          name: "now",
          description: "returns the current date.",
          examples: [
            "Date.now",
            "Time.zone = \"Etc/UTC\" Date.now",
            "Date.now.to_date"
          ]
        },
        "tomorrow" => {
          name: "tomorrow",
          description: "returns the next date after the current date.",
          examples: [
            "Date.tomorrow",
            "Time.zone = \"Etc/UTC\" Date.tomorrow",
            "Date.tomorrow.to_date"
          ]
        },
        "yesterday" => {
          name: "yesterday",
          description: "returns the date before the current date.",
          examples: [
            "Date.yesterday",
            "Time.zone = \"Etc/UTC\" Date.yesterday",
            "Date.yesterday.to_date"
          ]
        }
      }.freeze
      INSTANCE_FUNCTIONS = {
        "zone" => {
          name: "zone",
          description: "returns the current default time zone name.",
          examples: [
            "Date.new(\"2024-03-05\").zone",
            "Time.zone = \"Etc/UTC\" Date.new(\"2024-03-05\").zone",
            "Time.zone = \"Europe/Paris\" Date.new(\"2024-03-05\").zone"
          ]
        },
        "after?" => {
          name: "after?",
          description:
            "returns whether the date is after another date or time.",
          examples: [
            "Date.new(\"2024-03-05\").after?(Date.new(\"2024-03-04\"))",
            "Date.new(\"2024-03-05\").after?(Date.new(\"2024-03-06\"))",
            "Date.new(\"2024-03-05\").after?"
          ]
        },
        "before?" => {
          name: "before?",
          description:
            "returns whether the date is before another date or time.",
          examples: [
            "Date.new(\"2024-03-05\").before?(Date.new(\"2024-03-06\"))",
            "Date.new(\"2024-03-05\").before?(Date.new(\"2024-03-04\"))",
            "Date.new(\"2024-03-05\").before?"
          ]
        },
        "past?" => {
          name: "past?",
          description: "returns whether the date is before the current date.",
          examples: [
            "Date.new(\"2024-03-05\").past?",
            "Date.today.past?",
            "Date.tomorrow.past?"
          ]
        },
        "future?" => {
          name: "future?",
          description: "returns whether the date is after the current date.",
          examples: [
            "Date.new(\"2024-03-05\").future?",
            "Date.today.future?",
            "Date.tomorrow.future?"
          ]
        },
        "format" => {
          name: "format",
          description: "formats the date with an optional format and locale.",
          examples: [
            "Date.new(\"2024-03-05\").format",
            "Date.new(\"2024-03-05\").format(:default)",
            "Date.new(\"2024-03-05\").format(\"%Y-%m-%d\")"
          ]
        },
        "iso8601" => {
          name: "iso8601",
          description: "formats the date as an iso 8601 string.",
          examples: [
            "Date.new(\"2024-03-05\").iso8601",
            "Date.new(\"2024-01-01\").iso8601",
            "Date.new(\"2024-12-31\").iso8601"
          ]
        },
        "iso" => {
          name: "iso",
          description: "formats the date as an iso 8601 string.",
          examples: [
            "Date.new(\"2024-03-05\").iso",
            "Date.new(\"2024-01-01\").iso",
            "Date.new(\"2024-12-31\").iso"
          ]
        },
        "rfc2822" => {
          name: "rfc2822",
          description: "formats the date as an rfc 2822 string.",
          examples: [
            "Date.new(\"2024-03-05\").rfc2822",
            "Date.new(\"2024-01-01\").rfc2822",
            "Date.new(\"2024-12-31\").rfc2822"
          ]
        },
        "rfc3339" => {
          name: "rfc3339",
          description: "formats the date as an rfc 3339 string.",
          examples: [
            "Date.new(\"2024-03-05\").rfc3339",
            "Date.new(\"2024-01-01\").rfc3339",
            "Date.new(\"2024-12-31\").rfc3339"
          ]
        },
        "rfc" => {
          name: "rfc",
          description: "formats the date as an rfc 3339 string.",
          examples: [
            "Date.new(\"2024-03-05\").rfc",
            "Date.new(\"2024-01-01\").rfc",
            "Date.new(\"2024-12-31\").rfc"
          ]
        },
        "to_list" => {
          name: "to_list",
          description: "returns the date parts as a list.",
          examples: [
            "Date.new(\"2024-03-05\").to_list",
            "Date.new(\"2024-01-01\").to_list",
            "Date.new(\"2024-12-31\").to_list"
          ]
        },
        "to_integer" => {
          name: "to_integer",
          description: "converts the date to an integer timestamp.",
          examples: [
            "Date.new(\"2024-03-05\").to_integer",
            "Date.new(\"1970-01-01\").to_integer",
            "Date.new(\"2024-12-31\").to_integer"
          ]
        },
        "to_decimal" => {
          name: "to_decimal",
          description: "converts the date to a decimal timestamp.",
          examples: [
            "Date.new(\"2024-03-05\").to_decimal",
            "Date.new(\"1970-01-01\").to_decimal",
            "Date.new(\"2024-12-31\").to_decimal"
          ]
        },
        "utc_offset" => {
          name: "utc_offset",
          description: "returns the current time zone utc offset in seconds.",
          examples: [
            "Date.new(\"2024-03-05\").utc_offset",
            "Time.zone = \"Etc/UTC\" Date.new(\"2024-03-05\").utc_offset",
            "Time.zone = \"Europe/Paris\" Date.new(\"2024-03-05\").utc_offset"
          ]
        },
        "year_day" => {
          name: "year_day",
          description: "returns the day number within the year.",
          examples: [
            "Date.new(\"2024-03-05\").year_day",
            "Date.new(\"2024-01-01\").year_day",
            "Date.new(\"2024-12-31\").year_day"
          ]
        },
        "month_day" => {
          name: "month_day",
          description: "returns the day number within the month.",
          examples: [
            "Date.new(\"2024-03-05\").month_day",
            "Date.new(\"2024-01-01\").month_day",
            "Date.new(\"2024-12-31\").month_day"
          ]
        },
        "year" => {
          name: "year",
          description: "returns the year component.",
          examples: [
            "Date.new(\"2024-03-05\").year",
            "Date.new(\"2024-01-01\").year",
            "Date.new(\"2024-12-31\").year"
          ]
        },
        "years" => {
          name: "years",
          description: "returns the year component.",
          examples: [
            "Date.new(\"2024-03-05\").years",
            "Date.new(\"2024-01-01\").years",
            "Date.new(\"2024-12-31\").years"
          ]
        },
        "month" => {
          name: "month",
          description: "returns the month component.",
          examples: [
            "Date.new(\"2024-03-05\").month",
            "Date.new(\"2024-01-01\").month",
            "Date.new(\"2024-12-31\").month"
          ]
        },
        "months" => {
          name: "months",
          description: "returns the month component.",
          examples: [
            "Date.new(\"2024-03-05\").months",
            "Date.new(\"2024-01-01\").months",
            "Date.new(\"2024-12-31\").months"
          ]
        },
        "week" => {
          name: "week",
          description: "returns the iso week component.",
          examples: [
            "Date.new(\"2024-03-05\").week",
            "Date.new(\"2024-01-01\").week",
            "Date.new(\"2024-12-31\").week"
          ]
        },
        "weeks" => {
          name: "weeks",
          description: "returns the iso week component.",
          examples: [
            "Date.new(\"2024-03-05\").weeks",
            "Date.new(\"2024-01-01\").weeks",
            "Date.new(\"2024-12-31\").weeks"
          ]
        },
        "week_day" => {
          name: "week_day",
          description: "returns the week day component.",
          examples: [
            "Date.new(\"2024-03-05\").week_day",
            "Date.new(\"2024-01-01\").week_day",
            "Date.new(\"2024-12-31\").week_day"
          ]
        },
        "week_days" => {
          name: "week_days",
          description: "returns the week day component.",
          examples: [
            "Date.new(\"2024-03-05\").week_days",
            "Date.new(\"2024-01-01\").week_days",
            "Date.new(\"2024-12-31\").week_days"
          ]
        },
        "day" => {
          name: "day",
          description: "returns the day component.",
          examples: [
            "Date.new(\"2024-03-05\").day",
            "Date.new(\"2024-01-01\").day",
            "Date.new(\"2024-12-31\").day"
          ]
        },
        "days" => {
          name: "days",
          description: "returns the day component.",
          examples: [
            "Date.new(\"2024-03-05\").days",
            "Date.new(\"2024-01-01\").days",
            "Date.new(\"2024-12-31\").days"
          ]
        },
        "hour" => {
          name: "hour",
          description: "returns zero for dates.",
          examples: [
            "Date.new(\"2024-03-05\").hour",
            "Date.new(\"2024-01-01\").hour",
            "Date.new(\"2024-12-31\").hour"
          ]
        },
        "hours" => {
          name: "hours",
          description: "returns zero for dates.",
          examples: [
            "Date.new(\"2024-03-05\").hours",
            "Date.new(\"2024-01-01\").hours",
            "Date.new(\"2024-12-31\").hours"
          ]
        },
        "minute" => {
          name: "minute",
          description: "returns zero for dates.",
          examples: [
            "Date.new(\"2024-03-05\").minute",
            "Date.new(\"2024-01-01\").minute",
            "Date.new(\"2024-12-31\").minute"
          ]
        },
        "minutes" => {
          name: "minutes",
          description: "returns zero for dates.",
          examples: [
            "Date.new(\"2024-03-05\").minutes",
            "Date.new(\"2024-01-01\").minutes",
            "Date.new(\"2024-12-31\").minutes"
          ]
        },
        "second" => {
          name: "second",
          description: "returns zero for dates.",
          examples: [
            "Date.new(\"2024-03-05\").second",
            "Date.new(\"2024-01-01\").second",
            "Date.new(\"2024-12-31\").second"
          ]
        },
        "seconds" => {
          name: "seconds",
          description: "returns zero for dates.",
          examples: [
            "Date.new(\"2024-03-05\").seconds",
            "Date.new(\"2024-01-01\").seconds",
            "Date.new(\"2024-12-31\").seconds"
          ]
        },
        "monday?" => {
          name: "monday?",
          description: "returns whether the date is a monday.",
          examples: [
            "Date.new(\"2024-03-04\").monday?",
            "Date.new(\"2024-03-05\").monday?",
            "Date.new(\"2024-03-10\").monday?"
          ]
        },
        "tuesday?" => {
          name: "tuesday?",
          description: "returns whether the date is a tuesday.",
          examples: [
            "Date.new(\"2024-03-05\").tuesday?",
            "Date.new(\"2024-03-04\").tuesday?",
            "Date.new(\"2024-03-10\").tuesday?"
          ]
        },
        "wednesday?" => {
          name: "wednesday?",
          description: "returns whether the date is a wednesday.",
          examples: [
            "Date.new(\"2024-03-06\").wednesday?",
            "Date.new(\"2024-03-05\").wednesday?",
            "Date.new(\"2024-03-10\").wednesday?"
          ]
        },
        "thursday?" => {
          name: "thursday?",
          description: "returns whether the date is a thursday.",
          examples: [
            "Date.new(\"2024-03-07\").thursday?",
            "Date.new(\"2024-03-05\").thursday?",
            "Date.new(\"2024-03-10\").thursday?"
          ]
        },
        "friday?" => {
          name: "friday?",
          description: "returns whether the date is a friday.",
          examples: [
            "Date.new(\"2024-03-08\").friday?",
            "Date.new(\"2024-03-05\").friday?",
            "Date.new(\"2024-03-10\").friday?"
          ]
        },
        "saturday?" => {
          name: "saturday?",
          description: "returns whether the date is a saturday.",
          examples: [
            "Date.new(\"2024-03-09\").saturday?",
            "Date.new(\"2024-03-05\").saturday?",
            "Date.new(\"2024-03-10\").saturday?"
          ]
        },
        "sunday?" => {
          name: "sunday?",
          description: "returns whether the date is a sunday.",
          examples: [
            "Date.new(\"2024-03-10\").sunday?",
            "Date.new(\"2024-03-05\").sunday?",
            "Date.new(\"2024-03-04\").sunday?"
          ]
        },
        "january?" => {
          name: "january?",
          description: "returns whether the date is in january.",
          examples: [
            "Date.new(\"2024-01-01\").january?",
            "Date.new(\"2024-02-01\").january?",
            "Date.new(\"2024-12-31\").january?"
          ]
        },
        "february?" => {
          name: "february?",
          description: "returns whether the date is in february.",
          examples: [
            "Date.new(\"2024-02-01\").february?",
            "Date.new(\"2024-01-01\").february?",
            "Date.new(\"2024-12-31\").february?"
          ]
        },
        "march?" => {
          name: "march?",
          description: "returns whether the date is in march.",
          examples: [
            "Date.new(\"2024-03-01\").march?",
            "Date.new(\"2024-01-01\").march?",
            "Date.new(\"2024-12-31\").march?"
          ]
        },
        "april?" => {
          name: "april?",
          description: "returns whether the date is in april.",
          examples: [
            "Date.new(\"2024-04-01\").april?",
            "Date.new(\"2024-01-01\").april?",
            "Date.new(\"2024-12-31\").april?"
          ]
        },
        "may?" => {
          name: "may?",
          description: "returns whether the date is in may.",
          examples: [
            "Date.new(\"2024-05-01\").may?",
            "Date.new(\"2024-01-01\").may?",
            "Date.new(\"2024-12-31\").may?"
          ]
        },
        "june?" => {
          name: "june?",
          description: "returns whether the date is in june.",
          examples: [
            "Date.new(\"2024-06-01\").june?",
            "Date.new(\"2024-01-01\").june?",
            "Date.new(\"2024-12-31\").june?"
          ]
        },
        "july?" => {
          name: "july?",
          description: "returns whether the date is in july.",
          examples: [
            "Date.new(\"2024-07-01\").july?",
            "Date.new(\"2024-01-01\").july?",
            "Date.new(\"2024-12-31\").july?"
          ]
        },
        "august?" => {
          name: "august?",
          description: "returns whether the date is in august.",
          examples: [
            "Date.new(\"2024-08-01\").august?",
            "Date.new(\"2024-01-01\").august?",
            "Date.new(\"2024-12-31\").august?"
          ]
        },
        "september?" => {
          name: "september?",
          description: "returns whether the date is in september.",
          examples: [
            "Date.new(\"2024-09-01\").september?",
            "Date.new(\"2024-01-01\").september?",
            "Date.new(\"2024-12-31\").september?"
          ]
        },
        "october?" => {
          name: "october?",
          description: "returns whether the date is in october.",
          examples: [
            "Date.new(\"2024-10-01\").october?",
            "Date.new(\"2024-01-01\").october?",
            "Date.new(\"2024-12-31\").october?"
          ]
        },
        "november?" => {
          name: "november?",
          description: "returns whether the date is in november.",
          examples: [
            "Date.new(\"2024-11-01\").november?",
            "Date.new(\"2024-01-01\").november?",
            "Date.new(\"2024-12-31\").november?"
          ]
        },
        "december?" => {
          name: "december?",
          description: "returns whether the date is in december.",
          examples: [
            "Date.new(\"2024-12-01\").december?",
            "Date.new(\"2024-01-01\").december?",
            "Date.new(\"2024-12-31\").december?"
          ]
        },
        "add" => {
          name: "add",
          description: "returns a date with date parts added.",
          examples: [
            "Date.new(\"2024-03-05\").add(day: 1)",
            "Date.new(\"2024-03-05\").add(month: 1)",
            "Date.new(\"2024-03-05\").add(year: 1)"
          ]
        },
        "substract" => {
          name: "substract",
          description: "returns a date with date parts subtracted.",
          examples: [
            "Date.new(\"2024-03-05\").substract(day: 1)",
            "Date.new(\"2024-03-05\").substract(month: 1)",
            "Date.new(\"2024-03-05\").substract(year: 1)"
          ]
        },
        "subtract" => {
          name: "subtract",
          description: "returns a date with date parts subtracted.",
          examples: [
            "Date.new(\"2024-03-05\").subtract(day: 1)",
            "Date.new(\"2024-03-05\").subtract(month: 1)",
            "Date.new(\"2024-03-05\").subtract(year: 1)"
          ]
        },
        "change" => {
          name: "change",
          description: "returns a date with selected date parts changed.",
          examples: [
            "Date.new(\"2024-03-05\").change(day: 1)",
            "Date.new(\"2024-03-05\").change(month: 1)",
            "Date.new(\"2024-03-05\").change(year: 2025)"
          ]
        },
        "africa_abidjan?" => {
          name: "africa_abidjan?",
          description:
            "returns whether the current time zone is africa/abidjan.",
          examples: [
            "Date.africa_abidjan?",
            "Date.new(\"2024-03-05\").africa_abidjan?",
            "Time.zone = \"Etc/UTC\" Date.africa_abidjan?"
          ]
        },
        "africa_accra?" => {
          name: "africa_accra?",
          description: "returns whether the current time zone is africa/accra.",
          examples: [
            "Date.africa_accra?",
            "Date.new(\"2024-03-05\").africa_accra?",
            "Time.zone = \"Etc/UTC\" Date.africa_accra?"
          ]
        },
        "africa_addis_ababa?" => {
          name: "africa_addis_ababa?",
          description:
            "returns whether the current time zone is africa/addis_ababa.",
          examples: [
            "Date.africa_addis_ababa?",
            "Date.new(\"2024-03-05\").africa_addis_ababa?",
            "Time.zone = \"Etc/UTC\" Date.africa_addis_ababa?"
          ]
        },
        "africa_algiers?" => {
          name: "africa_algiers?",
          description:
            "returns whether the current time zone is africa/algiers.",
          examples: [
            "Date.africa_algiers?",
            "Date.new(\"2024-03-05\").africa_algiers?",
            "Time.zone = \"Etc/UTC\" Date.africa_algiers?"
          ]
        },
        "africa_asmara?" => {
          name: "africa_asmara?",
          description:
            "returns whether the current time zone is africa/asmara.",
          examples: [
            "Date.africa_asmara?",
            "Date.new(\"2024-03-05\").africa_asmara?",
            "Time.zone = \"Etc/UTC\" Date.africa_asmara?"
          ]
        },
        "africa_asmera?" => {
          name: "africa_asmera?",
          description:
            "returns whether the current time zone is africa/asmera.",
          examples: [
            "Date.africa_asmera?",
            "Date.new(\"2024-03-05\").africa_asmera?",
            "Time.zone = \"Etc/UTC\" Date.africa_asmera?"
          ]
        },
        "africa_bamako?" => {
          name: "africa_bamako?",
          description:
            "returns whether the current time zone is africa/bamako.",
          examples: [
            "Date.africa_bamako?",
            "Date.new(\"2024-03-05\").africa_bamako?",
            "Time.zone = \"Etc/UTC\" Date.africa_bamako?"
          ]
        },
        "africa_bangui?" => {
          name: "africa_bangui?",
          description:
            "returns whether the current time zone is africa/bangui.",
          examples: [
            "Date.africa_bangui?",
            "Date.new(\"2024-03-05\").africa_bangui?",
            "Time.zone = \"Etc/UTC\" Date.africa_bangui?"
          ]
        },
        "africa_banjul?" => {
          name: "africa_banjul?",
          description:
            "returns whether the current time zone is africa/banjul.",
          examples: [
            "Date.africa_banjul?",
            "Date.new(\"2024-03-05\").africa_banjul?",
            "Time.zone = \"Etc/UTC\" Date.africa_banjul?"
          ]
        },
        "africa_bissau?" => {
          name: "africa_bissau?",
          description:
            "returns whether the current time zone is africa/bissau.",
          examples: [
            "Date.africa_bissau?",
            "Date.new(\"2024-03-05\").africa_bissau?",
            "Time.zone = \"Etc/UTC\" Date.africa_bissau?"
          ]
        },
        "africa_blantyre?" => {
          name: "africa_blantyre?",
          description:
            "returns whether the current time zone is africa/blantyre.",
          examples: [
            "Date.africa_blantyre?",
            "Date.new(\"2024-03-05\").africa_blantyre?",
            "Time.zone = \"Etc/UTC\" Date.africa_blantyre?"
          ]
        },
        "africa_brazzaville?" => {
          name: "africa_brazzaville?",
          description:
            "returns whether the current time zone is africa/brazzaville.",
          examples: [
            "Date.africa_brazzaville?",
            "Date.new(\"2024-03-05\").africa_brazzaville?",
            "Time.zone = \"Etc/UTC\" Date.africa_brazzaville?"
          ]
        },
        "africa_bujumbura?" => {
          name: "africa_bujumbura?",
          description:
            "returns whether the current time zone is africa/bujumbura.",
          examples: [
            "Date.africa_bujumbura?",
            "Date.new(\"2024-03-05\").africa_bujumbura?",
            "Time.zone = \"Etc/UTC\" Date.africa_bujumbura?"
          ]
        },
        "africa_cairo?" => {
          name: "africa_cairo?",
          description: "returns whether the current time zone is africa/cairo.",
          examples: [
            "Date.africa_cairo?",
            "Date.new(\"2024-03-05\").africa_cairo?",
            "Time.zone = \"Etc/UTC\" Date.africa_cairo?"
          ]
        },
        "africa_casablanca?" => {
          name: "africa_casablanca?",
          description:
            "returns whether the current time zone is africa/casablanca.",
          examples: [
            "Date.africa_casablanca?",
            "Date.new(\"2024-03-05\").africa_casablanca?",
            "Time.zone = \"Etc/UTC\" Date.africa_casablanca?"
          ]
        },
        "africa_ceuta?" => {
          name: "africa_ceuta?",
          description: "returns whether the current time zone is africa/ceuta.",
          examples: [
            "Date.africa_ceuta?",
            "Date.new(\"2024-03-05\").africa_ceuta?",
            "Time.zone = \"Etc/UTC\" Date.africa_ceuta?"
          ]
        },
        "africa_conakry?" => {
          name: "africa_conakry?",
          description:
            "returns whether the current time zone is africa/conakry.",
          examples: [
            "Date.africa_conakry?",
            "Date.new(\"2024-03-05\").africa_conakry?",
            "Time.zone = \"Etc/UTC\" Date.africa_conakry?"
          ]
        },
        "africa_dakar?" => {
          name: "africa_dakar?",
          description: "returns whether the current time zone is africa/dakar.",
          examples: [
            "Date.africa_dakar?",
            "Date.new(\"2024-03-05\").africa_dakar?",
            "Time.zone = \"Etc/UTC\" Date.africa_dakar?"
          ]
        },
        "africa_dar_es_salaam?" => {
          name: "africa_dar_es_salaam?",
          description:
            "returns whether the current time zone is africa/dar_es_salaam.",
          examples: [
            "Date.africa_dar_es_salaam?",
            "Date.new(\"2024-03-05\").africa_dar_es_salaam?",
            "Time.zone = \"Etc/UTC\" Date.africa_dar_es_salaam?"
          ]
        },
        "africa_djibouti?" => {
          name: "africa_djibouti?",
          description:
            "returns whether the current time zone is africa/djibouti.",
          examples: [
            "Date.africa_djibouti?",
            "Date.new(\"2024-03-05\").africa_djibouti?",
            "Time.zone = \"Etc/UTC\" Date.africa_djibouti?"
          ]
        },
        "africa_douala?" => {
          name: "africa_douala?",
          description:
            "returns whether the current time zone is africa/douala.",
          examples: [
            "Date.africa_douala?",
            "Date.new(\"2024-03-05\").africa_douala?",
            "Time.zone = \"Etc/UTC\" Date.africa_douala?"
          ]
        },
        "africa_el_aaiun?" => {
          name: "africa_el_aaiun?",
          description:
            "returns whether the current time zone is africa/el_aaiun.",
          examples: [
            "Date.africa_el_aaiun?",
            "Date.new(\"2024-03-05\").africa_el_aaiun?",
            "Time.zone = \"Etc/UTC\" Date.africa_el_aaiun?"
          ]
        },
        "africa_freetown?" => {
          name: "africa_freetown?",
          description:
            "returns whether the current time zone is africa/freetown.",
          examples: [
            "Date.africa_freetown?",
            "Date.new(\"2024-03-05\").africa_freetown?",
            "Time.zone = \"Etc/UTC\" Date.africa_freetown?"
          ]
        },
        "africa_gaborone?" => {
          name: "africa_gaborone?",
          description:
            "returns whether the current time zone is africa/gaborone.",
          examples: [
            "Date.africa_gaborone?",
            "Date.new(\"2024-03-05\").africa_gaborone?",
            "Time.zone = \"Etc/UTC\" Date.africa_gaborone?"
          ]
        },
        "africa_harare?" => {
          name: "africa_harare?",
          description:
            "returns whether the current time zone is africa/harare.",
          examples: [
            "Date.africa_harare?",
            "Date.new(\"2024-03-05\").africa_harare?",
            "Time.zone = \"Etc/UTC\" Date.africa_harare?"
          ]
        },
        "africa_johannesburg?" => {
          name: "africa_johannesburg?",
          description:
            "returns whether the current time zone is africa/johannesburg.",
          examples: [
            "Date.africa_johannesburg?",
            "Date.new(\"2024-03-05\").africa_johannesburg?",
            "Time.zone = \"Etc/UTC\" Date.africa_johannesburg?"
          ]
        },
        "africa_juba?" => {
          name: "africa_juba?",
          description: "returns whether the current time zone is africa/juba.",
          examples: [
            "Date.africa_juba?",
            "Date.new(\"2024-03-05\").africa_juba?",
            "Time.zone = \"Etc/UTC\" Date.africa_juba?"
          ]
        },
        "africa_kampala?" => {
          name: "africa_kampala?",
          description:
            "returns whether the current time zone is africa/kampala.",
          examples: [
            "Date.africa_kampala?",
            "Date.new(\"2024-03-05\").africa_kampala?",
            "Time.zone = \"Etc/UTC\" Date.africa_kampala?"
          ]
        },
        "africa_khartoum?" => {
          name: "africa_khartoum?",
          description:
            "returns whether the current time zone is africa/khartoum.",
          examples: [
            "Date.africa_khartoum?",
            "Date.new(\"2024-03-05\").africa_khartoum?",
            "Time.zone = \"Etc/UTC\" Date.africa_khartoum?"
          ]
        },
        "africa_kigali?" => {
          name: "africa_kigali?",
          description:
            "returns whether the current time zone is africa/kigali.",
          examples: [
            "Date.africa_kigali?",
            "Date.new(\"2024-03-05\").africa_kigali?",
            "Time.zone = \"Etc/UTC\" Date.africa_kigali?"
          ]
        },
        "africa_kinshasa?" => {
          name: "africa_kinshasa?",
          description:
            "returns whether the current time zone is africa/kinshasa.",
          examples: [
            "Date.africa_kinshasa?",
            "Date.new(\"2024-03-05\").africa_kinshasa?",
            "Time.zone = \"Etc/UTC\" Date.africa_kinshasa?"
          ]
        },
        "africa_lagos?" => {
          name: "africa_lagos?",
          description: "returns whether the current time zone is africa/lagos.",
          examples: [
            "Date.africa_lagos?",
            "Date.new(\"2024-03-05\").africa_lagos?",
            "Time.zone = \"Etc/UTC\" Date.africa_lagos?"
          ]
        },
        "africa_libreville?" => {
          name: "africa_libreville?",
          description:
            "returns whether the current time zone is africa/libreville.",
          examples: [
            "Date.africa_libreville?",
            "Date.new(\"2024-03-05\").africa_libreville?",
            "Time.zone = \"Etc/UTC\" Date.africa_libreville?"
          ]
        },
        "africa_lome?" => {
          name: "africa_lome?",
          description: "returns whether the current time zone is africa/lome.",
          examples: [
            "Date.africa_lome?",
            "Date.new(\"2024-03-05\").africa_lome?",
            "Time.zone = \"Etc/UTC\" Date.africa_lome?"
          ]
        },
        "africa_luanda?" => {
          name: "africa_luanda?",
          description:
            "returns whether the current time zone is africa/luanda.",
          examples: [
            "Date.africa_luanda?",
            "Date.new(\"2024-03-05\").africa_luanda?",
            "Time.zone = \"Etc/UTC\" Date.africa_luanda?"
          ]
        },
        "africa_lubumbashi?" => {
          name: "africa_lubumbashi?",
          description:
            "returns whether the current time zone is africa/lubumbashi.",
          examples: [
            "Date.africa_lubumbashi?",
            "Date.new(\"2024-03-05\").africa_lubumbashi?",
            "Time.zone = \"Etc/UTC\" Date.africa_lubumbashi?"
          ]
        },
        "africa_lusaka?" => {
          name: "africa_lusaka?",
          description:
            "returns whether the current time zone is africa/lusaka.",
          examples: [
            "Date.africa_lusaka?",
            "Date.new(\"2024-03-05\").africa_lusaka?",
            "Time.zone = \"Etc/UTC\" Date.africa_lusaka?"
          ]
        },
        "africa_malabo?" => {
          name: "africa_malabo?",
          description:
            "returns whether the current time zone is africa/malabo.",
          examples: [
            "Date.africa_malabo?",
            "Date.new(\"2024-03-05\").africa_malabo?",
            "Time.zone = \"Etc/UTC\" Date.africa_malabo?"
          ]
        },
        "africa_maputo?" => {
          name: "africa_maputo?",
          description:
            "returns whether the current time zone is africa/maputo.",
          examples: [
            "Date.africa_maputo?",
            "Date.new(\"2024-03-05\").africa_maputo?",
            "Time.zone = \"Etc/UTC\" Date.africa_maputo?"
          ]
        },
        "africa_maseru?" => {
          name: "africa_maseru?",
          description:
            "returns whether the current time zone is africa/maseru.",
          examples: [
            "Date.africa_maseru?",
            "Date.new(\"2024-03-05\").africa_maseru?",
            "Time.zone = \"Etc/UTC\" Date.africa_maseru?"
          ]
        },
        "africa_mbabane?" => {
          name: "africa_mbabane?",
          description:
            "returns whether the current time zone is africa/mbabane.",
          examples: [
            "Date.africa_mbabane?",
            "Date.new(\"2024-03-05\").africa_mbabane?",
            "Time.zone = \"Etc/UTC\" Date.africa_mbabane?"
          ]
        },
        "africa_mogadishu?" => {
          name: "africa_mogadishu?",
          description:
            "returns whether the current time zone is africa/mogadishu.",
          examples: [
            "Date.africa_mogadishu?",
            "Date.new(\"2024-03-05\").africa_mogadishu?",
            "Time.zone = \"Etc/UTC\" Date.africa_mogadishu?"
          ]
        },
        "africa_monrovia?" => {
          name: "africa_monrovia?",
          description:
            "returns whether the current time zone is africa/monrovia.",
          examples: [
            "Date.africa_monrovia?",
            "Date.new(\"2024-03-05\").africa_monrovia?",
            "Time.zone = \"Etc/UTC\" Date.africa_monrovia?"
          ]
        },
        "africa_nairobi?" => {
          name: "africa_nairobi?",
          description:
            "returns whether the current time zone is africa/nairobi.",
          examples: [
            "Date.africa_nairobi?",
            "Date.new(\"2024-03-05\").africa_nairobi?",
            "Time.zone = \"Etc/UTC\" Date.africa_nairobi?"
          ]
        },
        "africa_ndjamena?" => {
          name: "africa_ndjamena?",
          description:
            "returns whether the current time zone is africa/ndjamena.",
          examples: [
            "Date.africa_ndjamena?",
            "Date.new(\"2024-03-05\").africa_ndjamena?",
            "Time.zone = \"Etc/UTC\" Date.africa_ndjamena?"
          ]
        },
        "africa_niamey?" => {
          name: "africa_niamey?",
          description:
            "returns whether the current time zone is africa/niamey.",
          examples: [
            "Date.africa_niamey?",
            "Date.new(\"2024-03-05\").africa_niamey?",
            "Time.zone = \"Etc/UTC\" Date.africa_niamey?"
          ]
        },
        "africa_nouakchott?" => {
          name: "africa_nouakchott?",
          description:
            "returns whether the current time zone is africa/nouakchott.",
          examples: [
            "Date.africa_nouakchott?",
            "Date.new(\"2024-03-05\").africa_nouakchott?",
            "Time.zone = \"Etc/UTC\" Date.africa_nouakchott?"
          ]
        },
        "africa_ouagadougou?" => {
          name: "africa_ouagadougou?",
          description:
            "returns whether the current time zone is africa/ouagadougou.",
          examples: [
            "Date.africa_ouagadougou?",
            "Date.new(\"2024-03-05\").africa_ouagadougou?",
            "Time.zone = \"Etc/UTC\" Date.africa_ouagadougou?"
          ]
        },
        "africa_porto_minus_novo?" => {
          name: "africa_porto_minus_novo?",
          description:
            "returns whether the current time zone is africa/porto-novo.",
          examples: [
            "Date.africa_porto_minus_novo?",
            "Date.new(\"2024-03-05\").africa_porto_minus_novo?",
            "Time.zone = \"Etc/UTC\" Date.africa_porto_minus_novo?"
          ]
        },
        "africa_sao_tome?" => {
          name: "africa_sao_tome?",
          description:
            "returns whether the current time zone is africa/sao_tome.",
          examples: [
            "Date.africa_sao_tome?",
            "Date.new(\"2024-03-05\").africa_sao_tome?",
            "Time.zone = \"Etc/UTC\" Date.africa_sao_tome?"
          ]
        },
        "africa_timbuktu?" => {
          name: "africa_timbuktu?",
          description:
            "returns whether the current time zone is africa/timbuktu.",
          examples: [
            "Date.africa_timbuktu?",
            "Date.new(\"2024-03-05\").africa_timbuktu?",
            "Time.zone = \"Etc/UTC\" Date.africa_timbuktu?"
          ]
        },
        "africa_tripoli?" => {
          name: "africa_tripoli?",
          description:
            "returns whether the current time zone is africa/tripoli.",
          examples: [
            "Date.africa_tripoli?",
            "Date.new(\"2024-03-05\").africa_tripoli?",
            "Time.zone = \"Etc/UTC\" Date.africa_tripoli?"
          ]
        },
        "africa_tunis?" => {
          name: "africa_tunis?",
          description: "returns whether the current time zone is africa/tunis.",
          examples: [
            "Date.africa_tunis?",
            "Date.new(\"2024-03-05\").africa_tunis?",
            "Time.zone = \"Etc/UTC\" Date.africa_tunis?"
          ]
        },
        "africa_windhoek?" => {
          name: "africa_windhoek?",
          description:
            "returns whether the current time zone is africa/windhoek.",
          examples: [
            "Date.africa_windhoek?",
            "Date.new(\"2024-03-05\").africa_windhoek?",
            "Time.zone = \"Etc/UTC\" Date.africa_windhoek?"
          ]
        },
        "america_adak?" => {
          name: "america_adak?",
          description: "returns whether the current time zone is america/adak.",
          examples: [
            "Date.america_adak?",
            "Date.new(\"2024-03-05\").america_adak?",
            "Time.zone = \"Etc/UTC\" Date.america_adak?"
          ]
        },
        "america_anchorage?" => {
          name: "america_anchorage?",
          description:
            "returns whether the current time zone is america/anchorage.",
          examples: [
            "Date.america_anchorage?",
            "Date.new(\"2024-03-05\").america_anchorage?",
            "Time.zone = \"Etc/UTC\" Date.america_anchorage?"
          ]
        },
        "america_anguilla?" => {
          name: "america_anguilla?",
          description:
            "returns whether the current time zone is america/anguilla.",
          examples: [
            "Date.america_anguilla?",
            "Date.new(\"2024-03-05\").america_anguilla?",
            "Time.zone = \"Etc/UTC\" Date.america_anguilla?"
          ]
        },
        "america_antigua?" => {
          name: "america_antigua?",
          description:
            "returns whether the current time zone is america/antigua.",
          examples: [
            "Date.america_antigua?",
            "Date.new(\"2024-03-05\").america_antigua?",
            "Time.zone = \"Etc/UTC\" Date.america_antigua?"
          ]
        },
        "america_araguaina?" => {
          name: "america_araguaina?",
          description:
            "returns whether the current time zone is america/araguaina.",
          examples: [
            "Date.america_araguaina?",
            "Date.new(\"2024-03-05\").america_araguaina?",
            "Time.zone = \"Etc/UTC\" Date.america_araguaina?"
          ]
        },
        "america_argentina_buenos_aires?" => {
          name: "america_argentina_buenos_aires?",
          description:
            "returns whether the current time zone is america/argentina/buenos_aires.",
          examples: [
            "Date.america_argentina_buenos_aires?",
            "Date.new(\"2024-03-05\").america_argentina_buenos_aires?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_buenos_aires?"
          ]
        },
        "america_argentina_catamarca?" => {
          name: "america_argentina_catamarca?",
          description:
            "returns whether the current time zone is america/argentina/catamarca.",
          examples: [
            "Date.america_argentina_catamarca?",
            "Date.new(\"2024-03-05\").america_argentina_catamarca?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_catamarca?"
          ]
        },
        "america_argentina_comodrivadavia?" => {
          name: "america_argentina_comodrivadavia?",
          description:
            "returns whether the current time zone is america/argentina/comodrivadavia.",
          examples: [
            "Date.america_argentina_comodrivadavia?",
            "Date.new(\"2024-03-05\").america_argentina_comodrivadavia?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_comodrivadavia?"
          ]
        },
        "america_argentina_cordoba?" => {
          name: "america_argentina_cordoba?",
          description:
            "returns whether the current time zone is america/argentina/cordoba.",
          examples: [
            "Date.america_argentina_cordoba?",
            "Date.new(\"2024-03-05\").america_argentina_cordoba?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_cordoba?"
          ]
        },
        "america_argentina_jujuy?" => {
          name: "america_argentina_jujuy?",
          description:
            "returns whether the current time zone is america/argentina/jujuy.",
          examples: [
            "Date.america_argentina_jujuy?",
            "Date.new(\"2024-03-05\").america_argentina_jujuy?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_jujuy?"
          ]
        },
        "america_argentina_la_rioja?" => {
          name: "america_argentina_la_rioja?",
          description:
            "returns whether the current time zone is america/argentina/la_rioja.",
          examples: [
            "Date.america_argentina_la_rioja?",
            "Date.new(\"2024-03-05\").america_argentina_la_rioja?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_la_rioja?"
          ]
        },
        "america_argentina_mendoza?" => {
          name: "america_argentina_mendoza?",
          description:
            "returns whether the current time zone is america/argentina/mendoza.",
          examples: [
            "Date.america_argentina_mendoza?",
            "Date.new(\"2024-03-05\").america_argentina_mendoza?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_mendoza?"
          ]
        },
        "america_argentina_rio_gallegos?" => {
          name: "america_argentina_rio_gallegos?",
          description:
            "returns whether the current time zone is america/argentina/rio_gallegos.",
          examples: [
            "Date.america_argentina_rio_gallegos?",
            "Date.new(\"2024-03-05\").america_argentina_rio_gallegos?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_rio_gallegos?"
          ]
        },
        "america_argentina_salta?" => {
          name: "america_argentina_salta?",
          description:
            "returns whether the current time zone is america/argentina/salta.",
          examples: [
            "Date.america_argentina_salta?",
            "Date.new(\"2024-03-05\").america_argentina_salta?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_salta?"
          ]
        },
        "america_argentina_san_juan?" => {
          name: "america_argentina_san_juan?",
          description:
            "returns whether the current time zone is america/argentina/san_juan.",
          examples: [
            "Date.america_argentina_san_juan?",
            "Date.new(\"2024-03-05\").america_argentina_san_juan?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_san_juan?"
          ]
        },
        "america_argentina_san_luis?" => {
          name: "america_argentina_san_luis?",
          description:
            "returns whether the current time zone is america/argentina/san_luis.",
          examples: [
            "Date.america_argentina_san_luis?",
            "Date.new(\"2024-03-05\").america_argentina_san_luis?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_san_luis?"
          ]
        },
        "america_argentina_tucuman?" => {
          name: "america_argentina_tucuman?",
          description:
            "returns whether the current time zone is america/argentina/tucuman.",
          examples: [
            "Date.america_argentina_tucuman?",
            "Date.new(\"2024-03-05\").america_argentina_tucuman?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_tucuman?"
          ]
        },
        "america_argentina_ushuaia?" => {
          name: "america_argentina_ushuaia?",
          description:
            "returns whether the current time zone is america/argentina/ushuaia.",
          examples: [
            "Date.america_argentina_ushuaia?",
            "Date.new(\"2024-03-05\").america_argentina_ushuaia?",
            "Time.zone = \"Etc/UTC\" Date.america_argentina_ushuaia?"
          ]
        },
        "america_aruba?" => {
          name: "america_aruba?",
          description:
            "returns whether the current time zone is america/aruba.",
          examples: [
            "Date.america_aruba?",
            "Date.new(\"2024-03-05\").america_aruba?",
            "Time.zone = \"Etc/UTC\" Date.america_aruba?"
          ]
        },
        "america_asuncion?" => {
          name: "america_asuncion?",
          description:
            "returns whether the current time zone is america/asuncion.",
          examples: [
            "Date.america_asuncion?",
            "Date.new(\"2024-03-05\").america_asuncion?",
            "Time.zone = \"Etc/UTC\" Date.america_asuncion?"
          ]
        },
        "america_atikokan?" => {
          name: "america_atikokan?",
          description:
            "returns whether the current time zone is america/atikokan.",
          examples: [
            "Date.america_atikokan?",
            "Date.new(\"2024-03-05\").america_atikokan?",
            "Time.zone = \"Etc/UTC\" Date.america_atikokan?"
          ]
        },
        "america_atka?" => {
          name: "america_atka?",
          description: "returns whether the current time zone is america/atka.",
          examples: [
            "Date.america_atka?",
            "Date.new(\"2024-03-05\").america_atka?",
            "Time.zone = \"Etc/UTC\" Date.america_atka?"
          ]
        },
        "america_bahia?" => {
          name: "america_bahia?",
          description:
            "returns whether the current time zone is america/bahia.",
          examples: [
            "Date.america_bahia?",
            "Date.new(\"2024-03-05\").america_bahia?",
            "Time.zone = \"Etc/UTC\" Date.america_bahia?"
          ]
        },
        "america_bahia_banderas?" => {
          name: "america_bahia_banderas?",
          description:
            "returns whether the current time zone is america/bahia_banderas.",
          examples: [
            "Date.america_bahia_banderas?",
            "Date.new(\"2024-03-05\").america_bahia_banderas?",
            "Time.zone = \"Etc/UTC\" Date.america_bahia_banderas?"
          ]
        },
        "america_barbados?" => {
          name: "america_barbados?",
          description:
            "returns whether the current time zone is america/barbados.",
          examples: [
            "Date.america_barbados?",
            "Date.new(\"2024-03-05\").america_barbados?",
            "Time.zone = \"Etc/UTC\" Date.america_barbados?"
          ]
        },
        "america_belem?" => {
          name: "america_belem?",
          description:
            "returns whether the current time zone is america/belem.",
          examples: [
            "Date.america_belem?",
            "Date.new(\"2024-03-05\").america_belem?",
            "Time.zone = \"Etc/UTC\" Date.america_belem?"
          ]
        },
        "america_belize?" => {
          name: "america_belize?",
          description:
            "returns whether the current time zone is america/belize.",
          examples: [
            "Date.america_belize?",
            "Date.new(\"2024-03-05\").america_belize?",
            "Time.zone = \"Etc/UTC\" Date.america_belize?"
          ]
        },
        "america_blanc_minus_sablon?" => {
          name: "america_blanc_minus_sablon?",
          description:
            "returns whether the current time zone is america/blanc-sablon.",
          examples: [
            "Date.america_blanc_minus_sablon?",
            "Date.new(\"2024-03-05\").america_blanc_minus_sablon?",
            "Time.zone = \"Etc/UTC\" Date.america_blanc_minus_sablon?"
          ]
        },
        "america_boa_vista?" => {
          name: "america_boa_vista?",
          description:
            "returns whether the current time zone is america/boa_vista.",
          examples: [
            "Date.america_boa_vista?",
            "Date.new(\"2024-03-05\").america_boa_vista?",
            "Time.zone = \"Etc/UTC\" Date.america_boa_vista?"
          ]
        },
        "america_bogota?" => {
          name: "america_bogota?",
          description:
            "returns whether the current time zone is america/bogota.",
          examples: [
            "Date.america_bogota?",
            "Date.new(\"2024-03-05\").america_bogota?",
            "Time.zone = \"Etc/UTC\" Date.america_bogota?"
          ]
        },
        "america_boise?" => {
          name: "america_boise?",
          description:
            "returns whether the current time zone is america/boise.",
          examples: [
            "Date.america_boise?",
            "Date.new(\"2024-03-05\").america_boise?",
            "Time.zone = \"Etc/UTC\" Date.america_boise?"
          ]
        },
        "america_buenos_aires?" => {
          name: "america_buenos_aires?",
          description:
            "returns whether the current time zone is america/buenos_aires.",
          examples: [
            "Date.america_buenos_aires?",
            "Date.new(\"2024-03-05\").america_buenos_aires?",
            "Time.zone = \"Etc/UTC\" Date.america_buenos_aires?"
          ]
        },
        "america_cambridge_bay?" => {
          name: "america_cambridge_bay?",
          description:
            "returns whether the current time zone is america/cambridge_bay.",
          examples: [
            "Date.america_cambridge_bay?",
            "Date.new(\"2024-03-05\").america_cambridge_bay?",
            "Time.zone = \"Etc/UTC\" Date.america_cambridge_bay?"
          ]
        },
        "america_campo_grande?" => {
          name: "america_campo_grande?",
          description:
            "returns whether the current time zone is america/campo_grande.",
          examples: [
            "Date.america_campo_grande?",
            "Date.new(\"2024-03-05\").america_campo_grande?",
            "Time.zone = \"Etc/UTC\" Date.america_campo_grande?"
          ]
        },
        "america_cancun?" => {
          name: "america_cancun?",
          description:
            "returns whether the current time zone is america/cancun.",
          examples: [
            "Date.america_cancun?",
            "Date.new(\"2024-03-05\").america_cancun?",
            "Time.zone = \"Etc/UTC\" Date.america_cancun?"
          ]
        },
        "america_caracas?" => {
          name: "america_caracas?",
          description:
            "returns whether the current time zone is america/caracas.",
          examples: [
            "Date.america_caracas?",
            "Date.new(\"2024-03-05\").america_caracas?",
            "Time.zone = \"Etc/UTC\" Date.america_caracas?"
          ]
        },
        "america_catamarca?" => {
          name: "america_catamarca?",
          description:
            "returns whether the current time zone is america/catamarca.",
          examples: [
            "Date.america_catamarca?",
            "Date.new(\"2024-03-05\").america_catamarca?",
            "Time.zone = \"Etc/UTC\" Date.america_catamarca?"
          ]
        },
        "america_cayenne?" => {
          name: "america_cayenne?",
          description:
            "returns whether the current time zone is america/cayenne.",
          examples: [
            "Date.america_cayenne?",
            "Date.new(\"2024-03-05\").america_cayenne?",
            "Time.zone = \"Etc/UTC\" Date.america_cayenne?"
          ]
        },
        "america_cayman?" => {
          name: "america_cayman?",
          description:
            "returns whether the current time zone is america/cayman.",
          examples: [
            "Date.america_cayman?",
            "Date.new(\"2024-03-05\").america_cayman?",
            "Time.zone = \"Etc/UTC\" Date.america_cayman?"
          ]
        },
        "america_chicago?" => {
          name: "america_chicago?",
          description:
            "returns whether the current time zone is america/chicago.",
          examples: [
            "Date.america_chicago?",
            "Date.new(\"2024-03-05\").america_chicago?",
            "Time.zone = \"Etc/UTC\" Date.america_chicago?"
          ]
        },
        "america_chihuahua?" => {
          name: "america_chihuahua?",
          description:
            "returns whether the current time zone is america/chihuahua.",
          examples: [
            "Date.america_chihuahua?",
            "Date.new(\"2024-03-05\").america_chihuahua?",
            "Time.zone = \"Etc/UTC\" Date.america_chihuahua?"
          ]
        },
        "america_ciudad_juarez?" => {
          name: "america_ciudad_juarez?",
          description:
            "returns whether the current time zone is america/ciudad_juarez.",
          examples: [
            "Date.america_ciudad_juarez?",
            "Date.new(\"2024-03-05\").america_ciudad_juarez?",
            "Time.zone = \"Etc/UTC\" Date.america_ciudad_juarez?"
          ]
        },
        "america_coral_harbour?" => {
          name: "america_coral_harbour?",
          description:
            "returns whether the current time zone is america/coral_harbour.",
          examples: [
            "Date.america_coral_harbour?",
            "Date.new(\"2024-03-05\").america_coral_harbour?",
            "Time.zone = \"Etc/UTC\" Date.america_coral_harbour?"
          ]
        },
        "america_cordoba?" => {
          name: "america_cordoba?",
          description:
            "returns whether the current time zone is america/cordoba.",
          examples: [
            "Date.america_cordoba?",
            "Date.new(\"2024-03-05\").america_cordoba?",
            "Time.zone = \"Etc/UTC\" Date.america_cordoba?"
          ]
        },
        "america_costa_rica?" => {
          name: "america_costa_rica?",
          description:
            "returns whether the current time zone is america/costa_rica.",
          examples: [
            "Date.america_costa_rica?",
            "Date.new(\"2024-03-05\").america_costa_rica?",
            "Time.zone = \"Etc/UTC\" Date.america_costa_rica?"
          ]
        },
        "america_coyhaique?" => {
          name: "america_coyhaique?",
          description:
            "returns whether the current time zone is america/coyhaique.",
          examples: [
            "Date.america_coyhaique?",
            "Date.new(\"2024-03-05\").america_coyhaique?",
            "Time.zone = \"Etc/UTC\" Date.america_coyhaique?"
          ]
        },
        "america_creston?" => {
          name: "america_creston?",
          description:
            "returns whether the current time zone is america/creston.",
          examples: [
            "Date.america_creston?",
            "Date.new(\"2024-03-05\").america_creston?",
            "Time.zone = \"Etc/UTC\" Date.america_creston?"
          ]
        },
        "america_cuiaba?" => {
          name: "america_cuiaba?",
          description:
            "returns whether the current time zone is america/cuiaba.",
          examples: [
            "Date.america_cuiaba?",
            "Date.new(\"2024-03-05\").america_cuiaba?",
            "Time.zone = \"Etc/UTC\" Date.america_cuiaba?"
          ]
        },
        "america_curacao?" => {
          name: "america_curacao?",
          description:
            "returns whether the current time zone is america/curacao.",
          examples: [
            "Date.america_curacao?",
            "Date.new(\"2024-03-05\").america_curacao?",
            "Time.zone = \"Etc/UTC\" Date.america_curacao?"
          ]
        },
        "america_danmarkshavn?" => {
          name: "america_danmarkshavn?",
          description:
            "returns whether the current time zone is america/danmarkshavn.",
          examples: [
            "Date.america_danmarkshavn?",
            "Date.new(\"2024-03-05\").america_danmarkshavn?",
            "Time.zone = \"Etc/UTC\" Date.america_danmarkshavn?"
          ]
        },
        "america_dawson?" => {
          name: "america_dawson?",
          description:
            "returns whether the current time zone is america/dawson.",
          examples: [
            "Date.america_dawson?",
            "Date.new(\"2024-03-05\").america_dawson?",
            "Time.zone = \"Etc/UTC\" Date.america_dawson?"
          ]
        },
        "america_dawson_creek?" => {
          name: "america_dawson_creek?",
          description:
            "returns whether the current time zone is america/dawson_creek.",
          examples: [
            "Date.america_dawson_creek?",
            "Date.new(\"2024-03-05\").america_dawson_creek?",
            "Time.zone = \"Etc/UTC\" Date.america_dawson_creek?"
          ]
        },
        "america_denver?" => {
          name: "america_denver?",
          description:
            "returns whether the current time zone is america/denver.",
          examples: [
            "Date.america_denver?",
            "Date.new(\"2024-03-05\").america_denver?",
            "Time.zone = \"Etc/UTC\" Date.america_denver?"
          ]
        },
        "america_detroit?" => {
          name: "america_detroit?",
          description:
            "returns whether the current time zone is america/detroit.",
          examples: [
            "Date.america_detroit?",
            "Date.new(\"2024-03-05\").america_detroit?",
            "Time.zone = \"Etc/UTC\" Date.america_detroit?"
          ]
        },
        "america_dominica?" => {
          name: "america_dominica?",
          description:
            "returns whether the current time zone is america/dominica.",
          examples: [
            "Date.america_dominica?",
            "Date.new(\"2024-03-05\").america_dominica?",
            "Time.zone = \"Etc/UTC\" Date.america_dominica?"
          ]
        },
        "america_edmonton?" => {
          name: "america_edmonton?",
          description:
            "returns whether the current time zone is america/edmonton.",
          examples: [
            "Date.america_edmonton?",
            "Date.new(\"2024-03-05\").america_edmonton?",
            "Time.zone = \"Etc/UTC\" Date.america_edmonton?"
          ]
        },
        "america_eirunepe?" => {
          name: "america_eirunepe?",
          description:
            "returns whether the current time zone is america/eirunepe.",
          examples: [
            "Date.america_eirunepe?",
            "Date.new(\"2024-03-05\").america_eirunepe?",
            "Time.zone = \"Etc/UTC\" Date.america_eirunepe?"
          ]
        },
        "america_el_salvador?" => {
          name: "america_el_salvador?",
          description:
            "returns whether the current time zone is america/el_salvador.",
          examples: [
            "Date.america_el_salvador?",
            "Date.new(\"2024-03-05\").america_el_salvador?",
            "Time.zone = \"Etc/UTC\" Date.america_el_salvador?"
          ]
        },
        "america_ensenada?" => {
          name: "america_ensenada?",
          description:
            "returns whether the current time zone is america/ensenada.",
          examples: [
            "Date.america_ensenada?",
            "Date.new(\"2024-03-05\").america_ensenada?",
            "Time.zone = \"Etc/UTC\" Date.america_ensenada?"
          ]
        },
        "america_fort_nelson?" => {
          name: "america_fort_nelson?",
          description:
            "returns whether the current time zone is america/fort_nelson.",
          examples: [
            "Date.america_fort_nelson?",
            "Date.new(\"2024-03-05\").america_fort_nelson?",
            "Time.zone = \"Etc/UTC\" Date.america_fort_nelson?"
          ]
        },
        "america_fort_wayne?" => {
          name: "america_fort_wayne?",
          description:
            "returns whether the current time zone is america/fort_wayne.",
          examples: [
            "Date.america_fort_wayne?",
            "Date.new(\"2024-03-05\").america_fort_wayne?",
            "Time.zone = \"Etc/UTC\" Date.america_fort_wayne?"
          ]
        },
        "america_fortaleza?" => {
          name: "america_fortaleza?",
          description:
            "returns whether the current time zone is america/fortaleza.",
          examples: [
            "Date.america_fortaleza?",
            "Date.new(\"2024-03-05\").america_fortaleza?",
            "Time.zone = \"Etc/UTC\" Date.america_fortaleza?"
          ]
        },
        "america_glace_bay?" => {
          name: "america_glace_bay?",
          description:
            "returns whether the current time zone is america/glace_bay.",
          examples: [
            "Date.america_glace_bay?",
            "Date.new(\"2024-03-05\").america_glace_bay?",
            "Time.zone = \"Etc/UTC\" Date.america_glace_bay?"
          ]
        },
        "america_godthab?" => {
          name: "america_godthab?",
          description:
            "returns whether the current time zone is america/godthab.",
          examples: [
            "Date.america_godthab?",
            "Date.new(\"2024-03-05\").america_godthab?",
            "Time.zone = \"Etc/UTC\" Date.america_godthab?"
          ]
        },
        "america_goose_bay?" => {
          name: "america_goose_bay?",
          description:
            "returns whether the current time zone is america/goose_bay.",
          examples: [
            "Date.america_goose_bay?",
            "Date.new(\"2024-03-05\").america_goose_bay?",
            "Time.zone = \"Etc/UTC\" Date.america_goose_bay?"
          ]
        },
        "america_grand_turk?" => {
          name: "america_grand_turk?",
          description:
            "returns whether the current time zone is america/grand_turk.",
          examples: [
            "Date.america_grand_turk?",
            "Date.new(\"2024-03-05\").america_grand_turk?",
            "Time.zone = \"Etc/UTC\" Date.america_grand_turk?"
          ]
        },
        "america_grenada?" => {
          name: "america_grenada?",
          description:
            "returns whether the current time zone is america/grenada.",
          examples: [
            "Date.america_grenada?",
            "Date.new(\"2024-03-05\").america_grenada?",
            "Time.zone = \"Etc/UTC\" Date.america_grenada?"
          ]
        },
        "america_guadeloupe?" => {
          name: "america_guadeloupe?",
          description:
            "returns whether the current time zone is america/guadeloupe.",
          examples: [
            "Date.america_guadeloupe?",
            "Date.new(\"2024-03-05\").america_guadeloupe?",
            "Time.zone = \"Etc/UTC\" Date.america_guadeloupe?"
          ]
        },
        "america_guatemala?" => {
          name: "america_guatemala?",
          description:
            "returns whether the current time zone is america/guatemala.",
          examples: [
            "Date.america_guatemala?",
            "Date.new(\"2024-03-05\").america_guatemala?",
            "Time.zone = \"Etc/UTC\" Date.america_guatemala?"
          ]
        },
        "america_guayaquil?" => {
          name: "america_guayaquil?",
          description:
            "returns whether the current time zone is america/guayaquil.",
          examples: [
            "Date.america_guayaquil?",
            "Date.new(\"2024-03-05\").america_guayaquil?",
            "Time.zone = \"Etc/UTC\" Date.america_guayaquil?"
          ]
        },
        "america_guyana?" => {
          name: "america_guyana?",
          description:
            "returns whether the current time zone is america/guyana.",
          examples: [
            "Date.america_guyana?",
            "Date.new(\"2024-03-05\").america_guyana?",
            "Time.zone = \"Etc/UTC\" Date.america_guyana?"
          ]
        },
        "america_halifax?" => {
          name: "america_halifax?",
          description:
            "returns whether the current time zone is america/halifax.",
          examples: [
            "Date.america_halifax?",
            "Date.new(\"2024-03-05\").america_halifax?",
            "Time.zone = \"Etc/UTC\" Date.america_halifax?"
          ]
        },
        "america_havana?" => {
          name: "america_havana?",
          description:
            "returns whether the current time zone is america/havana.",
          examples: [
            "Date.america_havana?",
            "Date.new(\"2024-03-05\").america_havana?",
            "Time.zone = \"Etc/UTC\" Date.america_havana?"
          ]
        },
        "america_hermosillo?" => {
          name: "america_hermosillo?",
          description:
            "returns whether the current time zone is america/hermosillo.",
          examples: [
            "Date.america_hermosillo?",
            "Date.new(\"2024-03-05\").america_hermosillo?",
            "Time.zone = \"Etc/UTC\" Date.america_hermosillo?"
          ]
        },
        "america_indiana_indianapolis?" => {
          name: "america_indiana_indianapolis?",
          description:
            "returns whether the current time zone is america/indiana/indianapolis.",
          examples: [
            "Date.america_indiana_indianapolis?",
            "Date.new(\"2024-03-05\").america_indiana_indianapolis?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_indianapolis?"
          ]
        },
        "america_indiana_knox?" => {
          name: "america_indiana_knox?",
          description:
            "returns whether the current time zone is america/indiana/knox.",
          examples: [
            "Date.america_indiana_knox?",
            "Date.new(\"2024-03-05\").america_indiana_knox?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_knox?"
          ]
        },
        "america_indiana_marengo?" => {
          name: "america_indiana_marengo?",
          description:
            "returns whether the current time zone is america/indiana/marengo.",
          examples: [
            "Date.america_indiana_marengo?",
            "Date.new(\"2024-03-05\").america_indiana_marengo?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_marengo?"
          ]
        },
        "america_indiana_petersburg?" => {
          name: "america_indiana_petersburg?",
          description:
            "returns whether the current time zone is america/indiana/petersburg.",
          examples: [
            "Date.america_indiana_petersburg?",
            "Date.new(\"2024-03-05\").america_indiana_petersburg?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_petersburg?"
          ]
        },
        "america_indiana_tell_city?" => {
          name: "america_indiana_tell_city?",
          description:
            "returns whether the current time zone is america/indiana/tell_city.",
          examples: [
            "Date.america_indiana_tell_city?",
            "Date.new(\"2024-03-05\").america_indiana_tell_city?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_tell_city?"
          ]
        },
        "america_indiana_vevay?" => {
          name: "america_indiana_vevay?",
          description:
            "returns whether the current time zone is america/indiana/vevay.",
          examples: [
            "Date.america_indiana_vevay?",
            "Date.new(\"2024-03-05\").america_indiana_vevay?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_vevay?"
          ]
        },
        "america_indiana_vincennes?" => {
          name: "america_indiana_vincennes?",
          description:
            "returns whether the current time zone is america/indiana/vincennes.",
          examples: [
            "Date.america_indiana_vincennes?",
            "Date.new(\"2024-03-05\").america_indiana_vincennes?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_vincennes?"
          ]
        },
        "america_indiana_winamac?" => {
          name: "america_indiana_winamac?",
          description:
            "returns whether the current time zone is america/indiana/winamac.",
          examples: [
            "Date.america_indiana_winamac?",
            "Date.new(\"2024-03-05\").america_indiana_winamac?",
            "Time.zone = \"Etc/UTC\" Date.america_indiana_winamac?"
          ]
        },
        "america_indianapolis?" => {
          name: "america_indianapolis?",
          description:
            "returns whether the current time zone is america/indianapolis.",
          examples: [
            "Date.america_indianapolis?",
            "Date.new(\"2024-03-05\").america_indianapolis?",
            "Time.zone = \"Etc/UTC\" Date.america_indianapolis?"
          ]
        },
        "america_inuvik?" => {
          name: "america_inuvik?",
          description:
            "returns whether the current time zone is america/inuvik.",
          examples: [
            "Date.america_inuvik?",
            "Date.new(\"2024-03-05\").america_inuvik?",
            "Time.zone = \"Etc/UTC\" Date.america_inuvik?"
          ]
        },
        "america_iqaluit?" => {
          name: "america_iqaluit?",
          description:
            "returns whether the current time zone is america/iqaluit.",
          examples: [
            "Date.america_iqaluit?",
            "Date.new(\"2024-03-05\").america_iqaluit?",
            "Time.zone = \"Etc/UTC\" Date.america_iqaluit?"
          ]
        },
        "america_jamaica?" => {
          name: "america_jamaica?",
          description:
            "returns whether the current time zone is america/jamaica.",
          examples: [
            "Date.america_jamaica?",
            "Date.new(\"2024-03-05\").america_jamaica?",
            "Time.zone = \"Etc/UTC\" Date.america_jamaica?"
          ]
        },
        "america_jujuy?" => {
          name: "america_jujuy?",
          description:
            "returns whether the current time zone is america/jujuy.",
          examples: [
            "Date.america_jujuy?",
            "Date.new(\"2024-03-05\").america_jujuy?",
            "Time.zone = \"Etc/UTC\" Date.america_jujuy?"
          ]
        },
        "america_juneau?" => {
          name: "america_juneau?",
          description:
            "returns whether the current time zone is america/juneau.",
          examples: [
            "Date.america_juneau?",
            "Date.new(\"2024-03-05\").america_juneau?",
            "Time.zone = \"Etc/UTC\" Date.america_juneau?"
          ]
        },
        "america_kentucky_louisville?" => {
          name: "america_kentucky_louisville?",
          description:
            "returns whether the current time zone is america/kentucky/louisville.",
          examples: [
            "Date.america_kentucky_louisville?",
            "Date.new(\"2024-03-05\").america_kentucky_louisville?",
            "Time.zone = \"Etc/UTC\" Date.america_kentucky_louisville?"
          ]
        },
        "america_kentucky_monticello?" => {
          name: "america_kentucky_monticello?",
          description:
            "returns whether the current time zone is america/kentucky/monticello.",
          examples: [
            "Date.america_kentucky_monticello?",
            "Date.new(\"2024-03-05\").america_kentucky_monticello?",
            "Time.zone = \"Etc/UTC\" Date.america_kentucky_monticello?"
          ]
        },
        "america_knox_in?" => {
          name: "america_knox_in?",
          description:
            "returns whether the current time zone is america/knox_in.",
          examples: [
            "Date.america_knox_in?",
            "Date.new(\"2024-03-05\").america_knox_in?",
            "Time.zone = \"Etc/UTC\" Date.america_knox_in?"
          ]
        },
        "america_kralendijk?" => {
          name: "america_kralendijk?",
          description:
            "returns whether the current time zone is america/kralendijk.",
          examples: [
            "Date.america_kralendijk?",
            "Date.new(\"2024-03-05\").america_kralendijk?",
            "Time.zone = \"Etc/UTC\" Date.america_kralendijk?"
          ]
        },
        "america_la_paz?" => {
          name: "america_la_paz?",
          description:
            "returns whether the current time zone is america/la_paz.",
          examples: [
            "Date.america_la_paz?",
            "Date.new(\"2024-03-05\").america_la_paz?",
            "Time.zone = \"Etc/UTC\" Date.america_la_paz?"
          ]
        },
        "america_lima?" => {
          name: "america_lima?",
          description: "returns whether the current time zone is america/lima.",
          examples: [
            "Date.america_lima?",
            "Date.new(\"2024-03-05\").america_lima?",
            "Time.zone = \"Etc/UTC\" Date.america_lima?"
          ]
        },
        "america_los_angeles?" => {
          name: "america_los_angeles?",
          description:
            "returns whether the current time zone is america/los_angeles.",
          examples: [
            "Date.america_los_angeles?",
            "Date.new(\"2024-03-05\").america_los_angeles?",
            "Time.zone = \"Etc/UTC\" Date.america_los_angeles?"
          ]
        },
        "america_louisville?" => {
          name: "america_louisville?",
          description:
            "returns whether the current time zone is america/louisville.",
          examples: [
            "Date.america_louisville?",
            "Date.new(\"2024-03-05\").america_louisville?",
            "Time.zone = \"Etc/UTC\" Date.america_louisville?"
          ]
        },
        "america_lower_princes?" => {
          name: "america_lower_princes?",
          description:
            "returns whether the current time zone is america/lower_princes.",
          examples: [
            "Date.america_lower_princes?",
            "Date.new(\"2024-03-05\").america_lower_princes?",
            "Time.zone = \"Etc/UTC\" Date.america_lower_princes?"
          ]
        },
        "america_maceio?" => {
          name: "america_maceio?",
          description:
            "returns whether the current time zone is america/maceio.",
          examples: [
            "Date.america_maceio?",
            "Date.new(\"2024-03-05\").america_maceio?",
            "Time.zone = \"Etc/UTC\" Date.america_maceio?"
          ]
        },
        "america_managua?" => {
          name: "america_managua?",
          description:
            "returns whether the current time zone is america/managua.",
          examples: [
            "Date.america_managua?",
            "Date.new(\"2024-03-05\").america_managua?",
            "Time.zone = \"Etc/UTC\" Date.america_managua?"
          ]
        },
        "america_manaus?" => {
          name: "america_manaus?",
          description:
            "returns whether the current time zone is america/manaus.",
          examples: [
            "Date.america_manaus?",
            "Date.new(\"2024-03-05\").america_manaus?",
            "Time.zone = \"Etc/UTC\" Date.america_manaus?"
          ]
        },
        "america_marigot?" => {
          name: "america_marigot?",
          description:
            "returns whether the current time zone is america/marigot.",
          examples: [
            "Date.america_marigot?",
            "Date.new(\"2024-03-05\").america_marigot?",
            "Time.zone = \"Etc/UTC\" Date.america_marigot?"
          ]
        },
        "america_martinique?" => {
          name: "america_martinique?",
          description:
            "returns whether the current time zone is america/martinique.",
          examples: [
            "Date.america_martinique?",
            "Date.new(\"2024-03-05\").america_martinique?",
            "Time.zone = \"Etc/UTC\" Date.america_martinique?"
          ]
        },
        "america_matamoros?" => {
          name: "america_matamoros?",
          description:
            "returns whether the current time zone is america/matamoros.",
          examples: [
            "Date.america_matamoros?",
            "Date.new(\"2024-03-05\").america_matamoros?",
            "Time.zone = \"Etc/UTC\" Date.america_matamoros?"
          ]
        },
        "america_mazatlan?" => {
          name: "america_mazatlan?",
          description:
            "returns whether the current time zone is america/mazatlan.",
          examples: [
            "Date.america_mazatlan?",
            "Date.new(\"2024-03-05\").america_mazatlan?",
            "Time.zone = \"Etc/UTC\" Date.america_mazatlan?"
          ]
        },
        "america_mendoza?" => {
          name: "america_mendoza?",
          description:
            "returns whether the current time zone is america/mendoza.",
          examples: [
            "Date.america_mendoza?",
            "Date.new(\"2024-03-05\").america_mendoza?",
            "Time.zone = \"Etc/UTC\" Date.america_mendoza?"
          ]
        },
        "america_menominee?" => {
          name: "america_menominee?",
          description:
            "returns whether the current time zone is america/menominee.",
          examples: [
            "Date.america_menominee?",
            "Date.new(\"2024-03-05\").america_menominee?",
            "Time.zone = \"Etc/UTC\" Date.america_menominee?"
          ]
        },
        "america_merida?" => {
          name: "america_merida?",
          description:
            "returns whether the current time zone is america/merida.",
          examples: [
            "Date.america_merida?",
            "Date.new(\"2024-03-05\").america_merida?",
            "Time.zone = \"Etc/UTC\" Date.america_merida?"
          ]
        },
        "america_metlakatla?" => {
          name: "america_metlakatla?",
          description:
            "returns whether the current time zone is america/metlakatla.",
          examples: [
            "Date.america_metlakatla?",
            "Date.new(\"2024-03-05\").america_metlakatla?",
            "Time.zone = \"Etc/UTC\" Date.america_metlakatla?"
          ]
        },
        "america_mexico_city?" => {
          name: "america_mexico_city?",
          description:
            "returns whether the current time zone is america/mexico_city.",
          examples: [
            "Date.america_mexico_city?",
            "Date.new(\"2024-03-05\").america_mexico_city?",
            "Time.zone = \"Etc/UTC\" Date.america_mexico_city?"
          ]
        },
        "america_miquelon?" => {
          name: "america_miquelon?",
          description:
            "returns whether the current time zone is america/miquelon.",
          examples: [
            "Date.america_miquelon?",
            "Date.new(\"2024-03-05\").america_miquelon?",
            "Time.zone = \"Etc/UTC\" Date.america_miquelon?"
          ]
        },
        "america_moncton?" => {
          name: "america_moncton?",
          description:
            "returns whether the current time zone is america/moncton.",
          examples: [
            "Date.america_moncton?",
            "Date.new(\"2024-03-05\").america_moncton?",
            "Time.zone = \"Etc/UTC\" Date.america_moncton?"
          ]
        },
        "america_monterrey?" => {
          name: "america_monterrey?",
          description:
            "returns whether the current time zone is america/monterrey.",
          examples: [
            "Date.america_monterrey?",
            "Date.new(\"2024-03-05\").america_monterrey?",
            "Time.zone = \"Etc/UTC\" Date.america_monterrey?"
          ]
        },
        "america_montevideo?" => {
          name: "america_montevideo?",
          description:
            "returns whether the current time zone is america/montevideo.",
          examples: [
            "Date.america_montevideo?",
            "Date.new(\"2024-03-05\").america_montevideo?",
            "Time.zone = \"Etc/UTC\" Date.america_montevideo?"
          ]
        },
        "america_montreal?" => {
          name: "america_montreal?",
          description:
            "returns whether the current time zone is america/montreal.",
          examples: [
            "Date.america_montreal?",
            "Date.new(\"2024-03-05\").america_montreal?",
            "Time.zone = \"Etc/UTC\" Date.america_montreal?"
          ]
        },
        "america_montserrat?" => {
          name: "america_montserrat?",
          description:
            "returns whether the current time zone is america/montserrat.",
          examples: [
            "Date.america_montserrat?",
            "Date.new(\"2024-03-05\").america_montserrat?",
            "Time.zone = \"Etc/UTC\" Date.america_montserrat?"
          ]
        },
        "america_nassau?" => {
          name: "america_nassau?",
          description:
            "returns whether the current time zone is america/nassau.",
          examples: [
            "Date.america_nassau?",
            "Date.new(\"2024-03-05\").america_nassau?",
            "Time.zone = \"Etc/UTC\" Date.america_nassau?"
          ]
        },
        "america_new_york?" => {
          name: "america_new_york?",
          description:
            "returns whether the current time zone is america/new_york.",
          examples: [
            "Date.america_new_york?",
            "Date.new(\"2024-03-05\").america_new_york?",
            "Time.zone = \"Etc/UTC\" Date.america_new_york?"
          ]
        },
        "america_nipigon?" => {
          name: "america_nipigon?",
          description:
            "returns whether the current time zone is america/nipigon.",
          examples: [
            "Date.america_nipigon?",
            "Date.new(\"2024-03-05\").america_nipigon?",
            "Time.zone = \"Etc/UTC\" Date.america_nipigon?"
          ]
        },
        "america_nome?" => {
          name: "america_nome?",
          description: "returns whether the current time zone is america/nome.",
          examples: [
            "Date.america_nome?",
            "Date.new(\"2024-03-05\").america_nome?",
            "Time.zone = \"Etc/UTC\" Date.america_nome?"
          ]
        },
        "america_noronha?" => {
          name: "america_noronha?",
          description:
            "returns whether the current time zone is america/noronha.",
          examples: [
            "Date.america_noronha?",
            "Date.new(\"2024-03-05\").america_noronha?",
            "Time.zone = \"Etc/UTC\" Date.america_noronha?"
          ]
        },
        "america_north_dakota_beulah?" => {
          name: "america_north_dakota_beulah?",
          description:
            "returns whether the current time zone is america/north_dakota/beulah.",
          examples: [
            "Date.america_north_dakota_beulah?",
            "Date.new(\"2024-03-05\").america_north_dakota_beulah?",
            "Time.zone = \"Etc/UTC\" Date.america_north_dakota_beulah?"
          ]
        },
        "america_north_dakota_center?" => {
          name: "america_north_dakota_center?",
          description:
            "returns whether the current time zone is america/north_dakota/center.",
          examples: [
            "Date.america_north_dakota_center?",
            "Date.new(\"2024-03-05\").america_north_dakota_center?",
            "Time.zone = \"Etc/UTC\" Date.america_north_dakota_center?"
          ]
        },
        "america_north_dakota_new_salem?" => {
          name: "america_north_dakota_new_salem?",
          description:
            "returns whether the current time zone is america/north_dakota/new_salem.",
          examples: [
            "Date.america_north_dakota_new_salem?",
            "Date.new(\"2024-03-05\").america_north_dakota_new_salem?",
            "Time.zone = \"Etc/UTC\" Date.america_north_dakota_new_salem?"
          ]
        },
        "america_nuuk?" => {
          name: "america_nuuk?",
          description: "returns whether the current time zone is america/nuuk.",
          examples: [
            "Date.america_nuuk?",
            "Date.new(\"2024-03-05\").america_nuuk?",
            "Time.zone = \"Etc/UTC\" Date.america_nuuk?"
          ]
        },
        "america_ojinaga?" => {
          name: "america_ojinaga?",
          description:
            "returns whether the current time zone is america/ojinaga.",
          examples: [
            "Date.america_ojinaga?",
            "Date.new(\"2024-03-05\").america_ojinaga?",
            "Time.zone = \"Etc/UTC\" Date.america_ojinaga?"
          ]
        },
        "america_panama?" => {
          name: "america_panama?",
          description:
            "returns whether the current time zone is america/panama.",
          examples: [
            "Date.america_panama?",
            "Date.new(\"2024-03-05\").america_panama?",
            "Time.zone = \"Etc/UTC\" Date.america_panama?"
          ]
        },
        "america_pangnirtung?" => {
          name: "america_pangnirtung?",
          description:
            "returns whether the current time zone is america/pangnirtung.",
          examples: [
            "Date.america_pangnirtung?",
            "Date.new(\"2024-03-05\").america_pangnirtung?",
            "Time.zone = \"Etc/UTC\" Date.america_pangnirtung?"
          ]
        },
        "america_paramaribo?" => {
          name: "america_paramaribo?",
          description:
            "returns whether the current time zone is america/paramaribo.",
          examples: [
            "Date.america_paramaribo?",
            "Date.new(\"2024-03-05\").america_paramaribo?",
            "Time.zone = \"Etc/UTC\" Date.america_paramaribo?"
          ]
        },
        "america_phoenix?" => {
          name: "america_phoenix?",
          description:
            "returns whether the current time zone is america/phoenix.",
          examples: [
            "Date.america_phoenix?",
            "Date.new(\"2024-03-05\").america_phoenix?",
            "Time.zone = \"Etc/UTC\" Date.america_phoenix?"
          ]
        },
        "america_port_minus_au_minus_prince?" => {
          name: "america_port_minus_au_minus_prince?",
          description:
            "returns whether the current time zone is america/port-au-prince.",
          examples: [
            "Date.america_port_minus_au_minus_prince?",
            "Date.new(\"2024-03-05\").america_port_minus_au_minus_prince?",
            "Time.zone = \"Etc/UTC\" Date.america_port_minus_au_minus_prince?"
          ]
        },
        "america_port_of_spain?" => {
          name: "america_port_of_spain?",
          description:
            "returns whether the current time zone is america/port_of_spain.",
          examples: [
            "Date.america_port_of_spain?",
            "Date.new(\"2024-03-05\").america_port_of_spain?",
            "Time.zone = \"Etc/UTC\" Date.america_port_of_spain?"
          ]
        },
        "america_porto_acre?" => {
          name: "america_porto_acre?",
          description:
            "returns whether the current time zone is america/porto_acre.",
          examples: [
            "Date.america_porto_acre?",
            "Date.new(\"2024-03-05\").america_porto_acre?",
            "Time.zone = \"Etc/UTC\" Date.america_porto_acre?"
          ]
        },
        "america_porto_velho?" => {
          name: "america_porto_velho?",
          description:
            "returns whether the current time zone is america/porto_velho.",
          examples: [
            "Date.america_porto_velho?",
            "Date.new(\"2024-03-05\").america_porto_velho?",
            "Time.zone = \"Etc/UTC\" Date.america_porto_velho?"
          ]
        },
        "america_puerto_rico?" => {
          name: "america_puerto_rico?",
          description:
            "returns whether the current time zone is america/puerto_rico.",
          examples: [
            "Date.america_puerto_rico?",
            "Date.new(\"2024-03-05\").america_puerto_rico?",
            "Time.zone = \"Etc/UTC\" Date.america_puerto_rico?"
          ]
        },
        "america_punta_arenas?" => {
          name: "america_punta_arenas?",
          description:
            "returns whether the current time zone is america/punta_arenas.",
          examples: [
            "Date.america_punta_arenas?",
            "Date.new(\"2024-03-05\").america_punta_arenas?",
            "Time.zone = \"Etc/UTC\" Date.america_punta_arenas?"
          ]
        },
        "america_rainy_river?" => {
          name: "america_rainy_river?",
          description:
            "returns whether the current time zone is america/rainy_river.",
          examples: [
            "Date.america_rainy_river?",
            "Date.new(\"2024-03-05\").america_rainy_river?",
            "Time.zone = \"Etc/UTC\" Date.america_rainy_river?"
          ]
        },
        "america_rankin_inlet?" => {
          name: "america_rankin_inlet?",
          description:
            "returns whether the current time zone is america/rankin_inlet.",
          examples: [
            "Date.america_rankin_inlet?",
            "Date.new(\"2024-03-05\").america_rankin_inlet?",
            "Time.zone = \"Etc/UTC\" Date.america_rankin_inlet?"
          ]
        },
        "america_recife?" => {
          name: "america_recife?",
          description:
            "returns whether the current time zone is america/recife.",
          examples: [
            "Date.america_recife?",
            "Date.new(\"2024-03-05\").america_recife?",
            "Time.zone = \"Etc/UTC\" Date.america_recife?"
          ]
        },
        "america_regina?" => {
          name: "america_regina?",
          description:
            "returns whether the current time zone is america/regina.",
          examples: [
            "Date.america_regina?",
            "Date.new(\"2024-03-05\").america_regina?",
            "Time.zone = \"Etc/UTC\" Date.america_regina?"
          ]
        },
        "america_resolute?" => {
          name: "america_resolute?",
          description:
            "returns whether the current time zone is america/resolute.",
          examples: [
            "Date.america_resolute?",
            "Date.new(\"2024-03-05\").america_resolute?",
            "Time.zone = \"Etc/UTC\" Date.america_resolute?"
          ]
        },
        "america_rio_branco?" => {
          name: "america_rio_branco?",
          description:
            "returns whether the current time zone is america/rio_branco.",
          examples: [
            "Date.america_rio_branco?",
            "Date.new(\"2024-03-05\").america_rio_branco?",
            "Time.zone = \"Etc/UTC\" Date.america_rio_branco?"
          ]
        },
        "america_rosario?" => {
          name: "america_rosario?",
          description:
            "returns whether the current time zone is america/rosario.",
          examples: [
            "Date.america_rosario?",
            "Date.new(\"2024-03-05\").america_rosario?",
            "Time.zone = \"Etc/UTC\" Date.america_rosario?"
          ]
        },
        "america_santa_isabel?" => {
          name: "america_santa_isabel?",
          description:
            "returns whether the current time zone is america/santa_isabel.",
          examples: [
            "Date.america_santa_isabel?",
            "Date.new(\"2024-03-05\").america_santa_isabel?",
            "Time.zone = \"Etc/UTC\" Date.america_santa_isabel?"
          ]
        },
        "america_santarem?" => {
          name: "america_santarem?",
          description:
            "returns whether the current time zone is america/santarem.",
          examples: [
            "Date.america_santarem?",
            "Date.new(\"2024-03-05\").america_santarem?",
            "Time.zone = \"Etc/UTC\" Date.america_santarem?"
          ]
        },
        "america_santiago?" => {
          name: "america_santiago?",
          description:
            "returns whether the current time zone is america/santiago.",
          examples: [
            "Date.america_santiago?",
            "Date.new(\"2024-03-05\").america_santiago?",
            "Time.zone = \"Etc/UTC\" Date.america_santiago?"
          ]
        },
        "america_santo_domingo?" => {
          name: "america_santo_domingo?",
          description:
            "returns whether the current time zone is america/santo_domingo.",
          examples: [
            "Date.america_santo_domingo?",
            "Date.new(\"2024-03-05\").america_santo_domingo?",
            "Time.zone = \"Etc/UTC\" Date.america_santo_domingo?"
          ]
        },
        "america_sao_paulo?" => {
          name: "america_sao_paulo?",
          description:
            "returns whether the current time zone is america/sao_paulo.",
          examples: [
            "Date.america_sao_paulo?",
            "Date.new(\"2024-03-05\").america_sao_paulo?",
            "Time.zone = \"Etc/UTC\" Date.america_sao_paulo?"
          ]
        },
        "america_scoresbysund?" => {
          name: "america_scoresbysund?",
          description:
            "returns whether the current time zone is america/scoresbysund.",
          examples: [
            "Date.america_scoresbysund?",
            "Date.new(\"2024-03-05\").america_scoresbysund?",
            "Time.zone = \"Etc/UTC\" Date.america_scoresbysund?"
          ]
        },
        "america_shiprock?" => {
          name: "america_shiprock?",
          description:
            "returns whether the current time zone is america/shiprock.",
          examples: [
            "Date.america_shiprock?",
            "Date.new(\"2024-03-05\").america_shiprock?",
            "Time.zone = \"Etc/UTC\" Date.america_shiprock?"
          ]
        },
        "america_sitka?" => {
          name: "america_sitka?",
          description:
            "returns whether the current time zone is america/sitka.",
          examples: [
            "Date.america_sitka?",
            "Date.new(\"2024-03-05\").america_sitka?",
            "Time.zone = \"Etc/UTC\" Date.america_sitka?"
          ]
        },
        "america_st_barthelemy?" => {
          name: "america_st_barthelemy?",
          description:
            "returns whether the current time zone is america/st_barthelemy.",
          examples: [
            "Date.america_st_barthelemy?",
            "Date.new(\"2024-03-05\").america_st_barthelemy?",
            "Time.zone = \"Etc/UTC\" Date.america_st_barthelemy?"
          ]
        },
        "america_st_johns?" => {
          name: "america_st_johns?",
          description:
            "returns whether the current time zone is america/st_johns.",
          examples: [
            "Date.america_st_johns?",
            "Date.new(\"2024-03-05\").america_st_johns?",
            "Time.zone = \"Etc/UTC\" Date.america_st_johns?"
          ]
        },
        "america_st_kitts?" => {
          name: "america_st_kitts?",
          description:
            "returns whether the current time zone is america/st_kitts.",
          examples: [
            "Date.america_st_kitts?",
            "Date.new(\"2024-03-05\").america_st_kitts?",
            "Time.zone = \"Etc/UTC\" Date.america_st_kitts?"
          ]
        },
        "america_st_lucia?" => {
          name: "america_st_lucia?",
          description:
            "returns whether the current time zone is america/st_lucia.",
          examples: [
            "Date.america_st_lucia?",
            "Date.new(\"2024-03-05\").america_st_lucia?",
            "Time.zone = \"Etc/UTC\" Date.america_st_lucia?"
          ]
        },
        "america_st_thomas?" => {
          name: "america_st_thomas?",
          description:
            "returns whether the current time zone is america/st_thomas.",
          examples: [
            "Date.america_st_thomas?",
            "Date.new(\"2024-03-05\").america_st_thomas?",
            "Time.zone = \"Etc/UTC\" Date.america_st_thomas?"
          ]
        },
        "america_st_vincent?" => {
          name: "america_st_vincent?",
          description:
            "returns whether the current time zone is america/st_vincent.",
          examples: [
            "Date.america_st_vincent?",
            "Date.new(\"2024-03-05\").america_st_vincent?",
            "Time.zone = \"Etc/UTC\" Date.america_st_vincent?"
          ]
        },
        "america_swift_current?" => {
          name: "america_swift_current?",
          description:
            "returns whether the current time zone is america/swift_current.",
          examples: [
            "Date.america_swift_current?",
            "Date.new(\"2024-03-05\").america_swift_current?",
            "Time.zone = \"Etc/UTC\" Date.america_swift_current?"
          ]
        },
        "america_tegucigalpa?" => {
          name: "america_tegucigalpa?",
          description:
            "returns whether the current time zone is america/tegucigalpa.",
          examples: [
            "Date.america_tegucigalpa?",
            "Date.new(\"2024-03-05\").america_tegucigalpa?",
            "Time.zone = \"Etc/UTC\" Date.america_tegucigalpa?"
          ]
        },
        "america_thule?" => {
          name: "america_thule?",
          description:
            "returns whether the current time zone is america/thule.",
          examples: [
            "Date.america_thule?",
            "Date.new(\"2024-03-05\").america_thule?",
            "Time.zone = \"Etc/UTC\" Date.america_thule?"
          ]
        },
        "america_thunder_bay?" => {
          name: "america_thunder_bay?",
          description:
            "returns whether the current time zone is america/thunder_bay.",
          examples: [
            "Date.america_thunder_bay?",
            "Date.new(\"2024-03-05\").america_thunder_bay?",
            "Time.zone = \"Etc/UTC\" Date.america_thunder_bay?"
          ]
        },
        "america_tijuana?" => {
          name: "america_tijuana?",
          description:
            "returns whether the current time zone is america/tijuana.",
          examples: [
            "Date.america_tijuana?",
            "Date.new(\"2024-03-05\").america_tijuana?",
            "Time.zone = \"Etc/UTC\" Date.america_tijuana?"
          ]
        },
        "america_toronto?" => {
          name: "america_toronto?",
          description:
            "returns whether the current time zone is america/toronto.",
          examples: [
            "Date.america_toronto?",
            "Date.new(\"2024-03-05\").america_toronto?",
            "Time.zone = \"Etc/UTC\" Date.america_toronto?"
          ]
        },
        "america_tortola?" => {
          name: "america_tortola?",
          description:
            "returns whether the current time zone is america/tortola.",
          examples: [
            "Date.america_tortola?",
            "Date.new(\"2024-03-05\").america_tortola?",
            "Time.zone = \"Etc/UTC\" Date.america_tortola?"
          ]
        },
        "america_vancouver?" => {
          name: "america_vancouver?",
          description:
            "returns whether the current time zone is america/vancouver.",
          examples: [
            "Date.america_vancouver?",
            "Date.new(\"2024-03-05\").america_vancouver?",
            "Time.zone = \"Etc/UTC\" Date.america_vancouver?"
          ]
        },
        "america_virgin?" => {
          name: "america_virgin?",
          description:
            "returns whether the current time zone is america/virgin.",
          examples: [
            "Date.america_virgin?",
            "Date.new(\"2024-03-05\").america_virgin?",
            "Time.zone = \"Etc/UTC\" Date.america_virgin?"
          ]
        },
        "america_whitehorse?" => {
          name: "america_whitehorse?",
          description:
            "returns whether the current time zone is america/whitehorse.",
          examples: [
            "Date.america_whitehorse?",
            "Date.new(\"2024-03-05\").america_whitehorse?",
            "Time.zone = \"Etc/UTC\" Date.america_whitehorse?"
          ]
        },
        "america_winnipeg?" => {
          name: "america_winnipeg?",
          description:
            "returns whether the current time zone is america/winnipeg.",
          examples: [
            "Date.america_winnipeg?",
            "Date.new(\"2024-03-05\").america_winnipeg?",
            "Time.zone = \"Etc/UTC\" Date.america_winnipeg?"
          ]
        },
        "america_yakutat?" => {
          name: "america_yakutat?",
          description:
            "returns whether the current time zone is america/yakutat.",
          examples: [
            "Date.america_yakutat?",
            "Date.new(\"2024-03-05\").america_yakutat?",
            "Time.zone = \"Etc/UTC\" Date.america_yakutat?"
          ]
        },
        "america_yellowknife?" => {
          name: "america_yellowknife?",
          description:
            "returns whether the current time zone is america/yellowknife.",
          examples: [
            "Date.america_yellowknife?",
            "Date.new(\"2024-03-05\").america_yellowknife?",
            "Time.zone = \"Etc/UTC\" Date.america_yellowknife?"
          ]
        },
        "antarctica_casey?" => {
          name: "antarctica_casey?",
          description:
            "returns whether the current time zone is antarctica/casey.",
          examples: [
            "Date.antarctica_casey?",
            "Date.new(\"2024-03-05\").antarctica_casey?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_casey?"
          ]
        },
        "antarctica_davis?" => {
          name: "antarctica_davis?",
          description:
            "returns whether the current time zone is antarctica/davis.",
          examples: [
            "Date.antarctica_davis?",
            "Date.new(\"2024-03-05\").antarctica_davis?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_davis?"
          ]
        },
        "antarctica_dumontdurville?" => {
          name: "antarctica_dumontdurville?",
          description:
            "returns whether the current time zone is antarctica/dumontdurville.",
          examples: [
            "Date.antarctica_dumontdurville?",
            "Date.new(\"2024-03-05\").antarctica_dumontdurville?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_dumontdurville?"
          ]
        },
        "antarctica_macquarie?" => {
          name: "antarctica_macquarie?",
          description:
            "returns whether the current time zone is antarctica/macquarie.",
          examples: [
            "Date.antarctica_macquarie?",
            "Date.new(\"2024-03-05\").antarctica_macquarie?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_macquarie?"
          ]
        },
        "antarctica_mawson?" => {
          name: "antarctica_mawson?",
          description:
            "returns whether the current time zone is antarctica/mawson.",
          examples: [
            "Date.antarctica_mawson?",
            "Date.new(\"2024-03-05\").antarctica_mawson?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_mawson?"
          ]
        },
        "antarctica_mcmurdo?" => {
          name: "antarctica_mcmurdo?",
          description:
            "returns whether the current time zone is antarctica/mcmurdo.",
          examples: [
            "Date.antarctica_mcmurdo?",
            "Date.new(\"2024-03-05\").antarctica_mcmurdo?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_mcmurdo?"
          ]
        },
        "antarctica_palmer?" => {
          name: "antarctica_palmer?",
          description:
            "returns whether the current time zone is antarctica/palmer.",
          examples: [
            "Date.antarctica_palmer?",
            "Date.new(\"2024-03-05\").antarctica_palmer?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_palmer?"
          ]
        },
        "antarctica_rothera?" => {
          name: "antarctica_rothera?",
          description:
            "returns whether the current time zone is antarctica/rothera.",
          examples: [
            "Date.antarctica_rothera?",
            "Date.new(\"2024-03-05\").antarctica_rothera?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_rothera?"
          ]
        },
        "antarctica_south_pole?" => {
          name: "antarctica_south_pole?",
          description:
            "returns whether the current time zone is antarctica/south_pole.",
          examples: [
            "Date.antarctica_south_pole?",
            "Date.new(\"2024-03-05\").antarctica_south_pole?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_south_pole?"
          ]
        },
        "antarctica_syowa?" => {
          name: "antarctica_syowa?",
          description:
            "returns whether the current time zone is antarctica/syowa.",
          examples: [
            "Date.antarctica_syowa?",
            "Date.new(\"2024-03-05\").antarctica_syowa?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_syowa?"
          ]
        },
        "antarctica_troll?" => {
          name: "antarctica_troll?",
          description:
            "returns whether the current time zone is antarctica/troll.",
          examples: [
            "Date.antarctica_troll?",
            "Date.new(\"2024-03-05\").antarctica_troll?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_troll?"
          ]
        },
        "antarctica_vostok?" => {
          name: "antarctica_vostok?",
          description:
            "returns whether the current time zone is antarctica/vostok.",
          examples: [
            "Date.antarctica_vostok?",
            "Date.new(\"2024-03-05\").antarctica_vostok?",
            "Time.zone = \"Etc/UTC\" Date.antarctica_vostok?"
          ]
        },
        "arctic_longyearbyen?" => {
          name: "arctic_longyearbyen?",
          description:
            "returns whether the current time zone is arctic/longyearbyen.",
          examples: [
            "Date.arctic_longyearbyen?",
            "Date.new(\"2024-03-05\").arctic_longyearbyen?",
            "Time.zone = \"Etc/UTC\" Date.arctic_longyearbyen?"
          ]
        },
        "asia_aden?" => {
          name: "asia_aden?",
          description: "returns whether the current time zone is asia/aden.",
          examples: [
            "Date.asia_aden?",
            "Date.new(\"2024-03-05\").asia_aden?",
            "Time.zone = \"Etc/UTC\" Date.asia_aden?"
          ]
        },
        "asia_almaty?" => {
          name: "asia_almaty?",
          description: "returns whether the current time zone is asia/almaty.",
          examples: [
            "Date.asia_almaty?",
            "Date.new(\"2024-03-05\").asia_almaty?",
            "Time.zone = \"Etc/UTC\" Date.asia_almaty?"
          ]
        },
        "asia_amman?" => {
          name: "asia_amman?",
          description: "returns whether the current time zone is asia/amman.",
          examples: [
            "Date.asia_amman?",
            "Date.new(\"2024-03-05\").asia_amman?",
            "Time.zone = \"Etc/UTC\" Date.asia_amman?"
          ]
        },
        "asia_anadyr?" => {
          name: "asia_anadyr?",
          description: "returns whether the current time zone is asia/anadyr.",
          examples: [
            "Date.asia_anadyr?",
            "Date.new(\"2024-03-05\").asia_anadyr?",
            "Time.zone = \"Etc/UTC\" Date.asia_anadyr?"
          ]
        },
        "asia_aqtau?" => {
          name: "asia_aqtau?",
          description: "returns whether the current time zone is asia/aqtau.",
          examples: [
            "Date.asia_aqtau?",
            "Date.new(\"2024-03-05\").asia_aqtau?",
            "Time.zone = \"Etc/UTC\" Date.asia_aqtau?"
          ]
        },
        "asia_aqtobe?" => {
          name: "asia_aqtobe?",
          description: "returns whether the current time zone is asia/aqtobe.",
          examples: [
            "Date.asia_aqtobe?",
            "Date.new(\"2024-03-05\").asia_aqtobe?",
            "Time.zone = \"Etc/UTC\" Date.asia_aqtobe?"
          ]
        },
        "asia_ashgabat?" => {
          name: "asia_ashgabat?",
          description:
            "returns whether the current time zone is asia/ashgabat.",
          examples: [
            "Date.asia_ashgabat?",
            "Date.new(\"2024-03-05\").asia_ashgabat?",
            "Time.zone = \"Etc/UTC\" Date.asia_ashgabat?"
          ]
        },
        "asia_ashkhabad?" => {
          name: "asia_ashkhabad?",
          description:
            "returns whether the current time zone is asia/ashkhabad.",
          examples: [
            "Date.asia_ashkhabad?",
            "Date.new(\"2024-03-05\").asia_ashkhabad?",
            "Time.zone = \"Etc/UTC\" Date.asia_ashkhabad?"
          ]
        },
        "asia_atyrau?" => {
          name: "asia_atyrau?",
          description: "returns whether the current time zone is asia/atyrau.",
          examples: [
            "Date.asia_atyrau?",
            "Date.new(\"2024-03-05\").asia_atyrau?",
            "Time.zone = \"Etc/UTC\" Date.asia_atyrau?"
          ]
        },
        "asia_baghdad?" => {
          name: "asia_baghdad?",
          description: "returns whether the current time zone is asia/baghdad.",
          examples: [
            "Date.asia_baghdad?",
            "Date.new(\"2024-03-05\").asia_baghdad?",
            "Time.zone = \"Etc/UTC\" Date.asia_baghdad?"
          ]
        },
        "asia_bahrain?" => {
          name: "asia_bahrain?",
          description: "returns whether the current time zone is asia/bahrain.",
          examples: [
            "Date.asia_bahrain?",
            "Date.new(\"2024-03-05\").asia_bahrain?",
            "Time.zone = \"Etc/UTC\" Date.asia_bahrain?"
          ]
        },
        "asia_baku?" => {
          name: "asia_baku?",
          description: "returns whether the current time zone is asia/baku.",
          examples: [
            "Date.asia_baku?",
            "Date.new(\"2024-03-05\").asia_baku?",
            "Time.zone = \"Etc/UTC\" Date.asia_baku?"
          ]
        },
        "asia_bangkok?" => {
          name: "asia_bangkok?",
          description: "returns whether the current time zone is asia/bangkok.",
          examples: [
            "Date.asia_bangkok?",
            "Date.new(\"2024-03-05\").asia_bangkok?",
            "Time.zone = \"Etc/UTC\" Date.asia_bangkok?"
          ]
        },
        "asia_barnaul?" => {
          name: "asia_barnaul?",
          description: "returns whether the current time zone is asia/barnaul.",
          examples: [
            "Date.asia_barnaul?",
            "Date.new(\"2024-03-05\").asia_barnaul?",
            "Time.zone = \"Etc/UTC\" Date.asia_barnaul?"
          ]
        },
        "asia_beirut?" => {
          name: "asia_beirut?",
          description: "returns whether the current time zone is asia/beirut.",
          examples: [
            "Date.asia_beirut?",
            "Date.new(\"2024-03-05\").asia_beirut?",
            "Time.zone = \"Etc/UTC\" Date.asia_beirut?"
          ]
        },
        "asia_bishkek?" => {
          name: "asia_bishkek?",
          description: "returns whether the current time zone is asia/bishkek.",
          examples: [
            "Date.asia_bishkek?",
            "Date.new(\"2024-03-05\").asia_bishkek?",
            "Time.zone = \"Etc/UTC\" Date.asia_bishkek?"
          ]
        },
        "asia_brunei?" => {
          name: "asia_brunei?",
          description: "returns whether the current time zone is asia/brunei.",
          examples: [
            "Date.asia_brunei?",
            "Date.new(\"2024-03-05\").asia_brunei?",
            "Time.zone = \"Etc/UTC\" Date.asia_brunei?"
          ]
        },
        "asia_calcutta?" => {
          name: "asia_calcutta?",
          description:
            "returns whether the current time zone is asia/calcutta.",
          examples: [
            "Date.asia_calcutta?",
            "Date.new(\"2024-03-05\").asia_calcutta?",
            "Time.zone = \"Etc/UTC\" Date.asia_calcutta?"
          ]
        },
        "asia_chita?" => {
          name: "asia_chita?",
          description: "returns whether the current time zone is asia/chita.",
          examples: [
            "Date.asia_chita?",
            "Date.new(\"2024-03-05\").asia_chita?",
            "Time.zone = \"Etc/UTC\" Date.asia_chita?"
          ]
        },
        "asia_choibalsan?" => {
          name: "asia_choibalsan?",
          description:
            "returns whether the current time zone is asia/choibalsan.",
          examples: [
            "Date.asia_choibalsan?",
            "Date.new(\"2024-03-05\").asia_choibalsan?",
            "Time.zone = \"Etc/UTC\" Date.asia_choibalsan?"
          ]
        },
        "asia_chongqing?" => {
          name: "asia_chongqing?",
          description:
            "returns whether the current time zone is asia/chongqing.",
          examples: [
            "Date.asia_chongqing?",
            "Date.new(\"2024-03-05\").asia_chongqing?",
            "Time.zone = \"Etc/UTC\" Date.asia_chongqing?"
          ]
        },
        "asia_chungking?" => {
          name: "asia_chungking?",
          description:
            "returns whether the current time zone is asia/chungking.",
          examples: [
            "Date.asia_chungking?",
            "Date.new(\"2024-03-05\").asia_chungking?",
            "Time.zone = \"Etc/UTC\" Date.asia_chungking?"
          ]
        },
        "asia_colombo?" => {
          name: "asia_colombo?",
          description: "returns whether the current time zone is asia/colombo.",
          examples: [
            "Date.asia_colombo?",
            "Date.new(\"2024-03-05\").asia_colombo?",
            "Time.zone = \"Etc/UTC\" Date.asia_colombo?"
          ]
        },
        "asia_dacca?" => {
          name: "asia_dacca?",
          description: "returns whether the current time zone is asia/dacca.",
          examples: [
            "Date.asia_dacca?",
            "Date.new(\"2024-03-05\").asia_dacca?",
            "Time.zone = \"Etc/UTC\" Date.asia_dacca?"
          ]
        },
        "asia_damascus?" => {
          name: "asia_damascus?",
          description:
            "returns whether the current time zone is asia/damascus.",
          examples: [
            "Date.asia_damascus?",
            "Date.new(\"2024-03-05\").asia_damascus?",
            "Time.zone = \"Etc/UTC\" Date.asia_damascus?"
          ]
        },
        "asia_dhaka?" => {
          name: "asia_dhaka?",
          description: "returns whether the current time zone is asia/dhaka.",
          examples: [
            "Date.asia_dhaka?",
            "Date.new(\"2024-03-05\").asia_dhaka?",
            "Time.zone = \"Etc/UTC\" Date.asia_dhaka?"
          ]
        },
        "asia_dili?" => {
          name: "asia_dili?",
          description: "returns whether the current time zone is asia/dili.",
          examples: [
            "Date.asia_dili?",
            "Date.new(\"2024-03-05\").asia_dili?",
            "Time.zone = \"Etc/UTC\" Date.asia_dili?"
          ]
        },
        "asia_dubai?" => {
          name: "asia_dubai?",
          description: "returns whether the current time zone is asia/dubai.",
          examples: [
            "Date.asia_dubai?",
            "Date.new(\"2024-03-05\").asia_dubai?",
            "Time.zone = \"Etc/UTC\" Date.asia_dubai?"
          ]
        },
        "asia_dushanbe?" => {
          name: "asia_dushanbe?",
          description:
            "returns whether the current time zone is asia/dushanbe.",
          examples: [
            "Date.asia_dushanbe?",
            "Date.new(\"2024-03-05\").asia_dushanbe?",
            "Time.zone = \"Etc/UTC\" Date.asia_dushanbe?"
          ]
        },
        "asia_famagusta?" => {
          name: "asia_famagusta?",
          description:
            "returns whether the current time zone is asia/famagusta.",
          examples: [
            "Date.asia_famagusta?",
            "Date.new(\"2024-03-05\").asia_famagusta?",
            "Time.zone = \"Etc/UTC\" Date.asia_famagusta?"
          ]
        },
        "asia_gaza?" => {
          name: "asia_gaza?",
          description: "returns whether the current time zone is asia/gaza.",
          examples: [
            "Date.asia_gaza?",
            "Date.new(\"2024-03-05\").asia_gaza?",
            "Time.zone = \"Etc/UTC\" Date.asia_gaza?"
          ]
        },
        "asia_harbin?" => {
          name: "asia_harbin?",
          description: "returns whether the current time zone is asia/harbin.",
          examples: [
            "Date.asia_harbin?",
            "Date.new(\"2024-03-05\").asia_harbin?",
            "Time.zone = \"Etc/UTC\" Date.asia_harbin?"
          ]
        },
        "asia_hebron?" => {
          name: "asia_hebron?",
          description: "returns whether the current time zone is asia/hebron.",
          examples: [
            "Date.asia_hebron?",
            "Date.new(\"2024-03-05\").asia_hebron?",
            "Time.zone = \"Etc/UTC\" Date.asia_hebron?"
          ]
        },
        "asia_ho_chi_minh?" => {
          name: "asia_ho_chi_minh?",
          description:
            "returns whether the current time zone is asia/ho_chi_minh.",
          examples: [
            "Date.asia_ho_chi_minh?",
            "Date.new(\"2024-03-05\").asia_ho_chi_minh?",
            "Time.zone = \"Etc/UTC\" Date.asia_ho_chi_minh?"
          ]
        },
        "asia_hong_kong?" => {
          name: "asia_hong_kong?",
          description:
            "returns whether the current time zone is asia/hong_kong.",
          examples: [
            "Date.asia_hong_kong?",
            "Date.new(\"2024-03-05\").asia_hong_kong?",
            "Time.zone = \"Etc/UTC\" Date.asia_hong_kong?"
          ]
        },
        "asia_hovd?" => {
          name: "asia_hovd?",
          description: "returns whether the current time zone is asia/hovd.",
          examples: [
            "Date.asia_hovd?",
            "Date.new(\"2024-03-05\").asia_hovd?",
            "Time.zone = \"Etc/UTC\" Date.asia_hovd?"
          ]
        },
        "asia_irkutsk?" => {
          name: "asia_irkutsk?",
          description: "returns whether the current time zone is asia/irkutsk.",
          examples: [
            "Date.asia_irkutsk?",
            "Date.new(\"2024-03-05\").asia_irkutsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_irkutsk?"
          ]
        },
        "asia_istanbul?" => {
          name: "asia_istanbul?",
          description:
            "returns whether the current time zone is asia/istanbul.",
          examples: [
            "Date.asia_istanbul?",
            "Date.new(\"2024-03-05\").asia_istanbul?",
            "Time.zone = \"Etc/UTC\" Date.asia_istanbul?"
          ]
        },
        "asia_jakarta?" => {
          name: "asia_jakarta?",
          description: "returns whether the current time zone is asia/jakarta.",
          examples: [
            "Date.asia_jakarta?",
            "Date.new(\"2024-03-05\").asia_jakarta?",
            "Time.zone = \"Etc/UTC\" Date.asia_jakarta?"
          ]
        },
        "asia_jayapura?" => {
          name: "asia_jayapura?",
          description:
            "returns whether the current time zone is asia/jayapura.",
          examples: [
            "Date.asia_jayapura?",
            "Date.new(\"2024-03-05\").asia_jayapura?",
            "Time.zone = \"Etc/UTC\" Date.asia_jayapura?"
          ]
        },
        "asia_jerusalem?" => {
          name: "asia_jerusalem?",
          description:
            "returns whether the current time zone is asia/jerusalem.",
          examples: [
            "Date.asia_jerusalem?",
            "Date.new(\"2024-03-05\").asia_jerusalem?",
            "Time.zone = \"Etc/UTC\" Date.asia_jerusalem?"
          ]
        },
        "asia_kabul?" => {
          name: "asia_kabul?",
          description: "returns whether the current time zone is asia/kabul.",
          examples: [
            "Date.asia_kabul?",
            "Date.new(\"2024-03-05\").asia_kabul?",
            "Time.zone = \"Etc/UTC\" Date.asia_kabul?"
          ]
        },
        "asia_kamchatka?" => {
          name: "asia_kamchatka?",
          description:
            "returns whether the current time zone is asia/kamchatka.",
          examples: [
            "Date.asia_kamchatka?",
            "Date.new(\"2024-03-05\").asia_kamchatka?",
            "Time.zone = \"Etc/UTC\" Date.asia_kamchatka?"
          ]
        },
        "asia_karachi?" => {
          name: "asia_karachi?",
          description: "returns whether the current time zone is asia/karachi.",
          examples: [
            "Date.asia_karachi?",
            "Date.new(\"2024-03-05\").asia_karachi?",
            "Time.zone = \"Etc/UTC\" Date.asia_karachi?"
          ]
        },
        "asia_kashgar?" => {
          name: "asia_kashgar?",
          description: "returns whether the current time zone is asia/kashgar.",
          examples: [
            "Date.asia_kashgar?",
            "Date.new(\"2024-03-05\").asia_kashgar?",
            "Time.zone = \"Etc/UTC\" Date.asia_kashgar?"
          ]
        },
        "asia_kathmandu?" => {
          name: "asia_kathmandu?",
          description:
            "returns whether the current time zone is asia/kathmandu.",
          examples: [
            "Date.asia_kathmandu?",
            "Date.new(\"2024-03-05\").asia_kathmandu?",
            "Time.zone = \"Etc/UTC\" Date.asia_kathmandu?"
          ]
        },
        "asia_katmandu?" => {
          name: "asia_katmandu?",
          description:
            "returns whether the current time zone is asia/katmandu.",
          examples: [
            "Date.asia_katmandu?",
            "Date.new(\"2024-03-05\").asia_katmandu?",
            "Time.zone = \"Etc/UTC\" Date.asia_katmandu?"
          ]
        },
        "asia_khandyga?" => {
          name: "asia_khandyga?",
          description:
            "returns whether the current time zone is asia/khandyga.",
          examples: [
            "Date.asia_khandyga?",
            "Date.new(\"2024-03-05\").asia_khandyga?",
            "Time.zone = \"Etc/UTC\" Date.asia_khandyga?"
          ]
        },
        "asia_kolkata?" => {
          name: "asia_kolkata?",
          description: "returns whether the current time zone is asia/kolkata.",
          examples: [
            "Date.asia_kolkata?",
            "Date.new(\"2024-03-05\").asia_kolkata?",
            "Time.zone = \"Etc/UTC\" Date.asia_kolkata?"
          ]
        },
        "asia_krasnoyarsk?" => {
          name: "asia_krasnoyarsk?",
          description:
            "returns whether the current time zone is asia/krasnoyarsk.",
          examples: [
            "Date.asia_krasnoyarsk?",
            "Date.new(\"2024-03-05\").asia_krasnoyarsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_krasnoyarsk?"
          ]
        },
        "asia_kuala_lumpur?" => {
          name: "asia_kuala_lumpur?",
          description:
            "returns whether the current time zone is asia/kuala_lumpur.",
          examples: [
            "Date.asia_kuala_lumpur?",
            "Date.new(\"2024-03-05\").asia_kuala_lumpur?",
            "Time.zone = \"Etc/UTC\" Date.asia_kuala_lumpur?"
          ]
        },
        "asia_kuching?" => {
          name: "asia_kuching?",
          description: "returns whether the current time zone is asia/kuching.",
          examples: [
            "Date.asia_kuching?",
            "Date.new(\"2024-03-05\").asia_kuching?",
            "Time.zone = \"Etc/UTC\" Date.asia_kuching?"
          ]
        },
        "asia_kuwait?" => {
          name: "asia_kuwait?",
          description: "returns whether the current time zone is asia/kuwait.",
          examples: [
            "Date.asia_kuwait?",
            "Date.new(\"2024-03-05\").asia_kuwait?",
            "Time.zone = \"Etc/UTC\" Date.asia_kuwait?"
          ]
        },
        "asia_macao?" => {
          name: "asia_macao?",
          description: "returns whether the current time zone is asia/macao.",
          examples: [
            "Date.asia_macao?",
            "Date.new(\"2024-03-05\").asia_macao?",
            "Time.zone = \"Etc/UTC\" Date.asia_macao?"
          ]
        },
        "asia_macau?" => {
          name: "asia_macau?",
          description: "returns whether the current time zone is asia/macau.",
          examples: [
            "Date.asia_macau?",
            "Date.new(\"2024-03-05\").asia_macau?",
            "Time.zone = \"Etc/UTC\" Date.asia_macau?"
          ]
        },
        "asia_magadan?" => {
          name: "asia_magadan?",
          description: "returns whether the current time zone is asia/magadan.",
          examples: [
            "Date.asia_magadan?",
            "Date.new(\"2024-03-05\").asia_magadan?",
            "Time.zone = \"Etc/UTC\" Date.asia_magadan?"
          ]
        },
        "asia_makassar?" => {
          name: "asia_makassar?",
          description:
            "returns whether the current time zone is asia/makassar.",
          examples: [
            "Date.asia_makassar?",
            "Date.new(\"2024-03-05\").asia_makassar?",
            "Time.zone = \"Etc/UTC\" Date.asia_makassar?"
          ]
        },
        "asia_manila?" => {
          name: "asia_manila?",
          description: "returns whether the current time zone is asia/manila.",
          examples: [
            "Date.asia_manila?",
            "Date.new(\"2024-03-05\").asia_manila?",
            "Time.zone = \"Etc/UTC\" Date.asia_manila?"
          ]
        },
        "asia_muscat?" => {
          name: "asia_muscat?",
          description: "returns whether the current time zone is asia/muscat.",
          examples: [
            "Date.asia_muscat?",
            "Date.new(\"2024-03-05\").asia_muscat?",
            "Time.zone = \"Etc/UTC\" Date.asia_muscat?"
          ]
        },
        "asia_nicosia?" => {
          name: "asia_nicosia?",
          description: "returns whether the current time zone is asia/nicosia.",
          examples: [
            "Date.asia_nicosia?",
            "Date.new(\"2024-03-05\").asia_nicosia?",
            "Time.zone = \"Etc/UTC\" Date.asia_nicosia?"
          ]
        },
        "asia_novokuznetsk?" => {
          name: "asia_novokuznetsk?",
          description:
            "returns whether the current time zone is asia/novokuznetsk.",
          examples: [
            "Date.asia_novokuznetsk?",
            "Date.new(\"2024-03-05\").asia_novokuznetsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_novokuznetsk?"
          ]
        },
        "asia_novosibirsk?" => {
          name: "asia_novosibirsk?",
          description:
            "returns whether the current time zone is asia/novosibirsk.",
          examples: [
            "Date.asia_novosibirsk?",
            "Date.new(\"2024-03-05\").asia_novosibirsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_novosibirsk?"
          ]
        },
        "asia_omsk?" => {
          name: "asia_omsk?",
          description: "returns whether the current time zone is asia/omsk.",
          examples: [
            "Date.asia_omsk?",
            "Date.new(\"2024-03-05\").asia_omsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_omsk?"
          ]
        },
        "asia_oral?" => {
          name: "asia_oral?",
          description: "returns whether the current time zone is asia/oral.",
          examples: [
            "Date.asia_oral?",
            "Date.new(\"2024-03-05\").asia_oral?",
            "Time.zone = \"Etc/UTC\" Date.asia_oral?"
          ]
        },
        "asia_phnom_penh?" => {
          name: "asia_phnom_penh?",
          description:
            "returns whether the current time zone is asia/phnom_penh.",
          examples: [
            "Date.asia_phnom_penh?",
            "Date.new(\"2024-03-05\").asia_phnom_penh?",
            "Time.zone = \"Etc/UTC\" Date.asia_phnom_penh?"
          ]
        },
        "asia_pontianak?" => {
          name: "asia_pontianak?",
          description:
            "returns whether the current time zone is asia/pontianak.",
          examples: [
            "Date.asia_pontianak?",
            "Date.new(\"2024-03-05\").asia_pontianak?",
            "Time.zone = \"Etc/UTC\" Date.asia_pontianak?"
          ]
        },
        "asia_pyongyang?" => {
          name: "asia_pyongyang?",
          description:
            "returns whether the current time zone is asia/pyongyang.",
          examples: [
            "Date.asia_pyongyang?",
            "Date.new(\"2024-03-05\").asia_pyongyang?",
            "Time.zone = \"Etc/UTC\" Date.asia_pyongyang?"
          ]
        },
        "asia_qatar?" => {
          name: "asia_qatar?",
          description: "returns whether the current time zone is asia/qatar.",
          examples: [
            "Date.asia_qatar?",
            "Date.new(\"2024-03-05\").asia_qatar?",
            "Time.zone = \"Etc/UTC\" Date.asia_qatar?"
          ]
        },
        "asia_qostanay?" => {
          name: "asia_qostanay?",
          description:
            "returns whether the current time zone is asia/qostanay.",
          examples: [
            "Date.asia_qostanay?",
            "Date.new(\"2024-03-05\").asia_qostanay?",
            "Time.zone = \"Etc/UTC\" Date.asia_qostanay?"
          ]
        },
        "asia_qyzylorda?" => {
          name: "asia_qyzylorda?",
          description:
            "returns whether the current time zone is asia/qyzylorda.",
          examples: [
            "Date.asia_qyzylorda?",
            "Date.new(\"2024-03-05\").asia_qyzylorda?",
            "Time.zone = \"Etc/UTC\" Date.asia_qyzylorda?"
          ]
        },
        "asia_rangoon?" => {
          name: "asia_rangoon?",
          description: "returns whether the current time zone is asia/rangoon.",
          examples: [
            "Date.asia_rangoon?",
            "Date.new(\"2024-03-05\").asia_rangoon?",
            "Time.zone = \"Etc/UTC\" Date.asia_rangoon?"
          ]
        },
        "asia_riyadh?" => {
          name: "asia_riyadh?",
          description: "returns whether the current time zone is asia/riyadh.",
          examples: [
            "Date.asia_riyadh?",
            "Date.new(\"2024-03-05\").asia_riyadh?",
            "Time.zone = \"Etc/UTC\" Date.asia_riyadh?"
          ]
        },
        "asia_saigon?" => {
          name: "asia_saigon?",
          description: "returns whether the current time zone is asia/saigon.",
          examples: [
            "Date.asia_saigon?",
            "Date.new(\"2024-03-05\").asia_saigon?",
            "Time.zone = \"Etc/UTC\" Date.asia_saigon?"
          ]
        },
        "asia_sakhalin?" => {
          name: "asia_sakhalin?",
          description:
            "returns whether the current time zone is asia/sakhalin.",
          examples: [
            "Date.asia_sakhalin?",
            "Date.new(\"2024-03-05\").asia_sakhalin?",
            "Time.zone = \"Etc/UTC\" Date.asia_sakhalin?"
          ]
        },
        "asia_samarkand?" => {
          name: "asia_samarkand?",
          description:
            "returns whether the current time zone is asia/samarkand.",
          examples: [
            "Date.asia_samarkand?",
            "Date.new(\"2024-03-05\").asia_samarkand?",
            "Time.zone = \"Etc/UTC\" Date.asia_samarkand?"
          ]
        },
        "asia_seoul?" => {
          name: "asia_seoul?",
          description: "returns whether the current time zone is asia/seoul.",
          examples: [
            "Date.asia_seoul?",
            "Date.new(\"2024-03-05\").asia_seoul?",
            "Time.zone = \"Etc/UTC\" Date.asia_seoul?"
          ]
        },
        "asia_shanghai?" => {
          name: "asia_shanghai?",
          description:
            "returns whether the current time zone is asia/shanghai.",
          examples: [
            "Date.asia_shanghai?",
            "Date.new(\"2024-03-05\").asia_shanghai?",
            "Time.zone = \"Etc/UTC\" Date.asia_shanghai?"
          ]
        },
        "asia_singapore?" => {
          name: "asia_singapore?",
          description:
            "returns whether the current time zone is asia/singapore.",
          examples: [
            "Date.asia_singapore?",
            "Date.new(\"2024-03-05\").asia_singapore?",
            "Time.zone = \"Etc/UTC\" Date.asia_singapore?"
          ]
        },
        "asia_srednekolymsk?" => {
          name: "asia_srednekolymsk?",
          description:
            "returns whether the current time zone is asia/srednekolymsk.",
          examples: [
            "Date.asia_srednekolymsk?",
            "Date.new(\"2024-03-05\").asia_srednekolymsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_srednekolymsk?"
          ]
        },
        "asia_taipei?" => {
          name: "asia_taipei?",
          description: "returns whether the current time zone is asia/taipei.",
          examples: [
            "Date.asia_taipei?",
            "Date.new(\"2024-03-05\").asia_taipei?",
            "Time.zone = \"Etc/UTC\" Date.asia_taipei?"
          ]
        },
        "asia_tashkent?" => {
          name: "asia_tashkent?",
          description:
            "returns whether the current time zone is asia/tashkent.",
          examples: [
            "Date.asia_tashkent?",
            "Date.new(\"2024-03-05\").asia_tashkent?",
            "Time.zone = \"Etc/UTC\" Date.asia_tashkent?"
          ]
        },
        "asia_tbilisi?" => {
          name: "asia_tbilisi?",
          description: "returns whether the current time zone is asia/tbilisi.",
          examples: [
            "Date.asia_tbilisi?",
            "Date.new(\"2024-03-05\").asia_tbilisi?",
            "Time.zone = \"Etc/UTC\" Date.asia_tbilisi?"
          ]
        },
        "asia_tehran?" => {
          name: "asia_tehran?",
          description: "returns whether the current time zone is asia/tehran.",
          examples: [
            "Date.asia_tehran?",
            "Date.new(\"2024-03-05\").asia_tehran?",
            "Time.zone = \"Etc/UTC\" Date.asia_tehran?"
          ]
        },
        "asia_tel_aviv?" => {
          name: "asia_tel_aviv?",
          description:
            "returns whether the current time zone is asia/tel_aviv.",
          examples: [
            "Date.asia_tel_aviv?",
            "Date.new(\"2024-03-05\").asia_tel_aviv?",
            "Time.zone = \"Etc/UTC\" Date.asia_tel_aviv?"
          ]
        },
        "asia_thimbu?" => {
          name: "asia_thimbu?",
          description: "returns whether the current time zone is asia/thimbu.",
          examples: [
            "Date.asia_thimbu?",
            "Date.new(\"2024-03-05\").asia_thimbu?",
            "Time.zone = \"Etc/UTC\" Date.asia_thimbu?"
          ]
        },
        "asia_thimphu?" => {
          name: "asia_thimphu?",
          description: "returns whether the current time zone is asia/thimphu.",
          examples: [
            "Date.asia_thimphu?",
            "Date.new(\"2024-03-05\").asia_thimphu?",
            "Time.zone = \"Etc/UTC\" Date.asia_thimphu?"
          ]
        },
        "asia_tokyo?" => {
          name: "asia_tokyo?",
          description: "returns whether the current time zone is asia/tokyo.",
          examples: [
            "Date.asia_tokyo?",
            "Date.new(\"2024-03-05\").asia_tokyo?",
            "Time.zone = \"Etc/UTC\" Date.asia_tokyo?"
          ]
        },
        "asia_tomsk?" => {
          name: "asia_tomsk?",
          description: "returns whether the current time zone is asia/tomsk.",
          examples: [
            "Date.asia_tomsk?",
            "Date.new(\"2024-03-05\").asia_tomsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_tomsk?"
          ]
        },
        "asia_ujung_pandang?" => {
          name: "asia_ujung_pandang?",
          description:
            "returns whether the current time zone is asia/ujung_pandang.",
          examples: [
            "Date.asia_ujung_pandang?",
            "Date.new(\"2024-03-05\").asia_ujung_pandang?",
            "Time.zone = \"Etc/UTC\" Date.asia_ujung_pandang?"
          ]
        },
        "asia_ulaanbaatar?" => {
          name: "asia_ulaanbaatar?",
          description:
            "returns whether the current time zone is asia/ulaanbaatar.",
          examples: [
            "Date.asia_ulaanbaatar?",
            "Date.new(\"2024-03-05\").asia_ulaanbaatar?",
            "Time.zone = \"Etc/UTC\" Date.asia_ulaanbaatar?"
          ]
        },
        "asia_ulan_bator?" => {
          name: "asia_ulan_bator?",
          description:
            "returns whether the current time zone is asia/ulan_bator.",
          examples: [
            "Date.asia_ulan_bator?",
            "Date.new(\"2024-03-05\").asia_ulan_bator?",
            "Time.zone = \"Etc/UTC\" Date.asia_ulan_bator?"
          ]
        },
        "asia_urumqi?" => {
          name: "asia_urumqi?",
          description: "returns whether the current time zone is asia/urumqi.",
          examples: [
            "Date.asia_urumqi?",
            "Date.new(\"2024-03-05\").asia_urumqi?",
            "Time.zone = \"Etc/UTC\" Date.asia_urumqi?"
          ]
        },
        "asia_ust_minus_nera?" => {
          name: "asia_ust_minus_nera?",
          description:
            "returns whether the current time zone is asia/ust-nera.",
          examples: [
            "Date.asia_ust_minus_nera?",
            "Date.new(\"2024-03-05\").asia_ust_minus_nera?",
            "Time.zone = \"Etc/UTC\" Date.asia_ust_minus_nera?"
          ]
        },
        "asia_vientiane?" => {
          name: "asia_vientiane?",
          description:
            "returns whether the current time zone is asia/vientiane.",
          examples: [
            "Date.asia_vientiane?",
            "Date.new(\"2024-03-05\").asia_vientiane?",
            "Time.zone = \"Etc/UTC\" Date.asia_vientiane?"
          ]
        },
        "asia_vladivostok?" => {
          name: "asia_vladivostok?",
          description:
            "returns whether the current time zone is asia/vladivostok.",
          examples: [
            "Date.asia_vladivostok?",
            "Date.new(\"2024-03-05\").asia_vladivostok?",
            "Time.zone = \"Etc/UTC\" Date.asia_vladivostok?"
          ]
        },
        "asia_yakutsk?" => {
          name: "asia_yakutsk?",
          description: "returns whether the current time zone is asia/yakutsk.",
          examples: [
            "Date.asia_yakutsk?",
            "Date.new(\"2024-03-05\").asia_yakutsk?",
            "Time.zone = \"Etc/UTC\" Date.asia_yakutsk?"
          ]
        },
        "asia_yangon?" => {
          name: "asia_yangon?",
          description: "returns whether the current time zone is asia/yangon.",
          examples: [
            "Date.asia_yangon?",
            "Date.new(\"2024-03-05\").asia_yangon?",
            "Time.zone = \"Etc/UTC\" Date.asia_yangon?"
          ]
        },
        "asia_yekaterinburg?" => {
          name: "asia_yekaterinburg?",
          description:
            "returns whether the current time zone is asia/yekaterinburg.",
          examples: [
            "Date.asia_yekaterinburg?",
            "Date.new(\"2024-03-05\").asia_yekaterinburg?",
            "Time.zone = \"Etc/UTC\" Date.asia_yekaterinburg?"
          ]
        },
        "asia_yerevan?" => {
          name: "asia_yerevan?",
          description: "returns whether the current time zone is asia/yerevan.",
          examples: [
            "Date.asia_yerevan?",
            "Date.new(\"2024-03-05\").asia_yerevan?",
            "Time.zone = \"Etc/UTC\" Date.asia_yerevan?"
          ]
        },
        "atlantic_azores?" => {
          name: "atlantic_azores?",
          description:
            "returns whether the current time zone is atlantic/azores.",
          examples: [
            "Date.atlantic_azores?",
            "Date.new(\"2024-03-05\").atlantic_azores?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_azores?"
          ]
        },
        "atlantic_bermuda?" => {
          name: "atlantic_bermuda?",
          description:
            "returns whether the current time zone is atlantic/bermuda.",
          examples: [
            "Date.atlantic_bermuda?",
            "Date.new(\"2024-03-05\").atlantic_bermuda?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_bermuda?"
          ]
        },
        "atlantic_canary?" => {
          name: "atlantic_canary?",
          description:
            "returns whether the current time zone is atlantic/canary.",
          examples: [
            "Date.atlantic_canary?",
            "Date.new(\"2024-03-05\").atlantic_canary?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_canary?"
          ]
        },
        "atlantic_cape_verde?" => {
          name: "atlantic_cape_verde?",
          description:
            "returns whether the current time zone is atlantic/cape_verde.",
          examples: [
            "Date.atlantic_cape_verde?",
            "Date.new(\"2024-03-05\").atlantic_cape_verde?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_cape_verde?"
          ]
        },
        "atlantic_faeroe?" => {
          name: "atlantic_faeroe?",
          description:
            "returns whether the current time zone is atlantic/faeroe.",
          examples: [
            "Date.atlantic_faeroe?",
            "Date.new(\"2024-03-05\").atlantic_faeroe?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_faeroe?"
          ]
        },
        "atlantic_faroe?" => {
          name: "atlantic_faroe?",
          description:
            "returns whether the current time zone is atlantic/faroe.",
          examples: [
            "Date.atlantic_faroe?",
            "Date.new(\"2024-03-05\").atlantic_faroe?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_faroe?"
          ]
        },
        "atlantic_jan_mayen?" => {
          name: "atlantic_jan_mayen?",
          description:
            "returns whether the current time zone is atlantic/jan_mayen.",
          examples: [
            "Date.atlantic_jan_mayen?",
            "Date.new(\"2024-03-05\").atlantic_jan_mayen?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_jan_mayen?"
          ]
        },
        "atlantic_madeira?" => {
          name: "atlantic_madeira?",
          description:
            "returns whether the current time zone is atlantic/madeira.",
          examples: [
            "Date.atlantic_madeira?",
            "Date.new(\"2024-03-05\").atlantic_madeira?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_madeira?"
          ]
        },
        "atlantic_reykjavik?" => {
          name: "atlantic_reykjavik?",
          description:
            "returns whether the current time zone is atlantic/reykjavik.",
          examples: [
            "Date.atlantic_reykjavik?",
            "Date.new(\"2024-03-05\").atlantic_reykjavik?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_reykjavik?"
          ]
        },
        "atlantic_south_georgia?" => {
          name: "atlantic_south_georgia?",
          description:
            "returns whether the current time zone is atlantic/south_georgia.",
          examples: [
            "Date.atlantic_south_georgia?",
            "Date.new(\"2024-03-05\").atlantic_south_georgia?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_south_georgia?"
          ]
        },
        "atlantic_st_helena?" => {
          name: "atlantic_st_helena?",
          description:
            "returns whether the current time zone is atlantic/st_helena.",
          examples: [
            "Date.atlantic_st_helena?",
            "Date.new(\"2024-03-05\").atlantic_st_helena?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_st_helena?"
          ]
        },
        "atlantic_stanley?" => {
          name: "atlantic_stanley?",
          description:
            "returns whether the current time zone is atlantic/stanley.",
          examples: [
            "Date.atlantic_stanley?",
            "Date.new(\"2024-03-05\").atlantic_stanley?",
            "Time.zone = \"Etc/UTC\" Date.atlantic_stanley?"
          ]
        },
        "australia_act?" => {
          name: "australia_act?",
          description:
            "returns whether the current time zone is australia/act.",
          examples: [
            "Date.australia_act?",
            "Date.new(\"2024-03-05\").australia_act?",
            "Time.zone = \"Etc/UTC\" Date.australia_act?"
          ]
        },
        "australia_adelaide?" => {
          name: "australia_adelaide?",
          description:
            "returns whether the current time zone is australia/adelaide.",
          examples: [
            "Date.australia_adelaide?",
            "Date.new(\"2024-03-05\").australia_adelaide?",
            "Time.zone = \"Etc/UTC\" Date.australia_adelaide?"
          ]
        },
        "australia_brisbane?" => {
          name: "australia_brisbane?",
          description:
            "returns whether the current time zone is australia/brisbane.",
          examples: [
            "Date.australia_brisbane?",
            "Date.new(\"2024-03-05\").australia_brisbane?",
            "Time.zone = \"Etc/UTC\" Date.australia_brisbane?"
          ]
        },
        "australia_broken_hill?" => {
          name: "australia_broken_hill?",
          description:
            "returns whether the current time zone is australia/broken_hill.",
          examples: [
            "Date.australia_broken_hill?",
            "Date.new(\"2024-03-05\").australia_broken_hill?",
            "Time.zone = \"Etc/UTC\" Date.australia_broken_hill?"
          ]
        },
        "australia_canberra?" => {
          name: "australia_canberra?",
          description:
            "returns whether the current time zone is australia/canberra.",
          examples: [
            "Date.australia_canberra?",
            "Date.new(\"2024-03-05\").australia_canberra?",
            "Time.zone = \"Etc/UTC\" Date.australia_canberra?"
          ]
        },
        "australia_currie?" => {
          name: "australia_currie?",
          description:
            "returns whether the current time zone is australia/currie.",
          examples: [
            "Date.australia_currie?",
            "Date.new(\"2024-03-05\").australia_currie?",
            "Time.zone = \"Etc/UTC\" Date.australia_currie?"
          ]
        },
        "australia_darwin?" => {
          name: "australia_darwin?",
          description:
            "returns whether the current time zone is australia/darwin.",
          examples: [
            "Date.australia_darwin?",
            "Date.new(\"2024-03-05\").australia_darwin?",
            "Time.zone = \"Etc/UTC\" Date.australia_darwin?"
          ]
        },
        "australia_eucla?" => {
          name: "australia_eucla?",
          description:
            "returns whether the current time zone is australia/eucla.",
          examples: [
            "Date.australia_eucla?",
            "Date.new(\"2024-03-05\").australia_eucla?",
            "Time.zone = \"Etc/UTC\" Date.australia_eucla?"
          ]
        },
        "australia_hobart?" => {
          name: "australia_hobart?",
          description:
            "returns whether the current time zone is australia/hobart.",
          examples: [
            "Date.australia_hobart?",
            "Date.new(\"2024-03-05\").australia_hobart?",
            "Time.zone = \"Etc/UTC\" Date.australia_hobart?"
          ]
        },
        "australia_lhi?" => {
          name: "australia_lhi?",
          description:
            "returns whether the current time zone is australia/lhi.",
          examples: [
            "Date.australia_lhi?",
            "Date.new(\"2024-03-05\").australia_lhi?",
            "Time.zone = \"Etc/UTC\" Date.australia_lhi?"
          ]
        },
        "australia_lindeman?" => {
          name: "australia_lindeman?",
          description:
            "returns whether the current time zone is australia/lindeman.",
          examples: [
            "Date.australia_lindeman?",
            "Date.new(\"2024-03-05\").australia_lindeman?",
            "Time.zone = \"Etc/UTC\" Date.australia_lindeman?"
          ]
        },
        "australia_lord_howe?" => {
          name: "australia_lord_howe?",
          description:
            "returns whether the current time zone is australia/lord_howe.",
          examples: [
            "Date.australia_lord_howe?",
            "Date.new(\"2024-03-05\").australia_lord_howe?",
            "Time.zone = \"Etc/UTC\" Date.australia_lord_howe?"
          ]
        },
        "australia_melbourne?" => {
          name: "australia_melbourne?",
          description:
            "returns whether the current time zone is australia/melbourne.",
          examples: [
            "Date.australia_melbourne?",
            "Date.new(\"2024-03-05\").australia_melbourne?",
            "Time.zone = \"Etc/UTC\" Date.australia_melbourne?"
          ]
        },
        "australia_nsw?" => {
          name: "australia_nsw?",
          description:
            "returns whether the current time zone is australia/nsw.",
          examples: [
            "Date.australia_nsw?",
            "Date.new(\"2024-03-05\").australia_nsw?",
            "Time.zone = \"Etc/UTC\" Date.australia_nsw?"
          ]
        },
        "australia_north?" => {
          name: "australia_north?",
          description:
            "returns whether the current time zone is australia/north.",
          examples: [
            "Date.australia_north?",
            "Date.new(\"2024-03-05\").australia_north?",
            "Time.zone = \"Etc/UTC\" Date.australia_north?"
          ]
        },
        "australia_perth?" => {
          name: "australia_perth?",
          description:
            "returns whether the current time zone is australia/perth.",
          examples: [
            "Date.australia_perth?",
            "Date.new(\"2024-03-05\").australia_perth?",
            "Time.zone = \"Etc/UTC\" Date.australia_perth?"
          ]
        },
        "australia_queensland?" => {
          name: "australia_queensland?",
          description:
            "returns whether the current time zone is australia/queensland.",
          examples: [
            "Date.australia_queensland?",
            "Date.new(\"2024-03-05\").australia_queensland?",
            "Time.zone = \"Etc/UTC\" Date.australia_queensland?"
          ]
        },
        "australia_south?" => {
          name: "australia_south?",
          description:
            "returns whether the current time zone is australia/south.",
          examples: [
            "Date.australia_south?",
            "Date.new(\"2024-03-05\").australia_south?",
            "Time.zone = \"Etc/UTC\" Date.australia_south?"
          ]
        },
        "australia_sydney?" => {
          name: "australia_sydney?",
          description:
            "returns whether the current time zone is australia/sydney.",
          examples: [
            "Date.australia_sydney?",
            "Date.new(\"2024-03-05\").australia_sydney?",
            "Time.zone = \"Etc/UTC\" Date.australia_sydney?"
          ]
        },
        "australia_tasmania?" => {
          name: "australia_tasmania?",
          description:
            "returns whether the current time zone is australia/tasmania.",
          examples: [
            "Date.australia_tasmania?",
            "Date.new(\"2024-03-05\").australia_tasmania?",
            "Time.zone = \"Etc/UTC\" Date.australia_tasmania?"
          ]
        },
        "australia_victoria?" => {
          name: "australia_victoria?",
          description:
            "returns whether the current time zone is australia/victoria.",
          examples: [
            "Date.australia_victoria?",
            "Date.new(\"2024-03-05\").australia_victoria?",
            "Time.zone = \"Etc/UTC\" Date.australia_victoria?"
          ]
        },
        "australia_west?" => {
          name: "australia_west?",
          description:
            "returns whether the current time zone is australia/west.",
          examples: [
            "Date.australia_west?",
            "Date.new(\"2024-03-05\").australia_west?",
            "Time.zone = \"Etc/UTC\" Date.australia_west?"
          ]
        },
        "australia_yancowinna?" => {
          name: "australia_yancowinna?",
          description:
            "returns whether the current time zone is australia/yancowinna.",
          examples: [
            "Date.australia_yancowinna?",
            "Date.new(\"2024-03-05\").australia_yancowinna?",
            "Time.zone = \"Etc/UTC\" Date.australia_yancowinna?"
          ]
        },
        "brazil_acre?" => {
          name: "brazil_acre?",
          description: "returns whether the current time zone is brazil/acre.",
          examples: [
            "Date.brazil_acre?",
            "Date.new(\"2024-03-05\").brazil_acre?",
            "Time.zone = \"Etc/UTC\" Date.brazil_acre?"
          ]
        },
        "brazil_denoronha?" => {
          name: "brazil_denoronha?",
          description:
            "returns whether the current time zone is brazil/denoronha.",
          examples: [
            "Date.brazil_denoronha?",
            "Date.new(\"2024-03-05\").brazil_denoronha?",
            "Time.zone = \"Etc/UTC\" Date.brazil_denoronha?"
          ]
        },
        "brazil_east?" => {
          name: "brazil_east?",
          description: "returns whether the current time zone is brazil/east.",
          examples: [
            "Date.brazil_east?",
            "Date.new(\"2024-03-05\").brazil_east?",
            "Time.zone = \"Etc/UTC\" Date.brazil_east?"
          ]
        },
        "brazil_west?" => {
          name: "brazil_west?",
          description: "returns whether the current time zone is brazil/west.",
          examples: [
            "Date.brazil_west?",
            "Date.new(\"2024-03-05\").brazil_west?",
            "Time.zone = \"Etc/UTC\" Date.brazil_west?"
          ]
        },
        "cet?" => {
          name: "cet?",
          description: "returns whether the current time zone is cet.",
          examples: [
            "Date.cet?",
            "Date.new(\"2024-03-05\").cet?",
            "Time.zone = \"Etc/UTC\" Date.cet?"
          ]
        },
        "cst6cdt?" => {
          name: "cst6cdt?",
          description: "returns whether the current time zone is cst6cdt.",
          examples: [
            "Date.cst6cdt?",
            "Date.new(\"2024-03-05\").cst6cdt?",
            "Time.zone = \"Etc/UTC\" Date.cst6cdt?"
          ]
        },
        "canada_atlantic?" => {
          name: "canada_atlantic?",
          description:
            "returns whether the current time zone is canada/atlantic.",
          examples: [
            "Date.canada_atlantic?",
            "Date.new(\"2024-03-05\").canada_atlantic?",
            "Time.zone = \"Etc/UTC\" Date.canada_atlantic?"
          ]
        },
        "canada_central?" => {
          name: "canada_central?",
          description:
            "returns whether the current time zone is canada/central.",
          examples: [
            "Date.canada_central?",
            "Date.new(\"2024-03-05\").canada_central?",
            "Time.zone = \"Etc/UTC\" Date.canada_central?"
          ]
        },
        "canada_eastern?" => {
          name: "canada_eastern?",
          description:
            "returns whether the current time zone is canada/eastern.",
          examples: [
            "Date.canada_eastern?",
            "Date.new(\"2024-03-05\").canada_eastern?",
            "Time.zone = \"Etc/UTC\" Date.canada_eastern?"
          ]
        },
        "canada_mountain?" => {
          name: "canada_mountain?",
          description:
            "returns whether the current time zone is canada/mountain.",
          examples: [
            "Date.canada_mountain?",
            "Date.new(\"2024-03-05\").canada_mountain?",
            "Time.zone = \"Etc/UTC\" Date.canada_mountain?"
          ]
        },
        "canada_newfoundland?" => {
          name: "canada_newfoundland?",
          description:
            "returns whether the current time zone is canada/newfoundland.",
          examples: [
            "Date.canada_newfoundland?",
            "Date.new(\"2024-03-05\").canada_newfoundland?",
            "Time.zone = \"Etc/UTC\" Date.canada_newfoundland?"
          ]
        },
        "canada_pacific?" => {
          name: "canada_pacific?",
          description:
            "returns whether the current time zone is canada/pacific.",
          examples: [
            "Date.canada_pacific?",
            "Date.new(\"2024-03-05\").canada_pacific?",
            "Time.zone = \"Etc/UTC\" Date.canada_pacific?"
          ]
        },
        "canada_saskatchewan?" => {
          name: "canada_saskatchewan?",
          description:
            "returns whether the current time zone is canada/saskatchewan.",
          examples: [
            "Date.canada_saskatchewan?",
            "Date.new(\"2024-03-05\").canada_saskatchewan?",
            "Time.zone = \"Etc/UTC\" Date.canada_saskatchewan?"
          ]
        },
        "canada_yukon?" => {
          name: "canada_yukon?",
          description: "returns whether the current time zone is canada/yukon.",
          examples: [
            "Date.canada_yukon?",
            "Date.new(\"2024-03-05\").canada_yukon?",
            "Time.zone = \"Etc/UTC\" Date.canada_yukon?"
          ]
        },
        "chile_continental?" => {
          name: "chile_continental?",
          description:
            "returns whether the current time zone is chile/continental.",
          examples: [
            "Date.chile_continental?",
            "Date.new(\"2024-03-05\").chile_continental?",
            "Time.zone = \"Etc/UTC\" Date.chile_continental?"
          ]
        },
        "chile_easterisland?" => {
          name: "chile_easterisland?",
          description:
            "returns whether the current time zone is chile/easterisland.",
          examples: [
            "Date.chile_easterisland?",
            "Date.new(\"2024-03-05\").chile_easterisland?",
            "Time.zone = \"Etc/UTC\" Date.chile_easterisland?"
          ]
        },
        "cuba?" => {
          name: "cuba?",
          description: "returns whether the current time zone is cuba.",
          examples: [
            "Date.cuba?",
            "Date.new(\"2024-03-05\").cuba?",
            "Time.zone = \"Etc/UTC\" Date.cuba?"
          ]
        },
        "eet?" => {
          name: "eet?",
          description: "returns whether the current time zone is eet.",
          examples: [
            "Date.eet?",
            "Date.new(\"2024-03-05\").eet?",
            "Time.zone = \"Etc/UTC\" Date.eet?"
          ]
        },
        "est?" => {
          name: "est?",
          description: "returns whether the current time zone is est.",
          examples: [
            "Date.est?",
            "Date.new(\"2024-03-05\").est?",
            "Time.zone = \"Etc/UTC\" Date.est?"
          ]
        },
        "est5edt?" => {
          name: "est5edt?",
          description: "returns whether the current time zone is est5edt.",
          examples: [
            "Date.est5edt?",
            "Date.new(\"2024-03-05\").est5edt?",
            "Time.zone = \"Etc/UTC\" Date.est5edt?"
          ]
        },
        "egypt?" => {
          name: "egypt?",
          description: "returns whether the current time zone is egypt.",
          examples: [
            "Date.egypt?",
            "Date.new(\"2024-03-05\").egypt?",
            "Time.zone = \"Etc/UTC\" Date.egypt?"
          ]
        },
        "eire?" => {
          name: "eire?",
          description: "returns whether the current time zone is eire.",
          examples: [
            "Date.eire?",
            "Date.new(\"2024-03-05\").eire?",
            "Time.zone = \"Etc/UTC\" Date.eire?"
          ]
        },
        "etc_gmt?" => {
          name: "etc_gmt?",
          description: "returns whether the current time zone is etc/gmt.",
          examples: [
            "Date.etc_gmt?",
            "Date.new(\"2024-03-05\").etc_gmt?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt?"
          ]
        },
        "etc_gmt_plus_0?" => {
          name: "etc_gmt_plus_0?",
          description: "returns whether the current time zone is etc/gmt+0.",
          examples: [
            "Date.etc_gmt_plus_0?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_0?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_0?"
          ]
        },
        "etc_gmt_plus_1?" => {
          name: "etc_gmt_plus_1?",
          description: "returns whether the current time zone is etc/gmt+1.",
          examples: [
            "Date.etc_gmt_plus_1?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_1?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_1?"
          ]
        },
        "etc_gmt_plus_10?" => {
          name: "etc_gmt_plus_10?",
          description: "returns whether the current time zone is etc/gmt+10.",
          examples: [
            "Date.etc_gmt_plus_10?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_10?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_10?"
          ]
        },
        "etc_gmt_plus_11?" => {
          name: "etc_gmt_plus_11?",
          description: "returns whether the current time zone is etc/gmt+11.",
          examples: [
            "Date.etc_gmt_plus_11?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_11?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_11?"
          ]
        },
        "etc_gmt_plus_12?" => {
          name: "etc_gmt_plus_12?",
          description: "returns whether the current time zone is etc/gmt+12.",
          examples: [
            "Date.etc_gmt_plus_12?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_12?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_12?"
          ]
        },
        "etc_gmt_plus_2?" => {
          name: "etc_gmt_plus_2?",
          description: "returns whether the current time zone is etc/gmt+2.",
          examples: [
            "Date.etc_gmt_plus_2?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_2?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_2?"
          ]
        },
        "etc_gmt_plus_3?" => {
          name: "etc_gmt_plus_3?",
          description: "returns whether the current time zone is etc/gmt+3.",
          examples: [
            "Date.etc_gmt_plus_3?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_3?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_3?"
          ]
        },
        "etc_gmt_plus_4?" => {
          name: "etc_gmt_plus_4?",
          description: "returns whether the current time zone is etc/gmt+4.",
          examples: [
            "Date.etc_gmt_plus_4?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_4?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_4?"
          ]
        },
        "etc_gmt_plus_5?" => {
          name: "etc_gmt_plus_5?",
          description: "returns whether the current time zone is etc/gmt+5.",
          examples: [
            "Date.etc_gmt_plus_5?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_5?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_5?"
          ]
        },
        "etc_gmt_plus_6?" => {
          name: "etc_gmt_plus_6?",
          description: "returns whether the current time zone is etc/gmt+6.",
          examples: [
            "Date.etc_gmt_plus_6?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_6?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_6?"
          ]
        },
        "etc_gmt_plus_7?" => {
          name: "etc_gmt_plus_7?",
          description: "returns whether the current time zone is etc/gmt+7.",
          examples: [
            "Date.etc_gmt_plus_7?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_7?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_7?"
          ]
        },
        "etc_gmt_plus_8?" => {
          name: "etc_gmt_plus_8?",
          description: "returns whether the current time zone is etc/gmt+8.",
          examples: [
            "Date.etc_gmt_plus_8?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_8?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_8?"
          ]
        },
        "etc_gmt_plus_9?" => {
          name: "etc_gmt_plus_9?",
          description: "returns whether the current time zone is etc/gmt+9.",
          examples: [
            "Date.etc_gmt_plus_9?",
            "Date.new(\"2024-03-05\").etc_gmt_plus_9?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_plus_9?"
          ]
        },
        "etc_gmt_minus_0?" => {
          name: "etc_gmt_minus_0?",
          description: "returns whether the current time zone is etc/gmt-0.",
          examples: [
            "Date.etc_gmt_minus_0?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_0?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_0?"
          ]
        },
        "etc_gmt_minus_1?" => {
          name: "etc_gmt_minus_1?",
          description: "returns whether the current time zone is etc/gmt-1.",
          examples: [
            "Date.etc_gmt_minus_1?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_1?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_1?"
          ]
        },
        "etc_gmt_minus_10?" => {
          name: "etc_gmt_minus_10?",
          description: "returns whether the current time zone is etc/gmt-10.",
          examples: [
            "Date.etc_gmt_minus_10?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_10?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_10?"
          ]
        },
        "etc_gmt_minus_11?" => {
          name: "etc_gmt_minus_11?",
          description: "returns whether the current time zone is etc/gmt-11.",
          examples: [
            "Date.etc_gmt_minus_11?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_11?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_11?"
          ]
        },
        "etc_gmt_minus_12?" => {
          name: "etc_gmt_minus_12?",
          description: "returns whether the current time zone is etc/gmt-12.",
          examples: [
            "Date.etc_gmt_minus_12?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_12?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_12?"
          ]
        },
        "etc_gmt_minus_13?" => {
          name: "etc_gmt_minus_13?",
          description: "returns whether the current time zone is etc/gmt-13.",
          examples: [
            "Date.etc_gmt_minus_13?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_13?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_13?"
          ]
        },
        "etc_gmt_minus_14?" => {
          name: "etc_gmt_minus_14?",
          description: "returns whether the current time zone is etc/gmt-14.",
          examples: [
            "Date.etc_gmt_minus_14?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_14?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_14?"
          ]
        },
        "etc_gmt_minus_2?" => {
          name: "etc_gmt_minus_2?",
          description: "returns whether the current time zone is etc/gmt-2.",
          examples: [
            "Date.etc_gmt_minus_2?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_2?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_2?"
          ]
        },
        "etc_gmt_minus_3?" => {
          name: "etc_gmt_minus_3?",
          description: "returns whether the current time zone is etc/gmt-3.",
          examples: [
            "Date.etc_gmt_minus_3?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_3?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_3?"
          ]
        },
        "etc_gmt_minus_4?" => {
          name: "etc_gmt_minus_4?",
          description: "returns whether the current time zone is etc/gmt-4.",
          examples: [
            "Date.etc_gmt_minus_4?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_4?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_4?"
          ]
        },
        "etc_gmt_minus_5?" => {
          name: "etc_gmt_minus_5?",
          description: "returns whether the current time zone is etc/gmt-5.",
          examples: [
            "Date.etc_gmt_minus_5?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_5?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_5?"
          ]
        },
        "etc_gmt_minus_6?" => {
          name: "etc_gmt_minus_6?",
          description: "returns whether the current time zone is etc/gmt-6.",
          examples: [
            "Date.etc_gmt_minus_6?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_6?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_6?"
          ]
        },
        "etc_gmt_minus_7?" => {
          name: "etc_gmt_minus_7?",
          description: "returns whether the current time zone is etc/gmt-7.",
          examples: [
            "Date.etc_gmt_minus_7?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_7?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_7?"
          ]
        },
        "etc_gmt_minus_8?" => {
          name: "etc_gmt_minus_8?",
          description: "returns whether the current time zone is etc/gmt-8.",
          examples: [
            "Date.etc_gmt_minus_8?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_8?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_8?"
          ]
        },
        "etc_gmt_minus_9?" => {
          name: "etc_gmt_minus_9?",
          description: "returns whether the current time zone is etc/gmt-9.",
          examples: [
            "Date.etc_gmt_minus_9?",
            "Date.new(\"2024-03-05\").etc_gmt_minus_9?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt_minus_9?"
          ]
        },
        "etc_gmt0?" => {
          name: "etc_gmt0?",
          description: "returns whether the current time zone is etc/gmt0.",
          examples: [
            "Date.etc_gmt0?",
            "Date.new(\"2024-03-05\").etc_gmt0?",
            "Time.zone = \"Etc/UTC\" Date.etc_gmt0?"
          ]
        },
        "etc_greenwich?" => {
          name: "etc_greenwich?",
          description:
            "returns whether the current time zone is etc/greenwich.",
          examples: [
            "Date.etc_greenwich?",
            "Date.new(\"2024-03-05\").etc_greenwich?",
            "Time.zone = \"Etc/UTC\" Date.etc_greenwich?"
          ]
        },
        "etc_uct?" => {
          name: "etc_uct?",
          description: "returns whether the current time zone is etc/uct.",
          examples: [
            "Date.etc_uct?",
            "Date.new(\"2024-03-05\").etc_uct?",
            "Time.zone = \"Etc/UTC\" Date.etc_uct?"
          ]
        },
        "etc_utc?" => {
          name: "etc_utc?",
          description: "returns whether the current time zone is etc/utc.",
          examples: [
            "Date.etc_utc?",
            "Date.new(\"2024-03-05\").etc_utc?",
            "Time.zone = \"Etc/UTC\" Date.etc_utc?"
          ]
        },
        "etc_universal?" => {
          name: "etc_universal?",
          description:
            "returns whether the current time zone is etc/universal.",
          examples: [
            "Date.etc_universal?",
            "Date.new(\"2024-03-05\").etc_universal?",
            "Time.zone = \"Etc/UTC\" Date.etc_universal?"
          ]
        },
        "etc_zulu?" => {
          name: "etc_zulu?",
          description: "returns whether the current time zone is etc/zulu.",
          examples: [
            "Date.etc_zulu?",
            "Date.new(\"2024-03-05\").etc_zulu?",
            "Time.zone = \"Etc/UTC\" Date.etc_zulu?"
          ]
        },
        "europe_amsterdam?" => {
          name: "europe_amsterdam?",
          description:
            "returns whether the current time zone is europe/amsterdam.",
          examples: [
            "Date.europe_amsterdam?",
            "Date.new(\"2024-03-05\").europe_amsterdam?",
            "Time.zone = \"Etc/UTC\" Date.europe_amsterdam?"
          ]
        },
        "europe_andorra?" => {
          name: "europe_andorra?",
          description:
            "returns whether the current time zone is europe/andorra.",
          examples: [
            "Date.europe_andorra?",
            "Date.new(\"2024-03-05\").europe_andorra?",
            "Time.zone = \"Etc/UTC\" Date.europe_andorra?"
          ]
        },
        "europe_astrakhan?" => {
          name: "europe_astrakhan?",
          description:
            "returns whether the current time zone is europe/astrakhan.",
          examples: [
            "Date.europe_astrakhan?",
            "Date.new(\"2024-03-05\").europe_astrakhan?",
            "Time.zone = \"Etc/UTC\" Date.europe_astrakhan?"
          ]
        },
        "europe_athens?" => {
          name: "europe_athens?",
          description:
            "returns whether the current time zone is europe/athens.",
          examples: [
            "Date.europe_athens?",
            "Date.new(\"2024-03-05\").europe_athens?",
            "Time.zone = \"Etc/UTC\" Date.europe_athens?"
          ]
        },
        "europe_belfast?" => {
          name: "europe_belfast?",
          description:
            "returns whether the current time zone is europe/belfast.",
          examples: [
            "Date.europe_belfast?",
            "Date.new(\"2024-03-05\").europe_belfast?",
            "Time.zone = \"Etc/UTC\" Date.europe_belfast?"
          ]
        },
        "europe_belgrade?" => {
          name: "europe_belgrade?",
          description:
            "returns whether the current time zone is europe/belgrade.",
          examples: [
            "Date.europe_belgrade?",
            "Date.new(\"2024-03-05\").europe_belgrade?",
            "Time.zone = \"Etc/UTC\" Date.europe_belgrade?"
          ]
        },
        "europe_berlin?" => {
          name: "europe_berlin?",
          description:
            "returns whether the current time zone is europe/berlin.",
          examples: [
            "Date.europe_berlin?",
            "Date.new(\"2024-03-05\").europe_berlin?",
            "Time.zone = \"Etc/UTC\" Date.europe_berlin?"
          ]
        },
        "europe_bratislava?" => {
          name: "europe_bratislava?",
          description:
            "returns whether the current time zone is europe/bratislava.",
          examples: [
            "Date.europe_bratislava?",
            "Date.new(\"2024-03-05\").europe_bratislava?",
            "Time.zone = \"Etc/UTC\" Date.europe_bratislava?"
          ]
        },
        "europe_brussels?" => {
          name: "europe_brussels?",
          description:
            "returns whether the current time zone is europe/brussels.",
          examples: [
            "Date.europe_brussels?",
            "Date.new(\"2024-03-05\").europe_brussels?",
            "Time.zone = \"Etc/UTC\" Date.europe_brussels?"
          ]
        },
        "europe_bucharest?" => {
          name: "europe_bucharest?",
          description:
            "returns whether the current time zone is europe/bucharest.",
          examples: [
            "Date.europe_bucharest?",
            "Date.new(\"2024-03-05\").europe_bucharest?",
            "Time.zone = \"Etc/UTC\" Date.europe_bucharest?"
          ]
        },
        "europe_budapest?" => {
          name: "europe_budapest?",
          description:
            "returns whether the current time zone is europe/budapest.",
          examples: [
            "Date.europe_budapest?",
            "Date.new(\"2024-03-05\").europe_budapest?",
            "Time.zone = \"Etc/UTC\" Date.europe_budapest?"
          ]
        },
        "europe_busingen?" => {
          name: "europe_busingen?",
          description:
            "returns whether the current time zone is europe/busingen.",
          examples: [
            "Date.europe_busingen?",
            "Date.new(\"2024-03-05\").europe_busingen?",
            "Time.zone = \"Etc/UTC\" Date.europe_busingen?"
          ]
        },
        "europe_chisinau?" => {
          name: "europe_chisinau?",
          description:
            "returns whether the current time zone is europe/chisinau.",
          examples: [
            "Date.europe_chisinau?",
            "Date.new(\"2024-03-05\").europe_chisinau?",
            "Time.zone = \"Etc/UTC\" Date.europe_chisinau?"
          ]
        },
        "europe_copenhagen?" => {
          name: "europe_copenhagen?",
          description:
            "returns whether the current time zone is europe/copenhagen.",
          examples: [
            "Date.europe_copenhagen?",
            "Date.new(\"2024-03-05\").europe_copenhagen?",
            "Time.zone = \"Etc/UTC\" Date.europe_copenhagen?"
          ]
        },
        "europe_dublin?" => {
          name: "europe_dublin?",
          description:
            "returns whether the current time zone is europe/dublin.",
          examples: [
            "Date.europe_dublin?",
            "Date.new(\"2024-03-05\").europe_dublin?",
            "Time.zone = \"Etc/UTC\" Date.europe_dublin?"
          ]
        },
        "europe_gibraltar?" => {
          name: "europe_gibraltar?",
          description:
            "returns whether the current time zone is europe/gibraltar.",
          examples: [
            "Date.europe_gibraltar?",
            "Date.new(\"2024-03-05\").europe_gibraltar?",
            "Time.zone = \"Etc/UTC\" Date.europe_gibraltar?"
          ]
        },
        "europe_guernsey?" => {
          name: "europe_guernsey?",
          description:
            "returns whether the current time zone is europe/guernsey.",
          examples: [
            "Date.europe_guernsey?",
            "Date.new(\"2024-03-05\").europe_guernsey?",
            "Time.zone = \"Etc/UTC\" Date.europe_guernsey?"
          ]
        },
        "europe_helsinki?" => {
          name: "europe_helsinki?",
          description:
            "returns whether the current time zone is europe/helsinki.",
          examples: [
            "Date.europe_helsinki?",
            "Date.new(\"2024-03-05\").europe_helsinki?",
            "Time.zone = \"Etc/UTC\" Date.europe_helsinki?"
          ]
        },
        "europe_isle_of_man?" => {
          name: "europe_isle_of_man?",
          description:
            "returns whether the current time zone is europe/isle_of_man.",
          examples: [
            "Date.europe_isle_of_man?",
            "Date.new(\"2024-03-05\").europe_isle_of_man?",
            "Time.zone = \"Etc/UTC\" Date.europe_isle_of_man?"
          ]
        },
        "europe_istanbul?" => {
          name: "europe_istanbul?",
          description:
            "returns whether the current time zone is europe/istanbul.",
          examples: [
            "Date.europe_istanbul?",
            "Date.new(\"2024-03-05\").europe_istanbul?",
            "Time.zone = \"Etc/UTC\" Date.europe_istanbul?"
          ]
        },
        "europe_jersey?" => {
          name: "europe_jersey?",
          description:
            "returns whether the current time zone is europe/jersey.",
          examples: [
            "Date.europe_jersey?",
            "Date.new(\"2024-03-05\").europe_jersey?",
            "Time.zone = \"Etc/UTC\" Date.europe_jersey?"
          ]
        },
        "europe_kaliningrad?" => {
          name: "europe_kaliningrad?",
          description:
            "returns whether the current time zone is europe/kaliningrad.",
          examples: [
            "Date.europe_kaliningrad?",
            "Date.new(\"2024-03-05\").europe_kaliningrad?",
            "Time.zone = \"Etc/UTC\" Date.europe_kaliningrad?"
          ]
        },
        "europe_kiev?" => {
          name: "europe_kiev?",
          description: "returns whether the current time zone is europe/kiev.",
          examples: [
            "Date.europe_kiev?",
            "Date.new(\"2024-03-05\").europe_kiev?",
            "Time.zone = \"Etc/UTC\" Date.europe_kiev?"
          ]
        },
        "europe_kirov?" => {
          name: "europe_kirov?",
          description: "returns whether the current time zone is europe/kirov.",
          examples: [
            "Date.europe_kirov?",
            "Date.new(\"2024-03-05\").europe_kirov?",
            "Time.zone = \"Etc/UTC\" Date.europe_kirov?"
          ]
        },
        "europe_kyiv?" => {
          name: "europe_kyiv?",
          description: "returns whether the current time zone is europe/kyiv.",
          examples: [
            "Date.europe_kyiv?",
            "Date.new(\"2024-03-05\").europe_kyiv?",
            "Time.zone = \"Etc/UTC\" Date.europe_kyiv?"
          ]
        },
        "europe_lisbon?" => {
          name: "europe_lisbon?",
          description:
            "returns whether the current time zone is europe/lisbon.",
          examples: [
            "Date.europe_lisbon?",
            "Date.new(\"2024-03-05\").europe_lisbon?",
            "Time.zone = \"Etc/UTC\" Date.europe_lisbon?"
          ]
        },
        "europe_ljubljana?" => {
          name: "europe_ljubljana?",
          description:
            "returns whether the current time zone is europe/ljubljana.",
          examples: [
            "Date.europe_ljubljana?",
            "Date.new(\"2024-03-05\").europe_ljubljana?",
            "Time.zone = \"Etc/UTC\" Date.europe_ljubljana?"
          ]
        },
        "europe_london?" => {
          name: "europe_london?",
          description:
            "returns whether the current time zone is europe/london.",
          examples: [
            "Date.europe_london?",
            "Date.new(\"2024-03-05\").europe_london?",
            "Time.zone = \"Etc/UTC\" Date.europe_london?"
          ]
        },
        "europe_luxembourg?" => {
          name: "europe_luxembourg?",
          description:
            "returns whether the current time zone is europe/luxembourg.",
          examples: [
            "Date.europe_luxembourg?",
            "Date.new(\"2024-03-05\").europe_luxembourg?",
            "Time.zone = \"Etc/UTC\" Date.europe_luxembourg?"
          ]
        },
        "europe_madrid?" => {
          name: "europe_madrid?",
          description:
            "returns whether the current time zone is europe/madrid.",
          examples: [
            "Date.europe_madrid?",
            "Date.new(\"2024-03-05\").europe_madrid?",
            "Time.zone = \"Etc/UTC\" Date.europe_madrid?"
          ]
        },
        "europe_malta?" => {
          name: "europe_malta?",
          description: "returns whether the current time zone is europe/malta.",
          examples: [
            "Date.europe_malta?",
            "Date.new(\"2024-03-05\").europe_malta?",
            "Time.zone = \"Etc/UTC\" Date.europe_malta?"
          ]
        },
        "europe_mariehamn?" => {
          name: "europe_mariehamn?",
          description:
            "returns whether the current time zone is europe/mariehamn.",
          examples: [
            "Date.europe_mariehamn?",
            "Date.new(\"2024-03-05\").europe_mariehamn?",
            "Time.zone = \"Etc/UTC\" Date.europe_mariehamn?"
          ]
        },
        "europe_minsk?" => {
          name: "europe_minsk?",
          description: "returns whether the current time zone is europe/minsk.",
          examples: [
            "Date.europe_minsk?",
            "Date.new(\"2024-03-05\").europe_minsk?",
            "Time.zone = \"Etc/UTC\" Date.europe_minsk?"
          ]
        },
        "europe_monaco?" => {
          name: "europe_monaco?",
          description:
            "returns whether the current time zone is europe/monaco.",
          examples: [
            "Date.europe_monaco?",
            "Date.new(\"2024-03-05\").europe_monaco?",
            "Time.zone = \"Etc/UTC\" Date.europe_monaco?"
          ]
        },
        "europe_moscow?" => {
          name: "europe_moscow?",
          description:
            "returns whether the current time zone is europe/moscow.",
          examples: [
            "Date.europe_moscow?",
            "Date.new(\"2024-03-05\").europe_moscow?",
            "Time.zone = \"Etc/UTC\" Date.europe_moscow?"
          ]
        },
        "europe_nicosia?" => {
          name: "europe_nicosia?",
          description:
            "returns whether the current time zone is europe/nicosia.",
          examples: [
            "Date.europe_nicosia?",
            "Date.new(\"2024-03-05\").europe_nicosia?",
            "Time.zone = \"Etc/UTC\" Date.europe_nicosia?"
          ]
        },
        "europe_oslo?" => {
          name: "europe_oslo?",
          description: "returns whether the current time zone is europe/oslo.",
          examples: [
            "Date.europe_oslo?",
            "Date.new(\"2024-03-05\").europe_oslo?",
            "Time.zone = \"Etc/UTC\" Date.europe_oslo?"
          ]
        },
        "europe_paris?" => {
          name: "europe_paris?",
          description: "returns whether the current time zone is europe/paris.",
          examples: [
            "Date.europe_paris?",
            "Date.new(\"2024-03-05\").europe_paris?",
            "Time.zone = \"Etc/UTC\" Date.europe_paris?"
          ]
        },
        "europe_podgorica?" => {
          name: "europe_podgorica?",
          description:
            "returns whether the current time zone is europe/podgorica.",
          examples: [
            "Date.europe_podgorica?",
            "Date.new(\"2024-03-05\").europe_podgorica?",
            "Time.zone = \"Etc/UTC\" Date.europe_podgorica?"
          ]
        },
        "europe_prague?" => {
          name: "europe_prague?",
          description:
            "returns whether the current time zone is europe/prague.",
          examples: [
            "Date.europe_prague?",
            "Date.new(\"2024-03-05\").europe_prague?",
            "Time.zone = \"Etc/UTC\" Date.europe_prague?"
          ]
        },
        "europe_riga?" => {
          name: "europe_riga?",
          description: "returns whether the current time zone is europe/riga.",
          examples: [
            "Date.europe_riga?",
            "Date.new(\"2024-03-05\").europe_riga?",
            "Time.zone = \"Etc/UTC\" Date.europe_riga?"
          ]
        },
        "europe_rome?" => {
          name: "europe_rome?",
          description: "returns whether the current time zone is europe/rome.",
          examples: [
            "Date.europe_rome?",
            "Date.new(\"2024-03-05\").europe_rome?",
            "Time.zone = \"Etc/UTC\" Date.europe_rome?"
          ]
        },
        "europe_samara?" => {
          name: "europe_samara?",
          description:
            "returns whether the current time zone is europe/samara.",
          examples: [
            "Date.europe_samara?",
            "Date.new(\"2024-03-05\").europe_samara?",
            "Time.zone = \"Etc/UTC\" Date.europe_samara?"
          ]
        },
        "europe_san_marino?" => {
          name: "europe_san_marino?",
          description:
            "returns whether the current time zone is europe/san_marino.",
          examples: [
            "Date.europe_san_marino?",
            "Date.new(\"2024-03-05\").europe_san_marino?",
            "Time.zone = \"Etc/UTC\" Date.europe_san_marino?"
          ]
        },
        "europe_sarajevo?" => {
          name: "europe_sarajevo?",
          description:
            "returns whether the current time zone is europe/sarajevo.",
          examples: [
            "Date.europe_sarajevo?",
            "Date.new(\"2024-03-05\").europe_sarajevo?",
            "Time.zone = \"Etc/UTC\" Date.europe_sarajevo?"
          ]
        },
        "europe_saratov?" => {
          name: "europe_saratov?",
          description:
            "returns whether the current time zone is europe/saratov.",
          examples: [
            "Date.europe_saratov?",
            "Date.new(\"2024-03-05\").europe_saratov?",
            "Time.zone = \"Etc/UTC\" Date.europe_saratov?"
          ]
        },
        "europe_simferopol?" => {
          name: "europe_simferopol?",
          description:
            "returns whether the current time zone is europe/simferopol.",
          examples: [
            "Date.europe_simferopol?",
            "Date.new(\"2024-03-05\").europe_simferopol?",
            "Time.zone = \"Etc/UTC\" Date.europe_simferopol?"
          ]
        },
        "europe_skopje?" => {
          name: "europe_skopje?",
          description:
            "returns whether the current time zone is europe/skopje.",
          examples: [
            "Date.europe_skopje?",
            "Date.new(\"2024-03-05\").europe_skopje?",
            "Time.zone = \"Etc/UTC\" Date.europe_skopje?"
          ]
        },
        "europe_sofia?" => {
          name: "europe_sofia?",
          description: "returns whether the current time zone is europe/sofia.",
          examples: [
            "Date.europe_sofia?",
            "Date.new(\"2024-03-05\").europe_sofia?",
            "Time.zone = \"Etc/UTC\" Date.europe_sofia?"
          ]
        },
        "europe_stockholm?" => {
          name: "europe_stockholm?",
          description:
            "returns whether the current time zone is europe/stockholm.",
          examples: [
            "Date.europe_stockholm?",
            "Date.new(\"2024-03-05\").europe_stockholm?",
            "Time.zone = \"Etc/UTC\" Date.europe_stockholm?"
          ]
        },
        "europe_tallinn?" => {
          name: "europe_tallinn?",
          description:
            "returns whether the current time zone is europe/tallinn.",
          examples: [
            "Date.europe_tallinn?",
            "Date.new(\"2024-03-05\").europe_tallinn?",
            "Time.zone = \"Etc/UTC\" Date.europe_tallinn?"
          ]
        },
        "europe_tirane?" => {
          name: "europe_tirane?",
          description:
            "returns whether the current time zone is europe/tirane.",
          examples: [
            "Date.europe_tirane?",
            "Date.new(\"2024-03-05\").europe_tirane?",
            "Time.zone = \"Etc/UTC\" Date.europe_tirane?"
          ]
        },
        "europe_tiraspol?" => {
          name: "europe_tiraspol?",
          description:
            "returns whether the current time zone is europe/tiraspol.",
          examples: [
            "Date.europe_tiraspol?",
            "Date.new(\"2024-03-05\").europe_tiraspol?",
            "Time.zone = \"Etc/UTC\" Date.europe_tiraspol?"
          ]
        },
        "europe_ulyanovsk?" => {
          name: "europe_ulyanovsk?",
          description:
            "returns whether the current time zone is europe/ulyanovsk.",
          examples: [
            "Date.europe_ulyanovsk?",
            "Date.new(\"2024-03-05\").europe_ulyanovsk?",
            "Time.zone = \"Etc/UTC\" Date.europe_ulyanovsk?"
          ]
        },
        "europe_uzhgorod?" => {
          name: "europe_uzhgorod?",
          description:
            "returns whether the current time zone is europe/uzhgorod.",
          examples: [
            "Date.europe_uzhgorod?",
            "Date.new(\"2024-03-05\").europe_uzhgorod?",
            "Time.zone = \"Etc/UTC\" Date.europe_uzhgorod?"
          ]
        },
        "europe_vaduz?" => {
          name: "europe_vaduz?",
          description: "returns whether the current time zone is europe/vaduz.",
          examples: [
            "Date.europe_vaduz?",
            "Date.new(\"2024-03-05\").europe_vaduz?",
            "Time.zone = \"Etc/UTC\" Date.europe_vaduz?"
          ]
        },
        "europe_vatican?" => {
          name: "europe_vatican?",
          description:
            "returns whether the current time zone is europe/vatican.",
          examples: [
            "Date.europe_vatican?",
            "Date.new(\"2024-03-05\").europe_vatican?",
            "Time.zone = \"Etc/UTC\" Date.europe_vatican?"
          ]
        },
        "europe_vienna?" => {
          name: "europe_vienna?",
          description:
            "returns whether the current time zone is europe/vienna.",
          examples: [
            "Date.europe_vienna?",
            "Date.new(\"2024-03-05\").europe_vienna?",
            "Time.zone = \"Etc/UTC\" Date.europe_vienna?"
          ]
        },
        "europe_vilnius?" => {
          name: "europe_vilnius?",
          description:
            "returns whether the current time zone is europe/vilnius.",
          examples: [
            "Date.europe_vilnius?",
            "Date.new(\"2024-03-05\").europe_vilnius?",
            "Time.zone = \"Etc/UTC\" Date.europe_vilnius?"
          ]
        },
        "europe_volgograd?" => {
          name: "europe_volgograd?",
          description:
            "returns whether the current time zone is europe/volgograd.",
          examples: [
            "Date.europe_volgograd?",
            "Date.new(\"2024-03-05\").europe_volgograd?",
            "Time.zone = \"Etc/UTC\" Date.europe_volgograd?"
          ]
        },
        "europe_warsaw?" => {
          name: "europe_warsaw?",
          description:
            "returns whether the current time zone is europe/warsaw.",
          examples: [
            "Date.europe_warsaw?",
            "Date.new(\"2024-03-05\").europe_warsaw?",
            "Time.zone = \"Etc/UTC\" Date.europe_warsaw?"
          ]
        },
        "europe_zagreb?" => {
          name: "europe_zagreb?",
          description:
            "returns whether the current time zone is europe/zagreb.",
          examples: [
            "Date.europe_zagreb?",
            "Date.new(\"2024-03-05\").europe_zagreb?",
            "Time.zone = \"Etc/UTC\" Date.europe_zagreb?"
          ]
        },
        "europe_zaporozhye?" => {
          name: "europe_zaporozhye?",
          description:
            "returns whether the current time zone is europe/zaporozhye.",
          examples: [
            "Date.europe_zaporozhye?",
            "Date.new(\"2024-03-05\").europe_zaporozhye?",
            "Time.zone = \"Etc/UTC\" Date.europe_zaporozhye?"
          ]
        },
        "europe_zurich?" => {
          name: "europe_zurich?",
          description:
            "returns whether the current time zone is europe/zurich.",
          examples: [
            "Date.europe_zurich?",
            "Date.new(\"2024-03-05\").europe_zurich?",
            "Time.zone = \"Etc/UTC\" Date.europe_zurich?"
          ]
        },
        "factory?" => {
          name: "factory?",
          description: "returns whether the current time zone is factory.",
          examples: [
            "Date.factory?",
            "Date.new(\"2024-03-05\").factory?",
            "Time.zone = \"Etc/UTC\" Date.factory?"
          ]
        },
        "gb?" => {
          name: "gb?",
          description: "returns whether the current time zone is gb.",
          examples: [
            "Date.gb?",
            "Date.new(\"2024-03-05\").gb?",
            "Time.zone = \"Etc/UTC\" Date.gb?"
          ]
        },
        "gb_minus_eire?" => {
          name: "gb_minus_eire?",
          description: "returns whether the current time zone is gb-eire.",
          examples: [
            "Date.gb_minus_eire?",
            "Date.new(\"2024-03-05\").gb_minus_eire?",
            "Time.zone = \"Etc/UTC\" Date.gb_minus_eire?"
          ]
        },
        "gmt?" => {
          name: "gmt?",
          description: "returns whether the current time zone is gmt.",
          examples: [
            "Date.gmt?",
            "Date.new(\"2024-03-05\").gmt?",
            "Time.zone = \"Etc/UTC\" Date.gmt?"
          ]
        },
        "gmt_plus_0?" => {
          name: "gmt_plus_0?",
          description: "returns whether the current time zone is gmt+0.",
          examples: [
            "Date.gmt_plus_0?",
            "Date.new(\"2024-03-05\").gmt_plus_0?",
            "Time.zone = \"Etc/UTC\" Date.gmt_plus_0?"
          ]
        },
        "gmt_minus_0?" => {
          name: "gmt_minus_0?",
          description: "returns whether the current time zone is gmt-0.",
          examples: [
            "Date.gmt_minus_0?",
            "Date.new(\"2024-03-05\").gmt_minus_0?",
            "Time.zone = \"Etc/UTC\" Date.gmt_minus_0?"
          ]
        },
        "gmt0?" => {
          name: "gmt0?",
          description: "returns whether the current time zone is gmt0.",
          examples: [
            "Date.gmt0?",
            "Date.new(\"2024-03-05\").gmt0?",
            "Time.zone = \"Etc/UTC\" Date.gmt0?"
          ]
        },
        "greenwich?" => {
          name: "greenwich?",
          description: "returns whether the current time zone is greenwich.",
          examples: [
            "Date.greenwich?",
            "Date.new(\"2024-03-05\").greenwich?",
            "Time.zone = \"Etc/UTC\" Date.greenwich?"
          ]
        },
        "hst?" => {
          name: "hst?",
          description: "returns whether the current time zone is hst.",
          examples: [
            "Date.hst?",
            "Date.new(\"2024-03-05\").hst?",
            "Time.zone = \"Etc/UTC\" Date.hst?"
          ]
        },
        "hongkong?" => {
          name: "hongkong?",
          description: "returns whether the current time zone is hongkong.",
          examples: [
            "Date.hongkong?",
            "Date.new(\"2024-03-05\").hongkong?",
            "Time.zone = \"Etc/UTC\" Date.hongkong?"
          ]
        },
        "iceland?" => {
          name: "iceland?",
          description: "returns whether the current time zone is iceland.",
          examples: [
            "Date.iceland?",
            "Date.new(\"2024-03-05\").iceland?",
            "Time.zone = \"Etc/UTC\" Date.iceland?"
          ]
        },
        "indian_antananarivo?" => {
          name: "indian_antananarivo?",
          description:
            "returns whether the current time zone is indian/antananarivo.",
          examples: [
            "Date.indian_antananarivo?",
            "Date.new(\"2024-03-05\").indian_antananarivo?",
            "Time.zone = \"Etc/UTC\" Date.indian_antananarivo?"
          ]
        },
        "indian_chagos?" => {
          name: "indian_chagos?",
          description:
            "returns whether the current time zone is indian/chagos.",
          examples: [
            "Date.indian_chagos?",
            "Date.new(\"2024-03-05\").indian_chagos?",
            "Time.zone = \"Etc/UTC\" Date.indian_chagos?"
          ]
        },
        "indian_christmas?" => {
          name: "indian_christmas?",
          description:
            "returns whether the current time zone is indian/christmas.",
          examples: [
            "Date.indian_christmas?",
            "Date.new(\"2024-03-05\").indian_christmas?",
            "Time.zone = \"Etc/UTC\" Date.indian_christmas?"
          ]
        },
        "indian_cocos?" => {
          name: "indian_cocos?",
          description: "returns whether the current time zone is indian/cocos.",
          examples: [
            "Date.indian_cocos?",
            "Date.new(\"2024-03-05\").indian_cocos?",
            "Time.zone = \"Etc/UTC\" Date.indian_cocos?"
          ]
        },
        "indian_comoro?" => {
          name: "indian_comoro?",
          description:
            "returns whether the current time zone is indian/comoro.",
          examples: [
            "Date.indian_comoro?",
            "Date.new(\"2024-03-05\").indian_comoro?",
            "Time.zone = \"Etc/UTC\" Date.indian_comoro?"
          ]
        },
        "indian_kerguelen?" => {
          name: "indian_kerguelen?",
          description:
            "returns whether the current time zone is indian/kerguelen.",
          examples: [
            "Date.indian_kerguelen?",
            "Date.new(\"2024-03-05\").indian_kerguelen?",
            "Time.zone = \"Etc/UTC\" Date.indian_kerguelen?"
          ]
        },
        "indian_mahe?" => {
          name: "indian_mahe?",
          description: "returns whether the current time zone is indian/mahe.",
          examples: [
            "Date.indian_mahe?",
            "Date.new(\"2024-03-05\").indian_mahe?",
            "Time.zone = \"Etc/UTC\" Date.indian_mahe?"
          ]
        },
        "indian_maldives?" => {
          name: "indian_maldives?",
          description:
            "returns whether the current time zone is indian/maldives.",
          examples: [
            "Date.indian_maldives?",
            "Date.new(\"2024-03-05\").indian_maldives?",
            "Time.zone = \"Etc/UTC\" Date.indian_maldives?"
          ]
        },
        "indian_mauritius?" => {
          name: "indian_mauritius?",
          description:
            "returns whether the current time zone is indian/mauritius.",
          examples: [
            "Date.indian_mauritius?",
            "Date.new(\"2024-03-05\").indian_mauritius?",
            "Time.zone = \"Etc/UTC\" Date.indian_mauritius?"
          ]
        },
        "indian_mayotte?" => {
          name: "indian_mayotte?",
          description:
            "returns whether the current time zone is indian/mayotte.",
          examples: [
            "Date.indian_mayotte?",
            "Date.new(\"2024-03-05\").indian_mayotte?",
            "Time.zone = \"Etc/UTC\" Date.indian_mayotte?"
          ]
        },
        "indian_reunion?" => {
          name: "indian_reunion?",
          description:
            "returns whether the current time zone is indian/reunion.",
          examples: [
            "Date.indian_reunion?",
            "Date.new(\"2024-03-05\").indian_reunion?",
            "Time.zone = \"Etc/UTC\" Date.indian_reunion?"
          ]
        },
        "iran?" => {
          name: "iran?",
          description: "returns whether the current time zone is iran.",
          examples: [
            "Date.iran?",
            "Date.new(\"2024-03-05\").iran?",
            "Time.zone = \"Etc/UTC\" Date.iran?"
          ]
        },
        "israel?" => {
          name: "israel?",
          description: "returns whether the current time zone is israel.",
          examples: [
            "Date.israel?",
            "Date.new(\"2024-03-05\").israel?",
            "Time.zone = \"Etc/UTC\" Date.israel?"
          ]
        },
        "jamaica?" => {
          name: "jamaica?",
          description: "returns whether the current time zone is jamaica.",
          examples: [
            "Date.jamaica?",
            "Date.new(\"2024-03-05\").jamaica?",
            "Time.zone = \"Etc/UTC\" Date.jamaica?"
          ]
        },
        "japan?" => {
          name: "japan?",
          description: "returns whether the current time zone is japan.",
          examples: [
            "Date.japan?",
            "Date.new(\"2024-03-05\").japan?",
            "Time.zone = \"Etc/UTC\" Date.japan?"
          ]
        },
        "kwajalein?" => {
          name: "kwajalein?",
          description: "returns whether the current time zone is kwajalein.",
          examples: [
            "Date.kwajalein?",
            "Date.new(\"2024-03-05\").kwajalein?",
            "Time.zone = \"Etc/UTC\" Date.kwajalein?"
          ]
        },
        "libya?" => {
          name: "libya?",
          description: "returns whether the current time zone is libya.",
          examples: [
            "Date.libya?",
            "Date.new(\"2024-03-05\").libya?",
            "Time.zone = \"Etc/UTC\" Date.libya?"
          ]
        },
        "met?" => {
          name: "met?",
          description: "returns whether the current time zone is met.",
          examples: [
            "Date.met?",
            "Date.new(\"2024-03-05\").met?",
            "Time.zone = \"Etc/UTC\" Date.met?"
          ]
        },
        "mst?" => {
          name: "mst?",
          description: "returns whether the current time zone is mst.",
          examples: [
            "Date.mst?",
            "Date.new(\"2024-03-05\").mst?",
            "Time.zone = \"Etc/UTC\" Date.mst?"
          ]
        },
        "mst7mdt?" => {
          name: "mst7mdt?",
          description: "returns whether the current time zone is mst7mdt.",
          examples: [
            "Date.mst7mdt?",
            "Date.new(\"2024-03-05\").mst7mdt?",
            "Time.zone = \"Etc/UTC\" Date.mst7mdt?"
          ]
        },
        "mexico_bajanorte?" => {
          name: "mexico_bajanorte?",
          description:
            "returns whether the current time zone is mexico/bajanorte.",
          examples: [
            "Date.mexico_bajanorte?",
            "Date.new(\"2024-03-05\").mexico_bajanorte?",
            "Time.zone = \"Etc/UTC\" Date.mexico_bajanorte?"
          ]
        },
        "mexico_bajasur?" => {
          name: "mexico_bajasur?",
          description:
            "returns whether the current time zone is mexico/bajasur.",
          examples: [
            "Date.mexico_bajasur?",
            "Date.new(\"2024-03-05\").mexico_bajasur?",
            "Time.zone = \"Etc/UTC\" Date.mexico_bajasur?"
          ]
        },
        "mexico_general?" => {
          name: "mexico_general?",
          description:
            "returns whether the current time zone is mexico/general.",
          examples: [
            "Date.mexico_general?",
            "Date.new(\"2024-03-05\").mexico_general?",
            "Time.zone = \"Etc/UTC\" Date.mexico_general?"
          ]
        },
        "nz?" => {
          name: "nz?",
          description: "returns whether the current time zone is nz.",
          examples: [
            "Date.nz?",
            "Date.new(\"2024-03-05\").nz?",
            "Time.zone = \"Etc/UTC\" Date.nz?"
          ]
        },
        "nz_minus_chat?" => {
          name: "nz_minus_chat?",
          description: "returns whether the current time zone is nz-chat.",
          examples: [
            "Date.nz_minus_chat?",
            "Date.new(\"2024-03-05\").nz_minus_chat?",
            "Time.zone = \"Etc/UTC\" Date.nz_minus_chat?"
          ]
        },
        "navajo?" => {
          name: "navajo?",
          description: "returns whether the current time zone is navajo.",
          examples: [
            "Date.navajo?",
            "Date.new(\"2024-03-05\").navajo?",
            "Time.zone = \"Etc/UTC\" Date.navajo?"
          ]
        },
        "prc?" => {
          name: "prc?",
          description: "returns whether the current time zone is prc.",
          examples: [
            "Date.prc?",
            "Date.new(\"2024-03-05\").prc?",
            "Time.zone = \"Etc/UTC\" Date.prc?"
          ]
        },
        "pst8pdt?" => {
          name: "pst8pdt?",
          description: "returns whether the current time zone is pst8pdt.",
          examples: [
            "Date.pst8pdt?",
            "Date.new(\"2024-03-05\").pst8pdt?",
            "Time.zone = \"Etc/UTC\" Date.pst8pdt?"
          ]
        },
        "pacific_apia?" => {
          name: "pacific_apia?",
          description: "returns whether the current time zone is pacific/apia.",
          examples: [
            "Date.pacific_apia?",
            "Date.new(\"2024-03-05\").pacific_apia?",
            "Time.zone = \"Etc/UTC\" Date.pacific_apia?"
          ]
        },
        "pacific_auckland?" => {
          name: "pacific_auckland?",
          description:
            "returns whether the current time zone is pacific/auckland.",
          examples: [
            "Date.pacific_auckland?",
            "Date.new(\"2024-03-05\").pacific_auckland?",
            "Time.zone = \"Etc/UTC\" Date.pacific_auckland?"
          ]
        },
        "pacific_bougainville?" => {
          name: "pacific_bougainville?",
          description:
            "returns whether the current time zone is pacific/bougainville.",
          examples: [
            "Date.pacific_bougainville?",
            "Date.new(\"2024-03-05\").pacific_bougainville?",
            "Time.zone = \"Etc/UTC\" Date.pacific_bougainville?"
          ]
        },
        "pacific_chatham?" => {
          name: "pacific_chatham?",
          description:
            "returns whether the current time zone is pacific/chatham.",
          examples: [
            "Date.pacific_chatham?",
            "Date.new(\"2024-03-05\").pacific_chatham?",
            "Time.zone = \"Etc/UTC\" Date.pacific_chatham?"
          ]
        },
        "pacific_chuuk?" => {
          name: "pacific_chuuk?",
          description:
            "returns whether the current time zone is pacific/chuuk.",
          examples: [
            "Date.pacific_chuuk?",
            "Date.new(\"2024-03-05\").pacific_chuuk?",
            "Time.zone = \"Etc/UTC\" Date.pacific_chuuk?"
          ]
        },
        "pacific_easter?" => {
          name: "pacific_easter?",
          description:
            "returns whether the current time zone is pacific/easter.",
          examples: [
            "Date.pacific_easter?",
            "Date.new(\"2024-03-05\").pacific_easter?",
            "Time.zone = \"Etc/UTC\" Date.pacific_easter?"
          ]
        },
        "pacific_efate?" => {
          name: "pacific_efate?",
          description:
            "returns whether the current time zone is pacific/efate.",
          examples: [
            "Date.pacific_efate?",
            "Date.new(\"2024-03-05\").pacific_efate?",
            "Time.zone = \"Etc/UTC\" Date.pacific_efate?"
          ]
        },
        "pacific_enderbury?" => {
          name: "pacific_enderbury?",
          description:
            "returns whether the current time zone is pacific/enderbury.",
          examples: [
            "Date.pacific_enderbury?",
            "Date.new(\"2024-03-05\").pacific_enderbury?",
            "Time.zone = \"Etc/UTC\" Date.pacific_enderbury?"
          ]
        },
        "pacific_fakaofo?" => {
          name: "pacific_fakaofo?",
          description:
            "returns whether the current time zone is pacific/fakaofo.",
          examples: [
            "Date.pacific_fakaofo?",
            "Date.new(\"2024-03-05\").pacific_fakaofo?",
            "Time.zone = \"Etc/UTC\" Date.pacific_fakaofo?"
          ]
        },
        "pacific_fiji?" => {
          name: "pacific_fiji?",
          description: "returns whether the current time zone is pacific/fiji.",
          examples: [
            "Date.pacific_fiji?",
            "Date.new(\"2024-03-05\").pacific_fiji?",
            "Time.zone = \"Etc/UTC\" Date.pacific_fiji?"
          ]
        },
        "pacific_funafuti?" => {
          name: "pacific_funafuti?",
          description:
            "returns whether the current time zone is pacific/funafuti.",
          examples: [
            "Date.pacific_funafuti?",
            "Date.new(\"2024-03-05\").pacific_funafuti?",
            "Time.zone = \"Etc/UTC\" Date.pacific_funafuti?"
          ]
        },
        "pacific_galapagos?" => {
          name: "pacific_galapagos?",
          description:
            "returns whether the current time zone is pacific/galapagos.",
          examples: [
            "Date.pacific_galapagos?",
            "Date.new(\"2024-03-05\").pacific_galapagos?",
            "Time.zone = \"Etc/UTC\" Date.pacific_galapagos?"
          ]
        },
        "pacific_gambier?" => {
          name: "pacific_gambier?",
          description:
            "returns whether the current time zone is pacific/gambier.",
          examples: [
            "Date.pacific_gambier?",
            "Date.new(\"2024-03-05\").pacific_gambier?",
            "Time.zone = \"Etc/UTC\" Date.pacific_gambier?"
          ]
        },
        "pacific_guadalcanal?" => {
          name: "pacific_guadalcanal?",
          description:
            "returns whether the current time zone is pacific/guadalcanal.",
          examples: [
            "Date.pacific_guadalcanal?",
            "Date.new(\"2024-03-05\").pacific_guadalcanal?",
            "Time.zone = \"Etc/UTC\" Date.pacific_guadalcanal?"
          ]
        },
        "pacific_guam?" => {
          name: "pacific_guam?",
          description: "returns whether the current time zone is pacific/guam.",
          examples: [
            "Date.pacific_guam?",
            "Date.new(\"2024-03-05\").pacific_guam?",
            "Time.zone = \"Etc/UTC\" Date.pacific_guam?"
          ]
        },
        "pacific_honolulu?" => {
          name: "pacific_honolulu?",
          description:
            "returns whether the current time zone is pacific/honolulu.",
          examples: [
            "Date.pacific_honolulu?",
            "Date.new(\"2024-03-05\").pacific_honolulu?",
            "Time.zone = \"Etc/UTC\" Date.pacific_honolulu?"
          ]
        },
        "pacific_johnston?" => {
          name: "pacific_johnston?",
          description:
            "returns whether the current time zone is pacific/johnston.",
          examples: [
            "Date.pacific_johnston?",
            "Date.new(\"2024-03-05\").pacific_johnston?",
            "Time.zone = \"Etc/UTC\" Date.pacific_johnston?"
          ]
        },
        "pacific_kanton?" => {
          name: "pacific_kanton?",
          description:
            "returns whether the current time zone is pacific/kanton.",
          examples: [
            "Date.pacific_kanton?",
            "Date.new(\"2024-03-05\").pacific_kanton?",
            "Time.zone = \"Etc/UTC\" Date.pacific_kanton?"
          ]
        },
        "pacific_kiritimati?" => {
          name: "pacific_kiritimati?",
          description:
            "returns whether the current time zone is pacific/kiritimati.",
          examples: [
            "Date.pacific_kiritimati?",
            "Date.new(\"2024-03-05\").pacific_kiritimati?",
            "Time.zone = \"Etc/UTC\" Date.pacific_kiritimati?"
          ]
        },
        "pacific_kosrae?" => {
          name: "pacific_kosrae?",
          description:
            "returns whether the current time zone is pacific/kosrae.",
          examples: [
            "Date.pacific_kosrae?",
            "Date.new(\"2024-03-05\").pacific_kosrae?",
            "Time.zone = \"Etc/UTC\" Date.pacific_kosrae?"
          ]
        },
        "pacific_kwajalein?" => {
          name: "pacific_kwajalein?",
          description:
            "returns whether the current time zone is pacific/kwajalein.",
          examples: [
            "Date.pacific_kwajalein?",
            "Date.new(\"2024-03-05\").pacific_kwajalein?",
            "Time.zone = \"Etc/UTC\" Date.pacific_kwajalein?"
          ]
        },
        "pacific_majuro?" => {
          name: "pacific_majuro?",
          description:
            "returns whether the current time zone is pacific/majuro.",
          examples: [
            "Date.pacific_majuro?",
            "Date.new(\"2024-03-05\").pacific_majuro?",
            "Time.zone = \"Etc/UTC\" Date.pacific_majuro?"
          ]
        },
        "pacific_marquesas?" => {
          name: "pacific_marquesas?",
          description:
            "returns whether the current time zone is pacific/marquesas.",
          examples: [
            "Date.pacific_marquesas?",
            "Date.new(\"2024-03-05\").pacific_marquesas?",
            "Time.zone = \"Etc/UTC\" Date.pacific_marquesas?"
          ]
        },
        "pacific_midway?" => {
          name: "pacific_midway?",
          description:
            "returns whether the current time zone is pacific/midway.",
          examples: [
            "Date.pacific_midway?",
            "Date.new(\"2024-03-05\").pacific_midway?",
            "Time.zone = \"Etc/UTC\" Date.pacific_midway?"
          ]
        },
        "pacific_nauru?" => {
          name: "pacific_nauru?",
          description:
            "returns whether the current time zone is pacific/nauru.",
          examples: [
            "Date.pacific_nauru?",
            "Date.new(\"2024-03-05\").pacific_nauru?",
            "Time.zone = \"Etc/UTC\" Date.pacific_nauru?"
          ]
        },
        "pacific_niue?" => {
          name: "pacific_niue?",
          description: "returns whether the current time zone is pacific/niue.",
          examples: [
            "Date.pacific_niue?",
            "Date.new(\"2024-03-05\").pacific_niue?",
            "Time.zone = \"Etc/UTC\" Date.pacific_niue?"
          ]
        },
        "pacific_norfolk?" => {
          name: "pacific_norfolk?",
          description:
            "returns whether the current time zone is pacific/norfolk.",
          examples: [
            "Date.pacific_norfolk?",
            "Date.new(\"2024-03-05\").pacific_norfolk?",
            "Time.zone = \"Etc/UTC\" Date.pacific_norfolk?"
          ]
        },
        "pacific_noumea?" => {
          name: "pacific_noumea?",
          description:
            "returns whether the current time zone is pacific/noumea.",
          examples: [
            "Date.pacific_noumea?",
            "Date.new(\"2024-03-05\").pacific_noumea?",
            "Time.zone = \"Etc/UTC\" Date.pacific_noumea?"
          ]
        },
        "pacific_pago_pago?" => {
          name: "pacific_pago_pago?",
          description:
            "returns whether the current time zone is pacific/pago_pago.",
          examples: [
            "Date.pacific_pago_pago?",
            "Date.new(\"2024-03-05\").pacific_pago_pago?",
            "Time.zone = \"Etc/UTC\" Date.pacific_pago_pago?"
          ]
        },
        "pacific_palau?" => {
          name: "pacific_palau?",
          description:
            "returns whether the current time zone is pacific/palau.",
          examples: [
            "Date.pacific_palau?",
            "Date.new(\"2024-03-05\").pacific_palau?",
            "Time.zone = \"Etc/UTC\" Date.pacific_palau?"
          ]
        },
        "pacific_pitcairn?" => {
          name: "pacific_pitcairn?",
          description:
            "returns whether the current time zone is pacific/pitcairn.",
          examples: [
            "Date.pacific_pitcairn?",
            "Date.new(\"2024-03-05\").pacific_pitcairn?",
            "Time.zone = \"Etc/UTC\" Date.pacific_pitcairn?"
          ]
        },
        "pacific_pohnpei?" => {
          name: "pacific_pohnpei?",
          description:
            "returns whether the current time zone is pacific/pohnpei.",
          examples: [
            "Date.pacific_pohnpei?",
            "Date.new(\"2024-03-05\").pacific_pohnpei?",
            "Time.zone = \"Etc/UTC\" Date.pacific_pohnpei?"
          ]
        },
        "pacific_ponape?" => {
          name: "pacific_ponape?",
          description:
            "returns whether the current time zone is pacific/ponape.",
          examples: [
            "Date.pacific_ponape?",
            "Date.new(\"2024-03-05\").pacific_ponape?",
            "Time.zone = \"Etc/UTC\" Date.pacific_ponape?"
          ]
        },
        "pacific_port_moresby?" => {
          name: "pacific_port_moresby?",
          description:
            "returns whether the current time zone is pacific/port_moresby.",
          examples: [
            "Date.pacific_port_moresby?",
            "Date.new(\"2024-03-05\").pacific_port_moresby?",
            "Time.zone = \"Etc/UTC\" Date.pacific_port_moresby?"
          ]
        },
        "pacific_rarotonga?" => {
          name: "pacific_rarotonga?",
          description:
            "returns whether the current time zone is pacific/rarotonga.",
          examples: [
            "Date.pacific_rarotonga?",
            "Date.new(\"2024-03-05\").pacific_rarotonga?",
            "Time.zone = \"Etc/UTC\" Date.pacific_rarotonga?"
          ]
        },
        "pacific_saipan?" => {
          name: "pacific_saipan?",
          description:
            "returns whether the current time zone is pacific/saipan.",
          examples: [
            "Date.pacific_saipan?",
            "Date.new(\"2024-03-05\").pacific_saipan?",
            "Time.zone = \"Etc/UTC\" Date.pacific_saipan?"
          ]
        },
        "pacific_samoa?" => {
          name: "pacific_samoa?",
          description:
            "returns whether the current time zone is pacific/samoa.",
          examples: [
            "Date.pacific_samoa?",
            "Date.new(\"2024-03-05\").pacific_samoa?",
            "Time.zone = \"Etc/UTC\" Date.pacific_samoa?"
          ]
        },
        "pacific_tahiti?" => {
          name: "pacific_tahiti?",
          description:
            "returns whether the current time zone is pacific/tahiti.",
          examples: [
            "Date.pacific_tahiti?",
            "Date.new(\"2024-03-05\").pacific_tahiti?",
            "Time.zone = \"Etc/UTC\" Date.pacific_tahiti?"
          ]
        },
        "pacific_tarawa?" => {
          name: "pacific_tarawa?",
          description:
            "returns whether the current time zone is pacific/tarawa.",
          examples: [
            "Date.pacific_tarawa?",
            "Date.new(\"2024-03-05\").pacific_tarawa?",
            "Time.zone = \"Etc/UTC\" Date.pacific_tarawa?"
          ]
        },
        "pacific_tongatapu?" => {
          name: "pacific_tongatapu?",
          description:
            "returns whether the current time zone is pacific/tongatapu.",
          examples: [
            "Date.pacific_tongatapu?",
            "Date.new(\"2024-03-05\").pacific_tongatapu?",
            "Time.zone = \"Etc/UTC\" Date.pacific_tongatapu?"
          ]
        },
        "pacific_truk?" => {
          name: "pacific_truk?",
          description: "returns whether the current time zone is pacific/truk.",
          examples: [
            "Date.pacific_truk?",
            "Date.new(\"2024-03-05\").pacific_truk?",
            "Time.zone = \"Etc/UTC\" Date.pacific_truk?"
          ]
        },
        "pacific_wake?" => {
          name: "pacific_wake?",
          description: "returns whether the current time zone is pacific/wake.",
          examples: [
            "Date.pacific_wake?",
            "Date.new(\"2024-03-05\").pacific_wake?",
            "Time.zone = \"Etc/UTC\" Date.pacific_wake?"
          ]
        },
        "pacific_wallis?" => {
          name: "pacific_wallis?",
          description:
            "returns whether the current time zone is pacific/wallis.",
          examples: [
            "Date.pacific_wallis?",
            "Date.new(\"2024-03-05\").pacific_wallis?",
            "Time.zone = \"Etc/UTC\" Date.pacific_wallis?"
          ]
        },
        "pacific_yap?" => {
          name: "pacific_yap?",
          description: "returns whether the current time zone is pacific/yap.",
          examples: [
            "Date.pacific_yap?",
            "Date.new(\"2024-03-05\").pacific_yap?",
            "Time.zone = \"Etc/UTC\" Date.pacific_yap?"
          ]
        },
        "poland?" => {
          name: "poland?",
          description: "returns whether the current time zone is poland.",
          examples: [
            "Date.poland?",
            "Date.new(\"2024-03-05\").poland?",
            "Time.zone = \"Etc/UTC\" Date.poland?"
          ]
        },
        "portugal?" => {
          name: "portugal?",
          description: "returns whether the current time zone is portugal.",
          examples: [
            "Date.portugal?",
            "Date.new(\"2024-03-05\").portugal?",
            "Time.zone = \"Etc/UTC\" Date.portugal?"
          ]
        },
        "roc?" => {
          name: "roc?",
          description: "returns whether the current time zone is roc.",
          examples: [
            "Date.roc?",
            "Date.new(\"2024-03-05\").roc?",
            "Time.zone = \"Etc/UTC\" Date.roc?"
          ]
        },
        "rok?" => {
          name: "rok?",
          description: "returns whether the current time zone is rok.",
          examples: [
            "Date.rok?",
            "Date.new(\"2024-03-05\").rok?",
            "Time.zone = \"Etc/UTC\" Date.rok?"
          ]
        },
        "singapore?" => {
          name: "singapore?",
          description: "returns whether the current time zone is singapore.",
          examples: [
            "Date.singapore?",
            "Date.new(\"2024-03-05\").singapore?",
            "Time.zone = \"Etc/UTC\" Date.singapore?"
          ]
        },
        "turkey?" => {
          name: "turkey?",
          description: "returns whether the current time zone is turkey.",
          examples: [
            "Date.turkey?",
            "Date.new(\"2024-03-05\").turkey?",
            "Time.zone = \"Etc/UTC\" Date.turkey?"
          ]
        },
        "uct?" => {
          name: "uct?",
          description: "returns whether the current time zone is uct.",
          examples: [
            "Date.uct?",
            "Date.new(\"2024-03-05\").uct?",
            "Time.zone = \"Etc/UTC\" Date.uct?"
          ]
        },
        "us_alaska?" => {
          name: "us_alaska?",
          description: "returns whether the current time zone is us/alaska.",
          examples: [
            "Date.us_alaska?",
            "Date.new(\"2024-03-05\").us_alaska?",
            "Time.zone = \"Etc/UTC\" Date.us_alaska?"
          ]
        },
        "us_aleutian?" => {
          name: "us_aleutian?",
          description: "returns whether the current time zone is us/aleutian.",
          examples: [
            "Date.us_aleutian?",
            "Date.new(\"2024-03-05\").us_aleutian?",
            "Time.zone = \"Etc/UTC\" Date.us_aleutian?"
          ]
        },
        "us_arizona?" => {
          name: "us_arizona?",
          description: "returns whether the current time zone is us/arizona.",
          examples: [
            "Date.us_arizona?",
            "Date.new(\"2024-03-05\").us_arizona?",
            "Time.zone = \"Etc/UTC\" Date.us_arizona?"
          ]
        },
        "us_central?" => {
          name: "us_central?",
          description: "returns whether the current time zone is us/central.",
          examples: [
            "Date.us_central?",
            "Date.new(\"2024-03-05\").us_central?",
            "Time.zone = \"Etc/UTC\" Date.us_central?"
          ]
        },
        "us_east_minus_indiana?" => {
          name: "us_east_minus_indiana?",
          description:
            "returns whether the current time zone is us/east-indiana.",
          examples: [
            "Date.us_east_minus_indiana?",
            "Date.new(\"2024-03-05\").us_east_minus_indiana?",
            "Time.zone = \"Etc/UTC\" Date.us_east_minus_indiana?"
          ]
        },
        "us_eastern?" => {
          name: "us_eastern?",
          description: "returns whether the current time zone is us/eastern.",
          examples: [
            "Date.us_eastern?",
            "Date.new(\"2024-03-05\").us_eastern?",
            "Time.zone = \"Etc/UTC\" Date.us_eastern?"
          ]
        },
        "us_hawaii?" => {
          name: "us_hawaii?",
          description: "returns whether the current time zone is us/hawaii.",
          examples: [
            "Date.us_hawaii?",
            "Date.new(\"2024-03-05\").us_hawaii?",
            "Time.zone = \"Etc/UTC\" Date.us_hawaii?"
          ]
        },
        "us_indiana_minus_starke?" => {
          name: "us_indiana_minus_starke?",
          description:
            "returns whether the current time zone is us/indiana-starke.",
          examples: [
            "Date.us_indiana_minus_starke?",
            "Date.new(\"2024-03-05\").us_indiana_minus_starke?",
            "Time.zone = \"Etc/UTC\" Date.us_indiana_minus_starke?"
          ]
        },
        "us_michigan?" => {
          name: "us_michigan?",
          description: "returns whether the current time zone is us/michigan.",
          examples: [
            "Date.us_michigan?",
            "Date.new(\"2024-03-05\").us_michigan?",
            "Time.zone = \"Etc/UTC\" Date.us_michigan?"
          ]
        },
        "us_mountain?" => {
          name: "us_mountain?",
          description: "returns whether the current time zone is us/mountain.",
          examples: [
            "Date.us_mountain?",
            "Date.new(\"2024-03-05\").us_mountain?",
            "Time.zone = \"Etc/UTC\" Date.us_mountain?"
          ]
        },
        "us_pacific?" => {
          name: "us_pacific?",
          description: "returns whether the current time zone is us/pacific.",
          examples: [
            "Date.us_pacific?",
            "Date.new(\"2024-03-05\").us_pacific?",
            "Time.zone = \"Etc/UTC\" Date.us_pacific?"
          ]
        },
        "us_samoa?" => {
          name: "us_samoa?",
          description: "returns whether the current time zone is us/samoa.",
          examples: [
            "Date.us_samoa?",
            "Date.new(\"2024-03-05\").us_samoa?",
            "Time.zone = \"Etc/UTC\" Date.us_samoa?"
          ]
        },
        "utc?" => {
          name: "utc?",
          description: "returns whether the current time zone is utc.",
          examples: [
            "Date.utc?",
            "Date.new(\"2024-03-05\").utc?",
            "Time.zone = \"Etc/UTC\" Date.utc?"
          ]
        },
        "universal?" => {
          name: "universal?",
          description: "returns whether the current time zone is universal.",
          examples: [
            "Date.universal?",
            "Date.new(\"2024-03-05\").universal?",
            "Time.zone = \"Etc/UTC\" Date.universal?"
          ]
        },
        "w_minus_su?" => {
          name: "w_minus_su?",
          description: "returns whether the current time zone is w-su.",
          examples: [
            "Date.w_minus_su?",
            "Date.new(\"2024-03-05\").w_minus_su?",
            "Time.zone = \"Etc/UTC\" Date.w_minus_su?"
          ]
        },
        "wet?" => {
          name: "wet?",
          description: "returns whether the current time zone is wet.",
          examples: [
            "Date.wet?",
            "Date.new(\"2024-03-05\").wet?",
            "Time.zone = \"Etc/UTC\" Date.wet?"
          ]
        },
        "zulu?" => {
          name: "zulu?",
          description: "returns whether the current time zone is zulu.",
          examples: [
            "Date.zulu?",
            "Date.new(\"2024-03-05\").zulu?",
            "Time.zone = \"Etc/UTC\" Date.zulu?"
          ]
        },
        "as_json" => {
          name: "as_json",
          description: "converts the date to a json-compatible value.",
          examples: [
            "Date.new(\"2024-03-05\").as_json",
            "Date.today.as_json",
            "Date.tomorrow.as_json"
          ]
        },
        "to_parameter" => {
          name: "to_parameter",
          description: "converts the date to a url parameter string.",
          examples: [
            "Date.new(\"2024-03-05\").to_parameter",
            "Date.today.to_parameter",
            "Date.tomorrow.to_parameter"
          ]
        },
        "to_json" => {
          name: "to_json",
          description: "serializes the date as json.",
          examples: [
            "Date.new(\"2024-03-05\").to_json",
            "Date.today.to_json",
            "Date.tomorrow.to_json"
          ]
        },
        "nanosecond" => {
          name: "nanosecond",
          description:
            "returns zero because dates have no nanosecond component.",
          examples: [
            "Date.new(\"2024-03-05\").nanosecond",
            "Date.new.nanosecond",
            "Date.nanosecond"
          ]
        },
        "nanoseconds" => {
          name: "nanoseconds",
          description:
            "returns zero because dates have no nanosecond component.",
          examples: [
            "Date.new(\"2024-03-05\").nanoseconds",
            "Date.new.nanoseconds",
            "Date.nanoseconds"
          ]
        },
        "millisecond" => {
          name: "millisecond",
          description:
            "returns zero because dates have no millisecond component.",
          examples: [
            "Date.new(\"2024-03-05\").millisecond",
            "Date.new.millisecond",
            "Date.millisecond"
          ]
        },
        "milliseconds" => {
          name: "milliseconds",
          description:
            "returns zero because dates have no millisecond component.",
          examples: [
            "Date.new(\"2024-03-05\").milliseconds",
            "Date.new.milliseconds",
            "Date.milliseconds"
          ]
        },
        "utc" => {
          name: "utc",
          description: "returns the date unchanged.",
          examples: ["Date.new(\"2024-03-05\").utc", "Date.new.utc", "Date.utc"]
        },
        "local" => {
          name: "local",
          description: "returns the date unchanged.",
          examples: [
            "Date.new(\"2024-03-05\").local",
            "Date.new.local",
            "Date.local"
          ]
        },
        "beginning_of_day" => {
          name: "beginning_of_day",
          description: "returns the beginning of the date as a time.",
          examples: [
            "Date.new(\"2024-03-05\").beginning_of_day",
            "Date.new(\"2000-01-01\").beginning_of_day",
            "Date.new.beginning_of_day"
          ]
        },
        "end_of_day" => {
          name: "end_of_day",
          description: "returns the end of the date as a time.",
          examples: [
            "Date.new(\"2024-03-05\").end_of_day",
            "Date.new(\"2000-01-01\").end_of_day",
            "Date.new.end_of_day"
          ]
        }
      }.freeze
      def self.function_documentation(scope)
        return INSTANCE_FUNCTIONS if scope == :instance
        return CLASS_FUNCTIONS if scope == :class

        {}
      end

      class << self
        delegate(
          :code_zone,
          :code_format,
          :code_iso8601,
          :code_iso,
          :code_rfc2822,
          :code_rfc3339,
          :code_rfc,
          :code_to_list,
          :code_to_integer,
          :code_to_decimal,
          :code_africa_abidjan?,
          :code_africa_accra?,
          :code_africa_addis_ababa?,
          :code_africa_algiers?,
          :code_africa_asmara?,
          :code_africa_asmera?,
          :code_africa_bamako?,
          :code_africa_bangui?,
          :code_africa_banjul?,
          :code_africa_bissau?,
          :code_africa_blantyre?,
          :code_africa_brazzaville?,
          :code_africa_bujumbura?,
          :code_africa_cairo?,
          :code_africa_casablanca?,
          :code_africa_ceuta?,
          :code_africa_conakry?,
          :code_africa_dakar?,
          :code_africa_dar_es_salaam?,
          :code_africa_djibouti?,
          :code_africa_douala?,
          :code_africa_el_aaiun?,
          :code_africa_freetown?,
          :code_africa_gaborone?,
          :code_africa_harare?,
          :code_africa_johannesburg?,
          :code_africa_juba?,
          :code_africa_kampala?,
          :code_africa_khartoum?,
          :code_africa_kigali?,
          :code_africa_kinshasa?,
          :code_africa_lagos?,
          :code_africa_libreville?,
          :code_africa_lome?,
          :code_africa_luanda?,
          :code_africa_lubumbashi?,
          :code_africa_lusaka?,
          :code_africa_malabo?,
          :code_africa_maputo?,
          :code_africa_maseru?,
          :code_africa_mbabane?,
          :code_africa_mogadishu?,
          :code_africa_monrovia?,
          :code_africa_nairobi?,
          :code_africa_ndjamena?,
          :code_africa_niamey?,
          :code_africa_nouakchott?,
          :code_africa_ouagadougou?,
          :code_africa_porto_minus_novo?,
          :code_africa_sao_tome?,
          :code_africa_timbuktu?,
          :code_africa_tripoli?,
          :code_africa_tunis?,
          :code_africa_windhoek?,
          :code_america_adak?,
          :code_america_anchorage?,
          :code_america_anguilla?,
          :code_america_antigua?,
          :code_america_araguaina?,
          :code_america_argentina_buenos_aires?,
          :code_america_argentina_catamarca?,
          :code_america_argentina_comodrivadavia?,
          :code_america_argentina_cordoba?,
          :code_america_argentina_jujuy?,
          :code_america_argentina_la_rioja?,
          :code_america_argentina_mendoza?,
          :code_america_argentina_rio_gallegos?,
          :code_america_argentina_salta?,
          :code_america_argentina_san_juan?,
          :code_america_argentina_san_luis?,
          :code_america_argentina_tucuman?,
          :code_america_argentina_ushuaia?,
          :code_america_aruba?,
          :code_america_asuncion?,
          :code_america_atikokan?,
          :code_america_atka?,
          :code_america_bahia?,
          :code_america_bahia_banderas?,
          :code_america_barbados?,
          :code_america_belem?,
          :code_america_belize?,
          :code_america_blanc_minus_sablon?,
          :code_america_boa_vista?,
          :code_america_bogota?,
          :code_america_boise?,
          :code_america_buenos_aires?,
          :code_america_cambridge_bay?,
          :code_america_campo_grande?,
          :code_america_cancun?,
          :code_america_caracas?,
          :code_america_catamarca?,
          :code_america_cayenne?,
          :code_america_cayman?,
          :code_america_chicago?,
          :code_america_chihuahua?,
          :code_america_ciudad_juarez?,
          :code_america_coral_harbour?,
          :code_america_cordoba?,
          :code_america_costa_rica?,
          :code_america_coyhaique?,
          :code_america_creston?,
          :code_america_cuiaba?,
          :code_america_curacao?,
          :code_america_danmarkshavn?,
          :code_america_dawson?,
          :code_america_dawson_creek?,
          :code_america_denver?,
          :code_america_detroit?,
          :code_america_dominica?,
          :code_america_edmonton?,
          :code_america_eirunepe?,
          :code_america_el_salvador?,
          :code_america_ensenada?,
          :code_america_fort_nelson?,
          :code_america_fort_wayne?,
          :code_america_fortaleza?,
          :code_america_glace_bay?,
          :code_america_godthab?,
          :code_america_goose_bay?,
          :code_america_grand_turk?,
          :code_america_grenada?,
          :code_america_guadeloupe?,
          :code_america_guatemala?,
          :code_america_guayaquil?,
          :code_america_guyana?,
          :code_america_halifax?,
          :code_america_havana?,
          :code_america_hermosillo?,
          :code_america_indiana_indianapolis?,
          :code_america_indiana_knox?,
          :code_america_indiana_marengo?,
          :code_america_indiana_petersburg?,
          :code_america_indiana_tell_city?,
          :code_america_indiana_vevay?,
          :code_america_indiana_vincennes?,
          :code_america_indiana_winamac?,
          :code_america_indianapolis?,
          :code_america_inuvik?,
          :code_america_iqaluit?,
          :code_america_jamaica?,
          :code_america_jujuy?,
          :code_america_juneau?,
          :code_america_kentucky_louisville?,
          :code_america_kentucky_monticello?,
          :code_america_knox_in?,
          :code_america_kralendijk?,
          :code_america_la_paz?,
          :code_america_lima?,
          :code_america_los_angeles?,
          :code_america_louisville?,
          :code_america_lower_princes?,
          :code_america_maceio?,
          :code_america_managua?,
          :code_america_manaus?,
          :code_america_marigot?,
          :code_america_martinique?,
          :code_america_matamoros?,
          :code_america_mazatlan?,
          :code_america_mendoza?,
          :code_america_menominee?,
          :code_america_merida?,
          :code_america_metlakatla?,
          :code_america_mexico_city?,
          :code_america_miquelon?,
          :code_america_moncton?,
          :code_america_monterrey?,
          :code_america_montevideo?,
          :code_america_montreal?,
          :code_america_montserrat?,
          :code_america_nassau?,
          :code_america_new_york?,
          :code_america_nipigon?,
          :code_america_nome?,
          :code_america_noronha?,
          :code_america_north_dakota_beulah?,
          :code_america_north_dakota_center?,
          :code_america_north_dakota_new_salem?,
          :code_america_nuuk?,
          :code_america_ojinaga?,
          :code_america_panama?,
          :code_america_pangnirtung?,
          :code_america_paramaribo?,
          :code_america_phoenix?,
          :code_america_port_minus_au_minus_prince?,
          :code_america_port_of_spain?,
          :code_america_porto_acre?,
          :code_america_porto_velho?,
          :code_america_puerto_rico?,
          :code_america_punta_arenas?,
          :code_america_rainy_river?,
          :code_america_rankin_inlet?,
          :code_america_recife?,
          :code_america_regina?,
          :code_america_resolute?,
          :code_america_rio_branco?,
          :code_america_rosario?,
          :code_america_santa_isabel?,
          :code_america_santarem?,
          :code_america_santiago?,
          :code_america_santo_domingo?,
          :code_america_sao_paulo?,
          :code_america_scoresbysund?,
          :code_america_shiprock?,
          :code_america_sitka?,
          :code_america_st_barthelemy?,
          :code_america_st_johns?,
          :code_america_st_kitts?,
          :code_america_st_lucia?,
          :code_america_st_thomas?,
          :code_america_st_vincent?,
          :code_america_swift_current?,
          :code_america_tegucigalpa?,
          :code_america_thule?,
          :code_america_thunder_bay?,
          :code_america_tijuana?,
          :code_america_toronto?,
          :code_america_tortola?,
          :code_america_vancouver?,
          :code_america_virgin?,
          :code_america_whitehorse?,
          :code_america_winnipeg?,
          :code_america_yakutat?,
          :code_america_yellowknife?,
          :code_antarctica_casey?,
          :code_antarctica_davis?,
          :code_antarctica_dumontdurville?,
          :code_antarctica_macquarie?,
          :code_antarctica_mawson?,
          :code_antarctica_mcmurdo?,
          :code_antarctica_palmer?,
          :code_antarctica_rothera?,
          :code_antarctica_south_pole?,
          :code_antarctica_syowa?,
          :code_antarctica_troll?,
          :code_antarctica_vostok?,
          :code_arctic_longyearbyen?,
          :code_asia_aden?,
          :code_asia_almaty?,
          :code_asia_amman?,
          :code_asia_anadyr?,
          :code_asia_aqtau?,
          :code_asia_aqtobe?,
          :code_asia_ashgabat?,
          :code_asia_ashkhabad?,
          :code_asia_atyrau?,
          :code_asia_baghdad?,
          :code_asia_bahrain?,
          :code_asia_baku?,
          :code_asia_bangkok?,
          :code_asia_barnaul?,
          :code_asia_beirut?,
          :code_asia_bishkek?,
          :code_asia_brunei?,
          :code_asia_calcutta?,
          :code_asia_chita?,
          :code_asia_choibalsan?,
          :code_asia_chongqing?,
          :code_asia_chungking?,
          :code_asia_colombo?,
          :code_asia_dacca?,
          :code_asia_damascus?,
          :code_asia_dhaka?,
          :code_asia_dili?,
          :code_asia_dubai?,
          :code_asia_dushanbe?,
          :code_asia_famagusta?,
          :code_asia_gaza?,
          :code_asia_harbin?,
          :code_asia_hebron?,
          :code_asia_ho_chi_minh?,
          :code_asia_hong_kong?,
          :code_asia_hovd?,
          :code_asia_irkutsk?,
          :code_asia_istanbul?,
          :code_asia_jakarta?,
          :code_asia_jayapura?,
          :code_asia_jerusalem?,
          :code_asia_kabul?,
          :code_asia_kamchatka?,
          :code_asia_karachi?,
          :code_asia_kashgar?,
          :code_asia_kathmandu?,
          :code_asia_katmandu?,
          :code_asia_khandyga?,
          :code_asia_kolkata?,
          :code_asia_krasnoyarsk?,
          :code_asia_kuala_lumpur?,
          :code_asia_kuching?,
          :code_asia_kuwait?,
          :code_asia_macao?,
          :code_asia_macau?,
          :code_asia_magadan?,
          :code_asia_makassar?,
          :code_asia_manila?,
          :code_asia_muscat?,
          :code_asia_nicosia?,
          :code_asia_novokuznetsk?,
          :code_asia_novosibirsk?,
          :code_asia_omsk?,
          :code_asia_oral?,
          :code_asia_phnom_penh?,
          :code_asia_pontianak?,
          :code_asia_pyongyang?,
          :code_asia_qatar?,
          :code_asia_qostanay?,
          :code_asia_qyzylorda?,
          :code_asia_rangoon?,
          :code_asia_riyadh?,
          :code_asia_saigon?,
          :code_asia_sakhalin?,
          :code_asia_samarkand?,
          :code_asia_seoul?,
          :code_asia_shanghai?,
          :code_asia_singapore?,
          :code_asia_srednekolymsk?,
          :code_asia_taipei?,
          :code_asia_tashkent?,
          :code_asia_tbilisi?,
          :code_asia_tehran?,
          :code_asia_tel_aviv?,
          :code_asia_thimbu?,
          :code_asia_thimphu?,
          :code_asia_tokyo?,
          :code_asia_tomsk?,
          :code_asia_ujung_pandang?,
          :code_asia_ulaanbaatar?,
          :code_asia_ulan_bator?,
          :code_asia_urumqi?,
          :code_asia_ust_minus_nera?,
          :code_asia_vientiane?,
          :code_asia_vladivostok?,
          :code_asia_yakutsk?,
          :code_asia_yangon?,
          :code_asia_yekaterinburg?,
          :code_asia_yerevan?,
          :code_atlantic_azores?,
          :code_atlantic_bermuda?,
          :code_atlantic_canary?,
          :code_atlantic_cape_verde?,
          :code_atlantic_faeroe?,
          :code_atlantic_faroe?,
          :code_atlantic_jan_mayen?,
          :code_atlantic_madeira?,
          :code_atlantic_reykjavik?,
          :code_atlantic_south_georgia?,
          :code_atlantic_st_helena?,
          :code_atlantic_stanley?,
          :code_australia_act?,
          :code_australia_adelaide?,
          :code_australia_brisbane?,
          :code_australia_broken_hill?,
          :code_australia_canberra?,
          :code_australia_currie?,
          :code_australia_darwin?,
          :code_australia_eucla?,
          :code_australia_hobart?,
          :code_australia_lhi?,
          :code_australia_lindeman?,
          :code_australia_lord_howe?,
          :code_australia_melbourne?,
          :code_australia_nsw?,
          :code_australia_north?,
          :code_australia_perth?,
          :code_australia_queensland?,
          :code_australia_south?,
          :code_australia_sydney?,
          :code_australia_tasmania?,
          :code_australia_victoria?,
          :code_australia_west?,
          :code_australia_yancowinna?,
          :code_brazil_acre?,
          :code_brazil_denoronha?,
          :code_brazil_east?,
          :code_brazil_west?,
          :code_cet?,
          :code_cst6cdt?,
          :code_canada_atlantic?,
          :code_canada_central?,
          :code_canada_eastern?,
          :code_canada_mountain?,
          :code_canada_newfoundland?,
          :code_canada_pacific?,
          :code_canada_saskatchewan?,
          :code_canada_yukon?,
          :code_chile_continental?,
          :code_chile_easterisland?,
          :code_cuba?,
          :code_eet?,
          :code_est?,
          :code_est5edt?,
          :code_egypt?,
          :code_eire?,
          :code_etc_gmt?,
          :code_etc_gmt_plus_0?,
          :code_etc_gmt_plus_1?,
          :code_etc_gmt_plus_10?,
          :code_etc_gmt_plus_11?,
          :code_etc_gmt_plus_12?,
          :code_etc_gmt_plus_2?,
          :code_etc_gmt_plus_3?,
          :code_etc_gmt_plus_4?,
          :code_etc_gmt_plus_5?,
          :code_etc_gmt_plus_6?,
          :code_etc_gmt_plus_7?,
          :code_etc_gmt_plus_8?,
          :code_etc_gmt_plus_9?,
          :code_etc_gmt_minus_0?,
          :code_etc_gmt_minus_1?,
          :code_etc_gmt_minus_10?,
          :code_etc_gmt_minus_11?,
          :code_etc_gmt_minus_12?,
          :code_etc_gmt_minus_13?,
          :code_etc_gmt_minus_14?,
          :code_etc_gmt_minus_2?,
          :code_etc_gmt_minus_3?,
          :code_etc_gmt_minus_4?,
          :code_etc_gmt_minus_5?,
          :code_etc_gmt_minus_6?,
          :code_etc_gmt_minus_7?,
          :code_etc_gmt_minus_8?,
          :code_etc_gmt_minus_9?,
          :code_etc_gmt0?,
          :code_etc_greenwich?,
          :code_etc_uct?,
          :code_etc_utc?,
          :code_etc_universal?,
          :code_etc_zulu?,
          :code_europe_amsterdam?,
          :code_europe_andorra?,
          :code_europe_astrakhan?,
          :code_europe_athens?,
          :code_europe_belfast?,
          :code_europe_belgrade?,
          :code_europe_berlin?,
          :code_europe_bratislava?,
          :code_europe_brussels?,
          :code_europe_bucharest?,
          :code_europe_budapest?,
          :code_europe_busingen?,
          :code_europe_chisinau?,
          :code_europe_copenhagen?,
          :code_europe_dublin?,
          :code_europe_gibraltar?,
          :code_europe_guernsey?,
          :code_europe_helsinki?,
          :code_europe_isle_of_man?,
          :code_europe_istanbul?,
          :code_europe_jersey?,
          :code_europe_kaliningrad?,
          :code_europe_kiev?,
          :code_europe_kirov?,
          :code_europe_kyiv?,
          :code_europe_lisbon?,
          :code_europe_ljubljana?,
          :code_europe_london?,
          :code_europe_luxembourg?,
          :code_europe_madrid?,
          :code_europe_malta?,
          :code_europe_mariehamn?,
          :code_europe_minsk?,
          :code_europe_monaco?,
          :code_europe_moscow?,
          :code_europe_nicosia?,
          :code_europe_oslo?,
          :code_europe_paris?,
          :code_europe_podgorica?,
          :code_europe_prague?,
          :code_europe_riga?,
          :code_europe_rome?,
          :code_europe_samara?,
          :code_europe_san_marino?,
          :code_europe_sarajevo?,
          :code_europe_saratov?,
          :code_europe_simferopol?,
          :code_europe_skopje?,
          :code_europe_sofia?,
          :code_europe_stockholm?,
          :code_europe_tallinn?,
          :code_europe_tirane?,
          :code_europe_tiraspol?,
          :code_europe_ulyanovsk?,
          :code_europe_uzhgorod?,
          :code_europe_vaduz?,
          :code_europe_vatican?,
          :code_europe_vienna?,
          :code_europe_vilnius?,
          :code_europe_volgograd?,
          :code_europe_warsaw?,
          :code_europe_zagreb?,
          :code_europe_zaporozhye?,
          :code_europe_zurich?,
          :code_factory?,
          :code_gb?,
          :code_gb_minus_eire?,
          :code_gmt?,
          :code_gmt_plus_0?,
          :code_gmt_minus_0?,
          :code_gmt0?,
          :code_greenwich?,
          :code_hst?,
          :code_hongkong?,
          :code_iceland?,
          :code_indian_antananarivo?,
          :code_indian_chagos?,
          :code_indian_christmas?,
          :code_indian_cocos?,
          :code_indian_comoro?,
          :code_indian_kerguelen?,
          :code_indian_mahe?,
          :code_indian_maldives?,
          :code_indian_mauritius?,
          :code_indian_mayotte?,
          :code_indian_reunion?,
          :code_iran?,
          :code_israel?,
          :code_jamaica?,
          :code_japan?,
          :code_kwajalein?,
          :code_libya?,
          :code_met?,
          :code_mst?,
          :code_mst7mdt?,
          :code_mexico_bajanorte?,
          :code_mexico_bajasur?,
          :code_mexico_general?,
          :code_nz?,
          :code_nz_minus_chat?,
          :code_navajo?,
          :code_prc?,
          :code_pst8pdt?,
          :code_pacific_apia?,
          :code_pacific_auckland?,
          :code_pacific_bougainville?,
          :code_pacific_chatham?,
          :code_pacific_chuuk?,
          :code_pacific_easter?,
          :code_pacific_efate?,
          :code_pacific_enderbury?,
          :code_pacific_fakaofo?,
          :code_pacific_fiji?,
          :code_pacific_funafuti?,
          :code_pacific_galapagos?,
          :code_pacific_gambier?,
          :code_pacific_guadalcanal?,
          :code_pacific_guam?,
          :code_pacific_honolulu?,
          :code_pacific_johnston?,
          :code_pacific_kanton?,
          :code_pacific_kiritimati?,
          :code_pacific_kosrae?,
          :code_pacific_kwajalein?,
          :code_pacific_majuro?,
          :code_pacific_marquesas?,
          :code_pacific_midway?,
          :code_pacific_nauru?,
          :code_pacific_niue?,
          :code_pacific_norfolk?,
          :code_pacific_noumea?,
          :code_pacific_pago_pago?,
          :code_pacific_palau?,
          :code_pacific_pitcairn?,
          :code_pacific_pohnpei?,
          :code_pacific_ponape?,
          :code_pacific_port_moresby?,
          :code_pacific_rarotonga?,
          :code_pacific_saipan?,
          :code_pacific_samoa?,
          :code_pacific_tahiti?,
          :code_pacific_tarawa?,
          :code_pacific_tongatapu?,
          :code_pacific_truk?,
          :code_pacific_wake?,
          :code_pacific_wallis?,
          :code_pacific_yap?,
          :code_poland?,
          :code_portugal?,
          :code_roc?,
          :code_rok?,
          :code_singapore?,
          :code_turkey?,
          :code_uct?,
          :code_us_alaska?,
          :code_us_aleutian?,
          :code_us_arizona?,
          :code_us_central?,
          :code_us_east_minus_indiana?,
          :code_us_eastern?,
          :code_us_hawaii?,
          :code_us_indiana_minus_starke?,
          :code_us_michigan?,
          :code_us_mountain?,
          :code_us_pacific?,
          :code_us_samoa?,
          :code_utc?,
          :code_universal?,
          :code_w_minus_su?,
          :code_wet?,
          :code_zulu?,
          :code_utc_offset,
          :code_year_day,
          :code_month_day,
          :code_nanosecond,
          :code_nanoseconds,
          :code_millisecond,
          :code_milliseconds,
          :code_utc,
          :code_local,
          :code_beginning_of_day,
          :code_end_of_day,
          :code_past?,
          :code_future?,
          :code_add,
          :code_substract,
          :code_subtract,
          :code_before?,
          :code_after?,
          :code_tomorrow,
          :code_yesterday,
          :code_now,
          :code_today,
          :code_current,
          :code_year,
          :code_years,
          :code_month,
          :code_months,
          :code_week,
          :code_weeks,
          :code_week_day,
          :code_week_days,
          :code_day,
          :code_days,
          :code_hour,
          :code_hours,
          :code_minute,
          :code_minutes,
          :code_second,
          :code_seconds,
          :code_monday?,
          :code_tuesday?,
          :code_wednesday?,
          :code_thursday?,
          :code_friday?,
          :code_saturday?,
          :code_sunday?,
          :code_january?,
          :code_february?,
          :code_march?,
          :code_april?,
          :code_may?,
          :code_june?,
          :code_july?,
          :code_august?,
          :code_september?,
          :code_october?,
          :code_november?,
          :code_december?,
          :code_change,
          to: :new
        )
      end

      def initialize(*args, **_kargs, &)
        ::Time.zone ||= DEFAULT_ZONE

        first = args.first
        self.raw =
          case first
          when String, ::String
            ::Date.parse(first.to_s)
          when Time
            first.raw.to_date
          when ::Time
            first.to_date
          when Integer, Decimal, ::Integer, ::Float, ::BigDecimal
            code_value = first.to_code
            timestamp =
              (code_value.is_a?(Decimal) ? code_value.raw.to_r : code_value.raw)
            ::Time.zone.at(timestamp).to_date
          when Date
            first.raw.dup
          when ::Date
            first.dup
          else
            ::Date.current
          end
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first
        code_second = code_arguments.code_second

        case code_operator.to_s
        when "zone="
          sig(args) { String }
          code_zone_assign(code_value)
        when "zone"
          sig(args)
          code_zone
        when "after?"
          sig(args) { (Date | Time).maybe }
          code_after?(code_value)
        when "before?"
          sig(args) { (Date | Time).maybe }
          code_before?(code_value)
        when "past?"
          sig(args)
          code_past?
        when "future?"
          sig(args)
          code_future?
        when "format"
          sig(args) { [String.maybe, { locale: String.maybe }] }

          if code_value.is_a?(Dictionary)
            code_format(nil, locale: code_value.code_get(:locale))
          elsif code_second.something?
            code_format(code_value, locale: code_second.code_get(:locale))
          else
            code_format(code_value)
          end
        when "iso8601"
          sig(args)
          code_iso8601
        when "iso"
          sig(args)
          code_iso
        when "rfc2822"
          sig(args)
          code_rfc2822
        when "rfc3339"
          sig(args)
          code_rfc3339
        when "rfc"
          sig(args)
          code_rfc
        when "to_list"
          sig(args)
          code_to_list
        when "to_integer"
          sig(args)
          code_to_integer
        when "to_decimal"
          sig(args)
          code_to_decimal
        when "africa_abidjan?"
          sig(args)
          code_africa_abidjan?
        when "africa_accra?"
          sig(args)
          code_africa_accra?
        when "africa_addis_ababa?"
          sig(args)
          code_africa_addis_ababa?
        when "africa_algiers?"
          sig(args)
          code_africa_algiers?
        when "africa_asmara?"
          sig(args)
          code_africa_asmara?
        when "africa_asmera?"
          sig(args)
          code_africa_asmera?
        when "africa_bamako?"
          sig(args)
          code_africa_bamako?
        when "africa_bangui?"
          sig(args)
          code_africa_bangui?
        when "africa_banjul?"
          sig(args)
          code_africa_banjul?
        when "africa_bissau?"
          sig(args)
          code_africa_bissau?
        when "africa_blantyre?"
          sig(args)
          code_africa_blantyre?
        when "africa_brazzaville?"
          sig(args)
          code_africa_brazzaville?
        when "africa_bujumbura?"
          sig(args)
          code_africa_bujumbura?
        when "africa_cairo?"
          sig(args)
          code_africa_cairo?
        when "africa_casablanca?"
          sig(args)
          code_africa_casablanca?
        when "africa_ceuta?"
          sig(args)
          code_africa_ceuta?
        when "africa_conakry?"
          sig(args)
          code_africa_conakry?
        when "africa_dakar?"
          sig(args)
          code_africa_dakar?
        when "africa_dar_es_salaam?"
          sig(args)
          code_africa_dar_es_salaam?
        when "africa_djibouti?"
          sig(args)
          code_africa_djibouti?
        when "africa_douala?"
          sig(args)
          code_africa_douala?
        when "africa_el_aaiun?"
          sig(args)
          code_africa_el_aaiun?
        when "africa_freetown?"
          sig(args)
          code_africa_freetown?
        when "africa_gaborone?"
          sig(args)
          code_africa_gaborone?
        when "africa_harare?"
          sig(args)
          code_africa_harare?
        when "africa_johannesburg?"
          sig(args)
          code_africa_johannesburg?
        when "africa_juba?"
          sig(args)
          code_africa_juba?
        when "africa_kampala?"
          sig(args)
          code_africa_kampala?
        when "africa_khartoum?"
          sig(args)
          code_africa_khartoum?
        when "africa_kigali?"
          sig(args)
          code_africa_kigali?
        when "africa_kinshasa?"
          sig(args)
          code_africa_kinshasa?
        when "africa_lagos?"
          sig(args)
          code_africa_lagos?
        when "africa_libreville?"
          sig(args)
          code_africa_libreville?
        when "africa_lome?"
          sig(args)
          code_africa_lome?
        when "africa_luanda?"
          sig(args)
          code_africa_luanda?
        when "africa_lubumbashi?"
          sig(args)
          code_africa_lubumbashi?
        when "africa_lusaka?"
          sig(args)
          code_africa_lusaka?
        when "africa_malabo?"
          sig(args)
          code_africa_malabo?
        when "africa_maputo?"
          sig(args)
          code_africa_maputo?
        when "africa_maseru?"
          sig(args)
          code_africa_maseru?
        when "africa_mbabane?"
          sig(args)
          code_africa_mbabane?
        when "africa_mogadishu?"
          sig(args)
          code_africa_mogadishu?
        when "africa_monrovia?"
          sig(args)
          code_africa_monrovia?
        when "africa_nairobi?"
          sig(args)
          code_africa_nairobi?
        when "africa_ndjamena?"
          sig(args)
          code_africa_ndjamena?
        when "africa_niamey?"
          sig(args)
          code_africa_niamey?
        when "africa_nouakchott?"
          sig(args)
          code_africa_nouakchott?
        when "africa_ouagadougou?"
          sig(args)
          code_africa_ouagadougou?
        when "africa_porto_minus_novo?"
          sig(args)
          code_africa_porto_minus_novo?
        when "africa_sao_tome?"
          sig(args)
          code_africa_sao_tome?
        when "africa_timbuktu?"
          sig(args)
          code_africa_timbuktu?
        when "africa_tripoli?"
          sig(args)
          code_africa_tripoli?
        when "africa_tunis?"
          sig(args)
          code_africa_tunis?
        when "africa_windhoek?"
          sig(args)
          code_africa_windhoek?
        when "america_adak?"
          sig(args)
          code_america_adak?
        when "america_anchorage?"
          sig(args)
          code_america_anchorage?
        when "america_anguilla?"
          sig(args)
          code_america_anguilla?
        when "america_antigua?"
          sig(args)
          code_america_antigua?
        when "america_araguaina?"
          sig(args)
          code_america_araguaina?
        when "america_argentina_buenos_aires?"
          sig(args)
          code_america_argentina_buenos_aires?
        when "america_argentina_catamarca?"
          sig(args)
          code_america_argentina_catamarca?
        when "america_argentina_comodrivadavia?"
          sig(args)
          code_america_argentina_comodrivadavia?
        when "america_argentina_cordoba?"
          sig(args)
          code_america_argentina_cordoba?
        when "america_argentina_jujuy?"
          sig(args)
          code_america_argentina_jujuy?
        when "america_argentina_la_rioja?"
          sig(args)
          code_america_argentina_la_rioja?
        when "america_argentina_mendoza?"
          sig(args)
          code_america_argentina_mendoza?
        when "america_argentina_rio_gallegos?"
          sig(args)
          code_america_argentina_rio_gallegos?
        when "america_argentina_salta?"
          sig(args)
          code_america_argentina_salta?
        when "america_argentina_san_juan?"
          sig(args)
          code_america_argentina_san_juan?
        when "america_argentina_san_luis?"
          sig(args)
          code_america_argentina_san_luis?
        when "america_argentina_tucuman?"
          sig(args)
          code_america_argentina_tucuman?
        when "america_argentina_ushuaia?"
          sig(args)
          code_america_argentina_ushuaia?
        when "america_aruba?"
          sig(args)
          code_america_aruba?
        when "america_asuncion?"
          sig(args)
          code_america_asuncion?
        when "america_atikokan?"
          sig(args)
          code_america_atikokan?
        when "america_atka?"
          sig(args)
          code_america_atka?
        when "america_bahia?"
          sig(args)
          code_america_bahia?
        when "america_bahia_banderas?"
          sig(args)
          code_america_bahia_banderas?
        when "america_barbados?"
          sig(args)
          code_america_barbados?
        when "america_belem?"
          sig(args)
          code_america_belem?
        when "america_belize?"
          sig(args)
          code_america_belize?
        when "america_blanc_minus_sablon?"
          sig(args)
          code_america_blanc_minus_sablon?
        when "america_boa_vista?"
          sig(args)
          code_america_boa_vista?
        when "america_bogota?"
          sig(args)
          code_america_bogota?
        when "america_boise?"
          sig(args)
          code_america_boise?
        when "america_buenos_aires?"
          sig(args)
          code_america_buenos_aires?
        when "america_cambridge_bay?"
          sig(args)
          code_america_cambridge_bay?
        when "america_campo_grande?"
          sig(args)
          code_america_campo_grande?
        when "america_cancun?"
          sig(args)
          code_america_cancun?
        when "america_caracas?"
          sig(args)
          code_america_caracas?
        when "america_catamarca?"
          sig(args)
          code_america_catamarca?
        when "america_cayenne?"
          sig(args)
          code_america_cayenne?
        when "america_cayman?"
          sig(args)
          code_america_cayman?
        when "america_chicago?"
          sig(args)
          code_america_chicago?
        when "america_chihuahua?"
          sig(args)
          code_america_chihuahua?
        when "america_ciudad_juarez?"
          sig(args)
          code_america_ciudad_juarez?
        when "america_coral_harbour?"
          sig(args)
          code_america_coral_harbour?
        when "america_cordoba?"
          sig(args)
          code_america_cordoba?
        when "america_costa_rica?"
          sig(args)
          code_america_costa_rica?
        when "america_coyhaique?"
          sig(args)
          code_america_coyhaique?
        when "america_creston?"
          sig(args)
          code_america_creston?
        when "america_cuiaba?"
          sig(args)
          code_america_cuiaba?
        when "america_curacao?"
          sig(args)
          code_america_curacao?
        when "america_danmarkshavn?"
          sig(args)
          code_america_danmarkshavn?
        when "america_dawson?"
          sig(args)
          code_america_dawson?
        when "america_dawson_creek?"
          sig(args)
          code_america_dawson_creek?
        when "america_denver?"
          sig(args)
          code_america_denver?
        when "america_detroit?"
          sig(args)
          code_america_detroit?
        when "america_dominica?"
          sig(args)
          code_america_dominica?
        when "america_edmonton?"
          sig(args)
          code_america_edmonton?
        when "america_eirunepe?"
          sig(args)
          code_america_eirunepe?
        when "america_el_salvador?"
          sig(args)
          code_america_el_salvador?
        when "america_ensenada?"
          sig(args)
          code_america_ensenada?
        when "america_fort_nelson?"
          sig(args)
          code_america_fort_nelson?
        when "america_fort_wayne?"
          sig(args)
          code_america_fort_wayne?
        when "america_fortaleza?"
          sig(args)
          code_america_fortaleza?
        when "america_glace_bay?"
          sig(args)
          code_america_glace_bay?
        when "america_godthab?"
          sig(args)
          code_america_godthab?
        when "america_goose_bay?"
          sig(args)
          code_america_goose_bay?
        when "america_grand_turk?"
          sig(args)
          code_america_grand_turk?
        when "america_grenada?"
          sig(args)
          code_america_grenada?
        when "america_guadeloupe?"
          sig(args)
          code_america_guadeloupe?
        when "america_guatemala?"
          sig(args)
          code_america_guatemala?
        when "america_guayaquil?"
          sig(args)
          code_america_guayaquil?
        when "america_guyana?"
          sig(args)
          code_america_guyana?
        when "america_halifax?"
          sig(args)
          code_america_halifax?
        when "america_havana?"
          sig(args)
          code_america_havana?
        when "america_hermosillo?"
          sig(args)
          code_america_hermosillo?
        when "america_indiana_indianapolis?"
          sig(args)
          code_america_indiana_indianapolis?
        when "america_indiana_knox?"
          sig(args)
          code_america_indiana_knox?
        when "america_indiana_marengo?"
          sig(args)
          code_america_indiana_marengo?
        when "america_indiana_petersburg?"
          sig(args)
          code_america_indiana_petersburg?
        when "america_indiana_tell_city?"
          sig(args)
          code_america_indiana_tell_city?
        when "america_indiana_vevay?"
          sig(args)
          code_america_indiana_vevay?
        when "america_indiana_vincennes?"
          sig(args)
          code_america_indiana_vincennes?
        when "america_indiana_winamac?"
          sig(args)
          code_america_indiana_winamac?
        when "america_indianapolis?"
          sig(args)
          code_america_indianapolis?
        when "america_inuvik?"
          sig(args)
          code_america_inuvik?
        when "america_iqaluit?"
          sig(args)
          code_america_iqaluit?
        when "america_jamaica?"
          sig(args)
          code_america_jamaica?
        when "america_jujuy?"
          sig(args)
          code_america_jujuy?
        when "america_juneau?"
          sig(args)
          code_america_juneau?
        when "america_kentucky_louisville?"
          sig(args)
          code_america_kentucky_louisville?
        when "america_kentucky_monticello?"
          sig(args)
          code_america_kentucky_monticello?
        when "america_knox_in?"
          sig(args)
          code_america_knox_in?
        when "america_kralendijk?"
          sig(args)
          code_america_kralendijk?
        when "america_la_paz?"
          sig(args)
          code_america_la_paz?
        when "america_lima?"
          sig(args)
          code_america_lima?
        when "america_los_angeles?"
          sig(args)
          code_america_los_angeles?
        when "america_louisville?"
          sig(args)
          code_america_louisville?
        when "america_lower_princes?"
          sig(args)
          code_america_lower_princes?
        when "america_maceio?"
          sig(args)
          code_america_maceio?
        when "america_managua?"
          sig(args)
          code_america_managua?
        when "america_manaus?"
          sig(args)
          code_america_manaus?
        when "america_marigot?"
          sig(args)
          code_america_marigot?
        when "america_martinique?"
          sig(args)
          code_america_martinique?
        when "america_matamoros?"
          sig(args)
          code_america_matamoros?
        when "america_mazatlan?"
          sig(args)
          code_america_mazatlan?
        when "america_mendoza?"
          sig(args)
          code_america_mendoza?
        when "america_menominee?"
          sig(args)
          code_america_menominee?
        when "america_merida?"
          sig(args)
          code_america_merida?
        when "america_metlakatla?"
          sig(args)
          code_america_metlakatla?
        when "america_mexico_city?"
          sig(args)
          code_america_mexico_city?
        when "america_miquelon?"
          sig(args)
          code_america_miquelon?
        when "america_moncton?"
          sig(args)
          code_america_moncton?
        when "america_monterrey?"
          sig(args)
          code_america_monterrey?
        when "america_montevideo?"
          sig(args)
          code_america_montevideo?
        when "america_montreal?"
          sig(args)
          code_america_montreal?
        when "america_montserrat?"
          sig(args)
          code_america_montserrat?
        when "america_nassau?"
          sig(args)
          code_america_nassau?
        when "america_new_york?"
          sig(args)
          code_america_new_york?
        when "america_nipigon?"
          sig(args)
          code_america_nipigon?
        when "america_nome?"
          sig(args)
          code_america_nome?
        when "america_noronha?"
          sig(args)
          code_america_noronha?
        when "america_north_dakota_beulah?"
          sig(args)
          code_america_north_dakota_beulah?
        when "america_north_dakota_center?"
          sig(args)
          code_america_north_dakota_center?
        when "america_north_dakota_new_salem?"
          sig(args)
          code_america_north_dakota_new_salem?
        when "america_nuuk?"
          sig(args)
          code_america_nuuk?
        when "america_ojinaga?"
          sig(args)
          code_america_ojinaga?
        when "america_panama?"
          sig(args)
          code_america_panama?
        when "america_pangnirtung?"
          sig(args)
          code_america_pangnirtung?
        when "america_paramaribo?"
          sig(args)
          code_america_paramaribo?
        when "america_phoenix?"
          sig(args)
          code_america_phoenix?
        when "america_port_minus_au_minus_prince?"
          sig(args)
          code_america_port_minus_au_minus_prince?
        when "america_port_of_spain?"
          sig(args)
          code_america_port_of_spain?
        when "america_porto_acre?"
          sig(args)
          code_america_porto_acre?
        when "america_porto_velho?"
          sig(args)
          code_america_porto_velho?
        when "america_puerto_rico?"
          sig(args)
          code_america_puerto_rico?
        when "america_punta_arenas?"
          sig(args)
          code_america_punta_arenas?
        when "america_rainy_river?"
          sig(args)
          code_america_rainy_river?
        when "america_rankin_inlet?"
          sig(args)
          code_america_rankin_inlet?
        when "america_recife?"
          sig(args)
          code_america_recife?
        when "america_regina?"
          sig(args)
          code_america_regina?
        when "america_resolute?"
          sig(args)
          code_america_resolute?
        when "america_rio_branco?"
          sig(args)
          code_america_rio_branco?
        when "america_rosario?"
          sig(args)
          code_america_rosario?
        when "america_santa_isabel?"
          sig(args)
          code_america_santa_isabel?
        when "america_santarem?"
          sig(args)
          code_america_santarem?
        when "america_santiago?"
          sig(args)
          code_america_santiago?
        when "america_santo_domingo?"
          sig(args)
          code_america_santo_domingo?
        when "america_sao_paulo?"
          sig(args)
          code_america_sao_paulo?
        when "america_scoresbysund?"
          sig(args)
          code_america_scoresbysund?
        when "america_shiprock?"
          sig(args)
          code_america_shiprock?
        when "america_sitka?"
          sig(args)
          code_america_sitka?
        when "america_st_barthelemy?"
          sig(args)
          code_america_st_barthelemy?
        when "america_st_johns?"
          sig(args)
          code_america_st_johns?
        when "america_st_kitts?"
          sig(args)
          code_america_st_kitts?
        when "america_st_lucia?"
          sig(args)
          code_america_st_lucia?
        when "america_st_thomas?"
          sig(args)
          code_america_st_thomas?
        when "america_st_vincent?"
          sig(args)
          code_america_st_vincent?
        when "america_swift_current?"
          sig(args)
          code_america_swift_current?
        when "america_tegucigalpa?"
          sig(args)
          code_america_tegucigalpa?
        when "america_thule?"
          sig(args)
          code_america_thule?
        when "america_thunder_bay?"
          sig(args)
          code_america_thunder_bay?
        when "america_tijuana?"
          sig(args)
          code_america_tijuana?
        when "america_toronto?"
          sig(args)
          code_america_toronto?
        when "america_tortola?"
          sig(args)
          code_america_tortola?
        when "america_vancouver?"
          sig(args)
          code_america_vancouver?
        when "america_virgin?"
          sig(args)
          code_america_virgin?
        when "america_whitehorse?"
          sig(args)
          code_america_whitehorse?
        when "america_winnipeg?"
          sig(args)
          code_america_winnipeg?
        when "america_yakutat?"
          sig(args)
          code_america_yakutat?
        when "america_yellowknife?"
          sig(args)
          code_america_yellowknife?
        when "antarctica_casey?"
          sig(args)
          code_antarctica_casey?
        when "antarctica_davis?"
          sig(args)
          code_antarctica_davis?
        when "antarctica_dumontdurville?"
          sig(args)
          code_antarctica_dumontdurville?
        when "antarctica_macquarie?"
          sig(args)
          code_antarctica_macquarie?
        when "antarctica_mawson?"
          sig(args)
          code_antarctica_mawson?
        when "antarctica_mcmurdo?"
          sig(args)
          code_antarctica_mcmurdo?
        when "antarctica_palmer?"
          sig(args)
          code_antarctica_palmer?
        when "antarctica_rothera?"
          sig(args)
          code_antarctica_rothera?
        when "antarctica_south_pole?"
          sig(args)
          code_antarctica_south_pole?
        when "antarctica_syowa?"
          sig(args)
          code_antarctica_syowa?
        when "antarctica_troll?"
          sig(args)
          code_antarctica_troll?
        when "antarctica_vostok?"
          sig(args)
          code_antarctica_vostok?
        when "arctic_longyearbyen?"
          sig(args)
          code_arctic_longyearbyen?
        when "asia_aden?"
          sig(args)
          code_asia_aden?
        when "asia_almaty?"
          sig(args)
          code_asia_almaty?
        when "asia_amman?"
          sig(args)
          code_asia_amman?
        when "asia_anadyr?"
          sig(args)
          code_asia_anadyr?
        when "asia_aqtau?"
          sig(args)
          code_asia_aqtau?
        when "asia_aqtobe?"
          sig(args)
          code_asia_aqtobe?
        when "asia_ashgabat?"
          sig(args)
          code_asia_ashgabat?
        when "asia_ashkhabad?"
          sig(args)
          code_asia_ashkhabad?
        when "asia_atyrau?"
          sig(args)
          code_asia_atyrau?
        when "asia_baghdad?"
          sig(args)
          code_asia_baghdad?
        when "asia_bahrain?"
          sig(args)
          code_asia_bahrain?
        when "asia_baku?"
          sig(args)
          code_asia_baku?
        when "asia_bangkok?"
          sig(args)
          code_asia_bangkok?
        when "asia_barnaul?"
          sig(args)
          code_asia_barnaul?
        when "asia_beirut?"
          sig(args)
          code_asia_beirut?
        when "asia_bishkek?"
          sig(args)
          code_asia_bishkek?
        when "asia_brunei?"
          sig(args)
          code_asia_brunei?
        when "asia_calcutta?"
          sig(args)
          code_asia_calcutta?
        when "asia_chita?"
          sig(args)
          code_asia_chita?
        when "asia_choibalsan?"
          sig(args)
          code_asia_choibalsan?
        when "asia_chongqing?"
          sig(args)
          code_asia_chongqing?
        when "asia_chungking?"
          sig(args)
          code_asia_chungking?
        when "asia_colombo?"
          sig(args)
          code_asia_colombo?
        when "asia_dacca?"
          sig(args)
          code_asia_dacca?
        when "asia_damascus?"
          sig(args)
          code_asia_damascus?
        when "asia_dhaka?"
          sig(args)
          code_asia_dhaka?
        when "asia_dili?"
          sig(args)
          code_asia_dili?
        when "asia_dubai?"
          sig(args)
          code_asia_dubai?
        when "asia_dushanbe?"
          sig(args)
          code_asia_dushanbe?
        when "asia_famagusta?"
          sig(args)
          code_asia_famagusta?
        when "asia_gaza?"
          sig(args)
          code_asia_gaza?
        when "asia_harbin?"
          sig(args)
          code_asia_harbin?
        when "asia_hebron?"
          sig(args)
          code_asia_hebron?
        when "asia_ho_chi_minh?"
          sig(args)
          code_asia_ho_chi_minh?
        when "asia_hong_kong?"
          sig(args)
          code_asia_hong_kong?
        when "asia_hovd?"
          sig(args)
          code_asia_hovd?
        when "asia_irkutsk?"
          sig(args)
          code_asia_irkutsk?
        when "asia_istanbul?"
          sig(args)
          code_asia_istanbul?
        when "asia_jakarta?"
          sig(args)
          code_asia_jakarta?
        when "asia_jayapura?"
          sig(args)
          code_asia_jayapura?
        when "asia_jerusalem?"
          sig(args)
          code_asia_jerusalem?
        when "asia_kabul?"
          sig(args)
          code_asia_kabul?
        when "asia_kamchatka?"
          sig(args)
          code_asia_kamchatka?
        when "asia_karachi?"
          sig(args)
          code_asia_karachi?
        when "asia_kashgar?"
          sig(args)
          code_asia_kashgar?
        when "asia_kathmandu?"
          sig(args)
          code_asia_kathmandu?
        when "asia_katmandu?"
          sig(args)
          code_asia_katmandu?
        when "asia_khandyga?"
          sig(args)
          code_asia_khandyga?
        when "asia_kolkata?"
          sig(args)
          code_asia_kolkata?
        when "asia_krasnoyarsk?"
          sig(args)
          code_asia_krasnoyarsk?
        when "asia_kuala_lumpur?"
          sig(args)
          code_asia_kuala_lumpur?
        when "asia_kuching?"
          sig(args)
          code_asia_kuching?
        when "asia_kuwait?"
          sig(args)
          code_asia_kuwait?
        when "asia_macao?"
          sig(args)
          code_asia_macao?
        when "asia_macau?"
          sig(args)
          code_asia_macau?
        when "asia_magadan?"
          sig(args)
          code_asia_magadan?
        when "asia_makassar?"
          sig(args)
          code_asia_makassar?
        when "asia_manila?"
          sig(args)
          code_asia_manila?
        when "asia_muscat?"
          sig(args)
          code_asia_muscat?
        when "asia_nicosia?"
          sig(args)
          code_asia_nicosia?
        when "asia_novokuznetsk?"
          sig(args)
          code_asia_novokuznetsk?
        when "asia_novosibirsk?"
          sig(args)
          code_asia_novosibirsk?
        when "asia_omsk?"
          sig(args)
          code_asia_omsk?
        when "asia_oral?"
          sig(args)
          code_asia_oral?
        when "asia_phnom_penh?"
          sig(args)
          code_asia_phnom_penh?
        when "asia_pontianak?"
          sig(args)
          code_asia_pontianak?
        when "asia_pyongyang?"
          sig(args)
          code_asia_pyongyang?
        when "asia_qatar?"
          sig(args)
          code_asia_qatar?
        when "asia_qostanay?"
          sig(args)
          code_asia_qostanay?
        when "asia_qyzylorda?"
          sig(args)
          code_asia_qyzylorda?
        when "asia_rangoon?"
          sig(args)
          code_asia_rangoon?
        when "asia_riyadh?"
          sig(args)
          code_asia_riyadh?
        when "asia_saigon?"
          sig(args)
          code_asia_saigon?
        when "asia_sakhalin?"
          sig(args)
          code_asia_sakhalin?
        when "asia_samarkand?"
          sig(args)
          code_asia_samarkand?
        when "asia_seoul?"
          sig(args)
          code_asia_seoul?
        when "asia_shanghai?"
          sig(args)
          code_asia_shanghai?
        when "asia_singapore?"
          sig(args)
          code_asia_singapore?
        when "asia_srednekolymsk?"
          sig(args)
          code_asia_srednekolymsk?
        when "asia_taipei?"
          sig(args)
          code_asia_taipei?
        when "asia_tashkent?"
          sig(args)
          code_asia_tashkent?
        when "asia_tbilisi?"
          sig(args)
          code_asia_tbilisi?
        when "asia_tehran?"
          sig(args)
          code_asia_tehran?
        when "asia_tel_aviv?"
          sig(args)
          code_asia_tel_aviv?
        when "asia_thimbu?"
          sig(args)
          code_asia_thimbu?
        when "asia_thimphu?"
          sig(args)
          code_asia_thimphu?
        when "asia_tokyo?"
          sig(args)
          code_asia_tokyo?
        when "asia_tomsk?"
          sig(args)
          code_asia_tomsk?
        when "asia_ujung_pandang?"
          sig(args)
          code_asia_ujung_pandang?
        when "asia_ulaanbaatar?"
          sig(args)
          code_asia_ulaanbaatar?
        when "asia_ulan_bator?"
          sig(args)
          code_asia_ulan_bator?
        when "asia_urumqi?"
          sig(args)
          code_asia_urumqi?
        when "asia_ust_minus_nera?"
          sig(args)
          code_asia_ust_minus_nera?
        when "asia_vientiane?"
          sig(args)
          code_asia_vientiane?
        when "asia_vladivostok?"
          sig(args)
          code_asia_vladivostok?
        when "asia_yakutsk?"
          sig(args)
          code_asia_yakutsk?
        when "asia_yangon?"
          sig(args)
          code_asia_yangon?
        when "asia_yekaterinburg?"
          sig(args)
          code_asia_yekaterinburg?
        when "asia_yerevan?"
          sig(args)
          code_asia_yerevan?
        when "atlantic_azores?"
          sig(args)
          code_atlantic_azores?
        when "atlantic_bermuda?"
          sig(args)
          code_atlantic_bermuda?
        when "atlantic_canary?"
          sig(args)
          code_atlantic_canary?
        when "atlantic_cape_verde?"
          sig(args)
          code_atlantic_cape_verde?
        when "atlantic_faeroe?"
          sig(args)
          code_atlantic_faeroe?
        when "atlantic_faroe?"
          sig(args)
          code_atlantic_faroe?
        when "atlantic_jan_mayen?"
          sig(args)
          code_atlantic_jan_mayen?
        when "atlantic_madeira?"
          sig(args)
          code_atlantic_madeira?
        when "atlantic_reykjavik?"
          sig(args)
          code_atlantic_reykjavik?
        when "atlantic_south_georgia?"
          sig(args)
          code_atlantic_south_georgia?
        when "atlantic_st_helena?"
          sig(args)
          code_atlantic_st_helena?
        when "atlantic_stanley?"
          sig(args)
          code_atlantic_stanley?
        when "australia_act?"
          sig(args)
          code_australia_act?
        when "australia_adelaide?"
          sig(args)
          code_australia_adelaide?
        when "australia_brisbane?"
          sig(args)
          code_australia_brisbane?
        when "australia_broken_hill?"
          sig(args)
          code_australia_broken_hill?
        when "australia_canberra?"
          sig(args)
          code_australia_canberra?
        when "australia_currie?"
          sig(args)
          code_australia_currie?
        when "australia_darwin?"
          sig(args)
          code_australia_darwin?
        when "australia_eucla?"
          sig(args)
          code_australia_eucla?
        when "australia_hobart?"
          sig(args)
          code_australia_hobart?
        when "australia_lhi?"
          sig(args)
          code_australia_lhi?
        when "australia_lindeman?"
          sig(args)
          code_australia_lindeman?
        when "australia_lord_howe?"
          sig(args)
          code_australia_lord_howe?
        when "australia_melbourne?"
          sig(args)
          code_australia_melbourne?
        when "australia_nsw?"
          sig(args)
          code_australia_nsw?
        when "australia_north?"
          sig(args)
          code_australia_north?
        when "australia_perth?"
          sig(args)
          code_australia_perth?
        when "australia_queensland?"
          sig(args)
          code_australia_queensland?
        when "australia_south?"
          sig(args)
          code_australia_south?
        when "australia_sydney?"
          sig(args)
          code_australia_sydney?
        when "australia_tasmania?"
          sig(args)
          code_australia_tasmania?
        when "australia_victoria?"
          sig(args)
          code_australia_victoria?
        when "australia_west?"
          sig(args)
          code_australia_west?
        when "australia_yancowinna?"
          sig(args)
          code_australia_yancowinna?
        when "brazil_acre?"
          sig(args)
          code_brazil_acre?
        when "brazil_denoronha?"
          sig(args)
          code_brazil_denoronha?
        when "brazil_east?"
          sig(args)
          code_brazil_east?
        when "brazil_west?"
          sig(args)
          code_brazil_west?
        when "cet?"
          sig(args)
          code_cet?
        when "cst6cdt?"
          sig(args)
          code_cst6cdt?
        when "canada_atlantic?"
          sig(args)
          code_canada_atlantic?
        when "canada_central?"
          sig(args)
          code_canada_central?
        when "canada_eastern?"
          sig(args)
          code_canada_eastern?
        when "canada_mountain?"
          sig(args)
          code_canada_mountain?
        when "canada_newfoundland?"
          sig(args)
          code_canada_newfoundland?
        when "canada_pacific?"
          sig(args)
          code_canada_pacific?
        when "canada_saskatchewan?"
          sig(args)
          code_canada_saskatchewan?
        when "canada_yukon?"
          sig(args)
          code_canada_yukon?
        when "chile_continental?"
          sig(args)
          code_chile_continental?
        when "chile_easterisland?"
          sig(args)
          code_chile_easterisland?
        when "cuba?"
          sig(args)
          code_cuba?
        when "eet?"
          sig(args)
          code_eet?
        when "est?"
          sig(args)
          code_est?
        when "est5edt?"
          sig(args)
          code_est5edt?
        when "egypt?"
          sig(args)
          code_egypt?
        when "eire?"
          sig(args)
          code_eire?
        when "etc_gmt?"
          sig(args)
          code_etc_gmt?
        when "etc_gmt_plus_0?"
          sig(args)
          code_etc_gmt_plus_0?
        when "etc_gmt_plus_1?"
          sig(args)
          code_etc_gmt_plus_1?
        when "etc_gmt_plus_10?"
          sig(args)
          code_etc_gmt_plus_10?
        when "etc_gmt_plus_11?"
          sig(args)
          code_etc_gmt_plus_11?
        when "etc_gmt_plus_12?"
          sig(args)
          code_etc_gmt_plus_12?
        when "etc_gmt_plus_2?"
          sig(args)
          code_etc_gmt_plus_2?
        when "etc_gmt_plus_3?"
          sig(args)
          code_etc_gmt_plus_3?
        when "etc_gmt_plus_4?"
          sig(args)
          code_etc_gmt_plus_4?
        when "etc_gmt_plus_5?"
          sig(args)
          code_etc_gmt_plus_5?
        when "etc_gmt_plus_6?"
          sig(args)
          code_etc_gmt_plus_6?
        when "etc_gmt_plus_7?"
          sig(args)
          code_etc_gmt_plus_7?
        when "etc_gmt_plus_8?"
          sig(args)
          code_etc_gmt_plus_8?
        when "etc_gmt_plus_9?"
          sig(args)
          code_etc_gmt_plus_9?
        when "etc_gmt_minus_0?"
          sig(args)
          code_etc_gmt_minus_0?
        when "etc_gmt_minus_1?"
          sig(args)
          code_etc_gmt_minus_1?
        when "etc_gmt_minus_10?"
          sig(args)
          code_etc_gmt_minus_10?
        when "etc_gmt_minus_11?"
          sig(args)
          code_etc_gmt_minus_11?
        when "etc_gmt_minus_12?"
          sig(args)
          code_etc_gmt_minus_12?
        when "etc_gmt_minus_13?"
          sig(args)
          code_etc_gmt_minus_13?
        when "etc_gmt_minus_14?"
          sig(args)
          code_etc_gmt_minus_14?
        when "etc_gmt_minus_2?"
          sig(args)
          code_etc_gmt_minus_2?
        when "etc_gmt_minus_3?"
          sig(args)
          code_etc_gmt_minus_3?
        when "etc_gmt_minus_4?"
          sig(args)
          code_etc_gmt_minus_4?
        when "etc_gmt_minus_5?"
          sig(args)
          code_etc_gmt_minus_5?
        when "etc_gmt_minus_6?"
          sig(args)
          code_etc_gmt_minus_6?
        when "etc_gmt_minus_7?"
          sig(args)
          code_etc_gmt_minus_7?
        when "etc_gmt_minus_8?"
          sig(args)
          code_etc_gmt_minus_8?
        when "etc_gmt_minus_9?"
          sig(args)
          code_etc_gmt_minus_9?
        when "etc_gmt0?"
          sig(args)
          code_etc_gmt0?
        when "etc_greenwich?"
          sig(args)
          code_etc_greenwich?
        when "etc_uct?"
          sig(args)
          code_etc_uct?
        when "etc_utc?"
          sig(args)
          code_etc_utc?
        when "etc_universal?"
          sig(args)
          code_etc_universal?
        when "etc_zulu?"
          sig(args)
          code_etc_zulu?
        when "europe_amsterdam?"
          sig(args)
          code_europe_amsterdam?
        when "europe_andorra?"
          sig(args)
          code_europe_andorra?
        when "europe_astrakhan?"
          sig(args)
          code_europe_astrakhan?
        when "europe_athens?"
          sig(args)
          code_europe_athens?
        when "europe_belfast?"
          sig(args)
          code_europe_belfast?
        when "europe_belgrade?"
          sig(args)
          code_europe_belgrade?
        when "europe_berlin?"
          sig(args)
          code_europe_berlin?
        when "europe_bratislava?"
          sig(args)
          code_europe_bratislava?
        when "europe_brussels?"
          sig(args)
          code_europe_brussels?
        when "europe_bucharest?"
          sig(args)
          code_europe_bucharest?
        when "europe_budapest?"
          sig(args)
          code_europe_budapest?
        when "europe_busingen?"
          sig(args)
          code_europe_busingen?
        when "europe_chisinau?"
          sig(args)
          code_europe_chisinau?
        when "europe_copenhagen?"
          sig(args)
          code_europe_copenhagen?
        when "europe_dublin?"
          sig(args)
          code_europe_dublin?
        when "europe_gibraltar?"
          sig(args)
          code_europe_gibraltar?
        when "europe_guernsey?"
          sig(args)
          code_europe_guernsey?
        when "europe_helsinki?"
          sig(args)
          code_europe_helsinki?
        when "europe_isle_of_man?"
          sig(args)
          code_europe_isle_of_man?
        when "europe_istanbul?"
          sig(args)
          code_europe_istanbul?
        when "europe_jersey?"
          sig(args)
          code_europe_jersey?
        when "europe_kaliningrad?"
          sig(args)
          code_europe_kaliningrad?
        when "europe_kiev?"
          sig(args)
          code_europe_kiev?
        when "europe_kirov?"
          sig(args)
          code_europe_kirov?
        when "europe_kyiv?"
          sig(args)
          code_europe_kyiv?
        when "europe_lisbon?"
          sig(args)
          code_europe_lisbon?
        when "europe_ljubljana?"
          sig(args)
          code_europe_ljubljana?
        when "europe_london?"
          sig(args)
          code_europe_london?
        when "europe_luxembourg?"
          sig(args)
          code_europe_luxembourg?
        when "europe_madrid?"
          sig(args)
          code_europe_madrid?
        when "europe_malta?"
          sig(args)
          code_europe_malta?
        when "europe_mariehamn?"
          sig(args)
          code_europe_mariehamn?
        when "europe_minsk?"
          sig(args)
          code_europe_minsk?
        when "europe_monaco?"
          sig(args)
          code_europe_monaco?
        when "europe_moscow?"
          sig(args)
          code_europe_moscow?
        when "europe_nicosia?"
          sig(args)
          code_europe_nicosia?
        when "europe_oslo?"
          sig(args)
          code_europe_oslo?
        when "europe_paris?"
          sig(args)
          code_europe_paris?
        when "europe_podgorica?"
          sig(args)
          code_europe_podgorica?
        when "europe_prague?"
          sig(args)
          code_europe_prague?
        when "europe_riga?"
          sig(args)
          code_europe_riga?
        when "europe_rome?"
          sig(args)
          code_europe_rome?
        when "europe_samara?"
          sig(args)
          code_europe_samara?
        when "europe_san_marino?"
          sig(args)
          code_europe_san_marino?
        when "europe_sarajevo?"
          sig(args)
          code_europe_sarajevo?
        when "europe_saratov?"
          sig(args)
          code_europe_saratov?
        when "europe_simferopol?"
          sig(args)
          code_europe_simferopol?
        when "europe_skopje?"
          sig(args)
          code_europe_skopje?
        when "europe_sofia?"
          sig(args)
          code_europe_sofia?
        when "europe_stockholm?"
          sig(args)
          code_europe_stockholm?
        when "europe_tallinn?"
          sig(args)
          code_europe_tallinn?
        when "europe_tirane?"
          sig(args)
          code_europe_tirane?
        when "europe_tiraspol?"
          sig(args)
          code_europe_tiraspol?
        when "europe_ulyanovsk?"
          sig(args)
          code_europe_ulyanovsk?
        when "europe_uzhgorod?"
          sig(args)
          code_europe_uzhgorod?
        when "europe_vaduz?"
          sig(args)
          code_europe_vaduz?
        when "europe_vatican?"
          sig(args)
          code_europe_vatican?
        when "europe_vienna?"
          sig(args)
          code_europe_vienna?
        when "europe_vilnius?"
          sig(args)
          code_europe_vilnius?
        when "europe_volgograd?"
          sig(args)
          code_europe_volgograd?
        when "europe_warsaw?"
          sig(args)
          code_europe_warsaw?
        when "europe_zagreb?"
          sig(args)
          code_europe_zagreb?
        when "europe_zaporozhye?"
          sig(args)
          code_europe_zaporozhye?
        when "europe_zurich?"
          sig(args)
          code_europe_zurich?
        when "factory?"
          sig(args)
          code_factory?
        when "gb?"
          sig(args)
          code_gb?
        when "gb_minus_eire?"
          sig(args)
          code_gb_minus_eire?
        when "gmt?"
          sig(args)
          code_gmt?
        when "gmt_plus_0?"
          sig(args)
          code_gmt_plus_0?
        when "gmt_minus_0?"
          sig(args)
          code_gmt_minus_0?
        when "gmt0?"
          sig(args)
          code_gmt0?
        when "greenwich?"
          sig(args)
          code_greenwich?
        when "hst?"
          sig(args)
          code_hst?
        when "hongkong?"
          sig(args)
          code_hongkong?
        when "iceland?"
          sig(args)
          code_iceland?
        when "indian_antananarivo?"
          sig(args)
          code_indian_antananarivo?
        when "indian_chagos?"
          sig(args)
          code_indian_chagos?
        when "indian_christmas?"
          sig(args)
          code_indian_christmas?
        when "indian_cocos?"
          sig(args)
          code_indian_cocos?
        when "indian_comoro?"
          sig(args)
          code_indian_comoro?
        when "indian_kerguelen?"
          sig(args)
          code_indian_kerguelen?
        when "indian_mahe?"
          sig(args)
          code_indian_mahe?
        when "indian_maldives?"
          sig(args)
          code_indian_maldives?
        when "indian_mauritius?"
          sig(args)
          code_indian_mauritius?
        when "indian_mayotte?"
          sig(args)
          code_indian_mayotte?
        when "indian_reunion?"
          sig(args)
          code_indian_reunion?
        when "iran?"
          sig(args)
          code_iran?
        when "israel?"
          sig(args)
          code_israel?
        when "jamaica?"
          sig(args)
          code_jamaica?
        when "japan?"
          sig(args)
          code_japan?
        when "kwajalein?"
          sig(args)
          code_kwajalein?
        when "libya?"
          sig(args)
          code_libya?
        when "met?"
          sig(args)
          code_met?
        when "mst?"
          sig(args)
          code_mst?
        when "mst7mdt?"
          sig(args)
          code_mst7mdt?
        when "mexico_bajanorte?"
          sig(args)
          code_mexico_bajanorte?
        when "mexico_bajasur?"
          sig(args)
          code_mexico_bajasur?
        when "mexico_general?"
          sig(args)
          code_mexico_general?
        when "nz?"
          sig(args)
          code_nz?
        when "nz_minus_chat?"
          sig(args)
          code_nz_minus_chat?
        when "navajo?"
          sig(args)
          code_navajo?
        when "prc?"
          sig(args)
          code_prc?
        when "pst8pdt?"
          sig(args)
          code_pst8pdt?
        when "pacific_apia?"
          sig(args)
          code_pacific_apia?
        when "pacific_auckland?"
          sig(args)
          code_pacific_auckland?
        when "pacific_bougainville?"
          sig(args)
          code_pacific_bougainville?
        when "pacific_chatham?"
          sig(args)
          code_pacific_chatham?
        when "pacific_chuuk?"
          sig(args)
          code_pacific_chuuk?
        when "pacific_easter?"
          sig(args)
          code_pacific_easter?
        when "pacific_efate?"
          sig(args)
          code_pacific_efate?
        when "pacific_enderbury?"
          sig(args)
          code_pacific_enderbury?
        when "pacific_fakaofo?"
          sig(args)
          code_pacific_fakaofo?
        when "pacific_fiji?"
          sig(args)
          code_pacific_fiji?
        when "pacific_funafuti?"
          sig(args)
          code_pacific_funafuti?
        when "pacific_galapagos?"
          sig(args)
          code_pacific_galapagos?
        when "pacific_gambier?"
          sig(args)
          code_pacific_gambier?
        when "pacific_guadalcanal?"
          sig(args)
          code_pacific_guadalcanal?
        when "pacific_guam?"
          sig(args)
          code_pacific_guam?
        when "pacific_honolulu?"
          sig(args)
          code_pacific_honolulu?
        when "pacific_johnston?"
          sig(args)
          code_pacific_johnston?
        when "pacific_kanton?"
          sig(args)
          code_pacific_kanton?
        when "pacific_kiritimati?"
          sig(args)
          code_pacific_kiritimati?
        when "pacific_kosrae?"
          sig(args)
          code_pacific_kosrae?
        when "pacific_kwajalein?"
          sig(args)
          code_pacific_kwajalein?
        when "pacific_majuro?"
          sig(args)
          code_pacific_majuro?
        when "pacific_marquesas?"
          sig(args)
          code_pacific_marquesas?
        when "pacific_midway?"
          sig(args)
          code_pacific_midway?
        when "pacific_nauru?"
          sig(args)
          code_pacific_nauru?
        when "pacific_niue?"
          sig(args)
          code_pacific_niue?
        when "pacific_norfolk?"
          sig(args)
          code_pacific_norfolk?
        when "pacific_noumea?"
          sig(args)
          code_pacific_noumea?
        when "pacific_pago_pago?"
          sig(args)
          code_pacific_pago_pago?
        when "pacific_palau?"
          sig(args)
          code_pacific_palau?
        when "pacific_pitcairn?"
          sig(args)
          code_pacific_pitcairn?
        when "pacific_pohnpei?"
          sig(args)
          code_pacific_pohnpei?
        when "pacific_ponape?"
          sig(args)
          code_pacific_ponape?
        when "pacific_port_moresby?"
          sig(args)
          code_pacific_port_moresby?
        when "pacific_rarotonga?"
          sig(args)
          code_pacific_rarotonga?
        when "pacific_saipan?"
          sig(args)
          code_pacific_saipan?
        when "pacific_samoa?"
          sig(args)
          code_pacific_samoa?
        when "pacific_tahiti?"
          sig(args)
          code_pacific_tahiti?
        when "pacific_tarawa?"
          sig(args)
          code_pacific_tarawa?
        when "pacific_tongatapu?"
          sig(args)
          code_pacific_tongatapu?
        when "pacific_truk?"
          sig(args)
          code_pacific_truk?
        when "pacific_wake?"
          sig(args)
          code_pacific_wake?
        when "pacific_wallis?"
          sig(args)
          code_pacific_wallis?
        when "pacific_yap?"
          sig(args)
          code_pacific_yap?
        when "poland?"
          sig(args)
          code_poland?
        when "portugal?"
          sig(args)
          code_portugal?
        when "roc?"
          sig(args)
          code_roc?
        when "rok?"
          sig(args)
          code_rok?
        when "singapore?"
          sig(args)
          code_singapore?
        when "turkey?"
          sig(args)
          code_turkey?
        when "uct?"
          sig(args)
          code_uct?
        when "us_alaska?"
          sig(args)
          code_us_alaska?
        when "us_aleutian?"
          sig(args)
          code_us_aleutian?
        when "us_arizona?"
          sig(args)
          code_us_arizona?
        when "us_central?"
          sig(args)
          code_us_central?
        when "us_east_minus_indiana?"
          sig(args)
          code_us_east_minus_indiana?
        when "us_eastern?"
          sig(args)
          code_us_eastern?
        when "us_hawaii?"
          sig(args)
          code_us_hawaii?
        when "us_indiana_minus_starke?"
          sig(args)
          code_us_indiana_minus_starke?
        when "us_michigan?"
          sig(args)
          code_us_michigan?
        when "us_mountain?"
          sig(args)
          code_us_mountain?
        when "us_pacific?"
          sig(args)
          code_us_pacific?
        when "us_samoa?"
          sig(args)
          code_us_samoa?
        when "utc?"
          sig(args)
          code_utc?
        when "universal?"
          sig(args)
          code_universal?
        when "w_minus_su?"
          sig(args)
          code_w_minus_su?
        when "wet?"
          sig(args)
          code_wet?
        when "zulu?"
          sig(args)
          code_zulu?
        when "utc_offset"
          sig(args)
          code_utc_offset
        when "year_day"
          sig(args)
          code_year_day
        when "month_day"
          sig(args)
          code_month_day
        when "nanosecond"
          sig(args)
          code_nanosecond
        when "nanoseconds"
          sig(args)
          code_nanoseconds
        when "millisecond"
          sig(args)
          code_millisecond
        when "milliseconds"
          sig(args)
          code_milliseconds
        when "utc"
          sig(args)
          code_utc
        when "local"
          sig(args)
          code_local
        when "beginning_of_day"
          sig(args)
          code_beginning_of_day
        when "end_of_day"
          sig(args)
          code_end_of_day
        when "tomorrow"
          sig(args)
          code_tomorrow
        when "yesterday"
          sig(args)
          code_yesterday
        when "today"
          sig(args)
          code_today
        when "current"
          sig(args)
          code_current
        when "now"
          sig(args)
          code_now
        when "year"
          sig(args)
          code_year
        when "years"
          sig(args)
          code_years
        when "month"
          sig(args)
          code_month
        when "months"
          sig(args)
          code_months
        when "week"
          sig(args)
          code_week
        when "weeks"
          sig(args)
          code_weeks
        when "week_day"
          sig(args)
          code_week_day
        when "week_days"
          sig(args)
          code_week_days
        when "day"
          sig(args)
          code_day
        when "days"
          sig(args)
          code_days
        when "hour"
          sig(args)
          code_hour
        when "hours"
          sig(args)
          code_hours
        when "minute"
          sig(args)
          code_minute
        when "minutes"
          sig(args)
          code_minutes
        when "second"
          sig(args)
          code_second
        when "seconds"
          sig(args)
          code_seconds
        when "monday?"
          sig(args)
          code_monday?
        when "tuesday?"
          sig(args)
          code_tuesday?
        when "wednesday?"
          sig(args)
          code_wednesday?
        when "thursday?"
          sig(args)
          code_thursday?
        when "friday?"
          sig(args)
          code_friday?
        when "saturday?"
          sig(args)
          code_saturday?
        when "sunday?"
          sig(args)
          code_sunday?
        when "january?"
          sig(args)
          code_january?
        when "february?"
          sig(args)
          code_february?
        when "march?"
          sig(args)
          code_march?
        when "april?"
          sig(args)
          code_april?
        when "may?"
          sig(args)
          code_may?
        when "june?"
          sig(args)
          code_june?
        when "july?"
          sig(args)
          code_july?
        when "august?"
          sig(args)
          code_august?
        when "september?"
          sig(args)
          code_september?
        when "october?"
          sig(args)
          code_october?
        when "november?"
          sig(args)
          code_november?
        when "december?"
          sig(args)
          code_december?
        when "add"
          sig(args) do
            {
              year: (String | Integer).maybe,
              years: (String | Integer).maybe,
              month: (String | Integer).maybe,
              months: (String | Integer).maybe,
              day: (String | Integer).maybe,
              days: (String | Integer).maybe,
              week_day: (String | Integer).maybe,
              week_days: (String | Integer).maybe,
              week: (String | Integer).maybe,
              weeks: (String | Integer).maybe
            }
          end

          if code_value.nothing?
            code_add
          else
            code_add(
              year: code_value.code_get(:year),
              years: code_value.code_get(:years),
              month: code_value.code_get(:month),
              months: code_value.code_get(:months),
              day: code_value.code_get(:day),
              days: code_value.code_get(:days),
              week_day: code_value.code_get(:week_day),
              week_days: code_value.code_get(:week_days),
              week: code_value.code_get(:week),
              weeks: code_value.code_get(:weeks)
            )
          end
        when "substract", "subtract"
          sig(args) do
            {
              year: (String | Integer).maybe,
              years: (String | Integer).maybe,
              month: (String | Integer).maybe,
              months: (String | Integer).maybe,
              day: (String | Integer).maybe,
              days: (String | Integer).maybe,
              week_day: (String | Integer).maybe,
              week_days: (String | Integer).maybe,
              week: (String | Integer).maybe,
              weeks: (String | Integer).maybe
            }
          end

          if code_value.nothing?
            code_substract
          else
            code_substract(
              year: code_value.code_get(:year),
              years: code_value.code_get(:years),
              month: code_value.code_get(:month),
              months: code_value.code_get(:months),
              day: code_value.code_get(:day),
              days: code_value.code_get(:days),
              week_day: code_value.code_get(:week_day),
              week_days: code_value.code_get(:week_days),
              week: code_value.code_get(:week),
              weeks: code_value.code_get(:weeks)
            )
          end
        when "change"
          sig(args) do
            {
              year: (String | Integer).maybe,
              years: (String | Integer).maybe,
              month: (String | Integer).maybe,
              months: (String | Integer).maybe,
              day: (String | Integer).maybe,
              days: (String | Integer).maybe,
              week_day: (String | Integer).maybe,
              week_days: (String | Integer).maybe,
              week: (String | Integer).maybe,
              weeks: (String | Integer).maybe
            }
          end

          if code_value.nothing?
            code_change
          else
            code_change(
              year: code_value.code_get(:year),
              years: code_value.code_get(:years),
              month: code_value.code_get(:month),
              months: code_value.code_get(:months),
              day: code_value.code_get(:day),
              days: code_value.code_get(:days),
              week_day: code_value.code_get(:week_day),
              week_days: code_value.code_get(:week_days),
              week: code_value.code_get(:week),
              weeks: code_value.code_get(:weeks)
            )
          end
        else
          super
        end
      end

      def call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first
        code_second = code_arguments.code_second

        case code_operator.to_s
        when "zone"
          sig(args)
          code_zone
        when "after?"
          sig(args) { (Date | Time).maybe }
          code_after?(code_value)
        when "before?"
          sig(args) { (Date | Time).maybe }
          code_before?(code_value)
        when "past?"
          sig(args)
          code_past?
        when "future?"
          sig(args)
          code_future?
        when "year"
          sig(args)
          code_year
        when "years"
          sig(args)
          code_years
        when "month"
          sig(args)
          code_month
        when "months"
          sig(args)
          code_months
        when "week"
          sig(args)
          code_week
        when "weeks"
          sig(args)
          code_weeks
        when "week_day"
          sig(args)
          code_week_day
        when "week_days"
          sig(args)
          code_week_days
        when "day"
          sig(args)
          code_day
        when "days"
          sig(args)
          code_days
        when "hour"
          sig(args)
          code_hour
        when "hours"
          sig(args)
          code_hours
        when "minute"
          sig(args)
          code_minute
        when "minutes"
          sig(args)
          code_minutes
        when "second"
          sig(args)
          code_second
        when "seconds"
          sig(args)
          code_seconds
        when "monday?"
          sig(args)
          code_monday?
        when "tuesday?"
          sig(args)
          code_tuesday?
        when "wednesday?"
          sig(args)
          code_wednesday?
        when "thursday?"
          sig(args)
          code_thursday?
        when "friday?"
          sig(args)
          code_friday?
        when "saturday?"
          sig(args)
          code_saturday?
        when "sunday?"
          sig(args)
          code_sunday?
        when "format"
          sig(args) { [String.maybe, { locale: String.maybe }] }

          if code_value.is_a?(Dictionary)
            code_format(nil, locale: code_value.code_get(:locale))
          elsif code_second.something?
            code_format(code_value, locale: code_second.code_get(:locale))
          else
            code_format(code_value)
          end
        when "iso8601"
          sig(args)
          code_iso8601
        when "iso"
          sig(args)
          code_iso
        when "rfc2822"
          sig(args)
          code_rfc2822
        when "rfc3339"
          sig(args)
          code_rfc3339
        when "rfc"
          sig(args)
          code_rfc
        when "to_list"
          sig(args)
          code_to_list
        when "to_integer"
          sig(args)
          code_to_integer
        when "to_decimal"
          sig(args)
          code_to_decimal
        when "africa_abidjan?"
          sig(args)
          code_africa_abidjan?
        when "africa_accra?"
          sig(args)
          code_africa_accra?
        when "africa_addis_ababa?"
          sig(args)
          code_africa_addis_ababa?
        when "africa_algiers?"
          sig(args)
          code_africa_algiers?
        when "africa_asmara?"
          sig(args)
          code_africa_asmara?
        when "africa_asmera?"
          sig(args)
          code_africa_asmera?
        when "africa_bamako?"
          sig(args)
          code_africa_bamako?
        when "africa_bangui?"
          sig(args)
          code_africa_bangui?
        when "africa_banjul?"
          sig(args)
          code_africa_banjul?
        when "africa_bissau?"
          sig(args)
          code_africa_bissau?
        when "africa_blantyre?"
          sig(args)
          code_africa_blantyre?
        when "africa_brazzaville?"
          sig(args)
          code_africa_brazzaville?
        when "africa_bujumbura?"
          sig(args)
          code_africa_bujumbura?
        when "africa_cairo?"
          sig(args)
          code_africa_cairo?
        when "africa_casablanca?"
          sig(args)
          code_africa_casablanca?
        when "africa_ceuta?"
          sig(args)
          code_africa_ceuta?
        when "africa_conakry?"
          sig(args)
          code_africa_conakry?
        when "africa_dakar?"
          sig(args)
          code_africa_dakar?
        when "africa_dar_es_salaam?"
          sig(args)
          code_africa_dar_es_salaam?
        when "africa_djibouti?"
          sig(args)
          code_africa_djibouti?
        when "africa_douala?"
          sig(args)
          code_africa_douala?
        when "africa_el_aaiun?"
          sig(args)
          code_africa_el_aaiun?
        when "africa_freetown?"
          sig(args)
          code_africa_freetown?
        when "africa_gaborone?"
          sig(args)
          code_africa_gaborone?
        when "africa_harare?"
          sig(args)
          code_africa_harare?
        when "africa_johannesburg?"
          sig(args)
          code_africa_johannesburg?
        when "africa_juba?"
          sig(args)
          code_africa_juba?
        when "africa_kampala?"
          sig(args)
          code_africa_kampala?
        when "africa_khartoum?"
          sig(args)
          code_africa_khartoum?
        when "africa_kigali?"
          sig(args)
          code_africa_kigali?
        when "africa_kinshasa?"
          sig(args)
          code_africa_kinshasa?
        when "africa_lagos?"
          sig(args)
          code_africa_lagos?
        when "africa_libreville?"
          sig(args)
          code_africa_libreville?
        when "africa_lome?"
          sig(args)
          code_africa_lome?
        when "africa_luanda?"
          sig(args)
          code_africa_luanda?
        when "africa_lubumbashi?"
          sig(args)
          code_africa_lubumbashi?
        when "africa_lusaka?"
          sig(args)
          code_africa_lusaka?
        when "africa_malabo?"
          sig(args)
          code_africa_malabo?
        when "africa_maputo?"
          sig(args)
          code_africa_maputo?
        when "africa_maseru?"
          sig(args)
          code_africa_maseru?
        when "africa_mbabane?"
          sig(args)
          code_africa_mbabane?
        when "africa_mogadishu?"
          sig(args)
          code_africa_mogadishu?
        when "africa_monrovia?"
          sig(args)
          code_africa_monrovia?
        when "africa_nairobi?"
          sig(args)
          code_africa_nairobi?
        when "africa_ndjamena?"
          sig(args)
          code_africa_ndjamena?
        when "africa_niamey?"
          sig(args)
          code_africa_niamey?
        when "africa_nouakchott?"
          sig(args)
          code_africa_nouakchott?
        when "africa_ouagadougou?"
          sig(args)
          code_africa_ouagadougou?
        when "africa_porto_minus_novo?"
          sig(args)
          code_africa_porto_minus_novo?
        when "africa_sao_tome?"
          sig(args)
          code_africa_sao_tome?
        when "africa_timbuktu?"
          sig(args)
          code_africa_timbuktu?
        when "africa_tripoli?"
          sig(args)
          code_africa_tripoli?
        when "africa_tunis?"
          sig(args)
          code_africa_tunis?
        when "africa_windhoek?"
          sig(args)
          code_africa_windhoek?
        when "america_adak?"
          sig(args)
          code_america_adak?
        when "america_anchorage?"
          sig(args)
          code_america_anchorage?
        when "america_anguilla?"
          sig(args)
          code_america_anguilla?
        when "america_antigua?"
          sig(args)
          code_america_antigua?
        when "america_araguaina?"
          sig(args)
          code_america_araguaina?
        when "america_argentina_buenos_aires?"
          sig(args)
          code_america_argentina_buenos_aires?
        when "america_argentina_catamarca?"
          sig(args)
          code_america_argentina_catamarca?
        when "america_argentina_comodrivadavia?"
          sig(args)
          code_america_argentina_comodrivadavia?
        when "america_argentina_cordoba?"
          sig(args)
          code_america_argentina_cordoba?
        when "america_argentina_jujuy?"
          sig(args)
          code_america_argentina_jujuy?
        when "america_argentina_la_rioja?"
          sig(args)
          code_america_argentina_la_rioja?
        when "america_argentina_mendoza?"
          sig(args)
          code_america_argentina_mendoza?
        when "america_argentina_rio_gallegos?"
          sig(args)
          code_america_argentina_rio_gallegos?
        when "america_argentina_salta?"
          sig(args)
          code_america_argentina_salta?
        when "america_argentina_san_juan?"
          sig(args)
          code_america_argentina_san_juan?
        when "america_argentina_san_luis?"
          sig(args)
          code_america_argentina_san_luis?
        when "america_argentina_tucuman?"
          sig(args)
          code_america_argentina_tucuman?
        when "america_argentina_ushuaia?"
          sig(args)
          code_america_argentina_ushuaia?
        when "america_aruba?"
          sig(args)
          code_america_aruba?
        when "america_asuncion?"
          sig(args)
          code_america_asuncion?
        when "america_atikokan?"
          sig(args)
          code_america_atikokan?
        when "america_atka?"
          sig(args)
          code_america_atka?
        when "america_bahia?"
          sig(args)
          code_america_bahia?
        when "america_bahia_banderas?"
          sig(args)
          code_america_bahia_banderas?
        when "america_barbados?"
          sig(args)
          code_america_barbados?
        when "america_belem?"
          sig(args)
          code_america_belem?
        when "america_belize?"
          sig(args)
          code_america_belize?
        when "america_blanc_minus_sablon?"
          sig(args)
          code_america_blanc_minus_sablon?
        when "america_boa_vista?"
          sig(args)
          code_america_boa_vista?
        when "america_bogota?"
          sig(args)
          code_america_bogota?
        when "america_boise?"
          sig(args)
          code_america_boise?
        when "america_buenos_aires?"
          sig(args)
          code_america_buenos_aires?
        when "america_cambridge_bay?"
          sig(args)
          code_america_cambridge_bay?
        when "america_campo_grande?"
          sig(args)
          code_america_campo_grande?
        when "america_cancun?"
          sig(args)
          code_america_cancun?
        when "america_caracas?"
          sig(args)
          code_america_caracas?
        when "america_catamarca?"
          sig(args)
          code_america_catamarca?
        when "america_cayenne?"
          sig(args)
          code_america_cayenne?
        when "america_cayman?"
          sig(args)
          code_america_cayman?
        when "america_chicago?"
          sig(args)
          code_america_chicago?
        when "america_chihuahua?"
          sig(args)
          code_america_chihuahua?
        when "america_ciudad_juarez?"
          sig(args)
          code_america_ciudad_juarez?
        when "america_coral_harbour?"
          sig(args)
          code_america_coral_harbour?
        when "america_cordoba?"
          sig(args)
          code_america_cordoba?
        when "america_costa_rica?"
          sig(args)
          code_america_costa_rica?
        when "america_coyhaique?"
          sig(args)
          code_america_coyhaique?
        when "america_creston?"
          sig(args)
          code_america_creston?
        when "america_cuiaba?"
          sig(args)
          code_america_cuiaba?
        when "america_curacao?"
          sig(args)
          code_america_curacao?
        when "america_danmarkshavn?"
          sig(args)
          code_america_danmarkshavn?
        when "america_dawson?"
          sig(args)
          code_america_dawson?
        when "america_dawson_creek?"
          sig(args)
          code_america_dawson_creek?
        when "america_denver?"
          sig(args)
          code_america_denver?
        when "america_detroit?"
          sig(args)
          code_america_detroit?
        when "america_dominica?"
          sig(args)
          code_america_dominica?
        when "america_edmonton?"
          sig(args)
          code_america_edmonton?
        when "america_eirunepe?"
          sig(args)
          code_america_eirunepe?
        when "america_el_salvador?"
          sig(args)
          code_america_el_salvador?
        when "america_ensenada?"
          sig(args)
          code_america_ensenada?
        when "america_fort_nelson?"
          sig(args)
          code_america_fort_nelson?
        when "america_fort_wayne?"
          sig(args)
          code_america_fort_wayne?
        when "america_fortaleza?"
          sig(args)
          code_america_fortaleza?
        when "america_glace_bay?"
          sig(args)
          code_america_glace_bay?
        when "america_godthab?"
          sig(args)
          code_america_godthab?
        when "america_goose_bay?"
          sig(args)
          code_america_goose_bay?
        when "america_grand_turk?"
          sig(args)
          code_america_grand_turk?
        when "america_grenada?"
          sig(args)
          code_america_grenada?
        when "america_guadeloupe?"
          sig(args)
          code_america_guadeloupe?
        when "america_guatemala?"
          sig(args)
          code_america_guatemala?
        when "america_guayaquil?"
          sig(args)
          code_america_guayaquil?
        when "america_guyana?"
          sig(args)
          code_america_guyana?
        when "america_halifax?"
          sig(args)
          code_america_halifax?
        when "america_havana?"
          sig(args)
          code_america_havana?
        when "america_hermosillo?"
          sig(args)
          code_america_hermosillo?
        when "america_indiana_indianapolis?"
          sig(args)
          code_america_indiana_indianapolis?
        when "america_indiana_knox?"
          sig(args)
          code_america_indiana_knox?
        when "america_indiana_marengo?"
          sig(args)
          code_america_indiana_marengo?
        when "america_indiana_petersburg?"
          sig(args)
          code_america_indiana_petersburg?
        when "america_indiana_tell_city?"
          sig(args)
          code_america_indiana_tell_city?
        when "america_indiana_vevay?"
          sig(args)
          code_america_indiana_vevay?
        when "america_indiana_vincennes?"
          sig(args)
          code_america_indiana_vincennes?
        when "america_indiana_winamac?"
          sig(args)
          code_america_indiana_winamac?
        when "america_indianapolis?"
          sig(args)
          code_america_indianapolis?
        when "america_inuvik?"
          sig(args)
          code_america_inuvik?
        when "america_iqaluit?"
          sig(args)
          code_america_iqaluit?
        when "america_jamaica?"
          sig(args)
          code_america_jamaica?
        when "america_jujuy?"
          sig(args)
          code_america_jujuy?
        when "america_juneau?"
          sig(args)
          code_america_juneau?
        when "america_kentucky_louisville?"
          sig(args)
          code_america_kentucky_louisville?
        when "america_kentucky_monticello?"
          sig(args)
          code_america_kentucky_monticello?
        when "america_knox_in?"
          sig(args)
          code_america_knox_in?
        when "america_kralendijk?"
          sig(args)
          code_america_kralendijk?
        when "america_la_paz?"
          sig(args)
          code_america_la_paz?
        when "america_lima?"
          sig(args)
          code_america_lima?
        when "america_los_angeles?"
          sig(args)
          code_america_los_angeles?
        when "america_louisville?"
          sig(args)
          code_america_louisville?
        when "america_lower_princes?"
          sig(args)
          code_america_lower_princes?
        when "america_maceio?"
          sig(args)
          code_america_maceio?
        when "america_managua?"
          sig(args)
          code_america_managua?
        when "america_manaus?"
          sig(args)
          code_america_manaus?
        when "america_marigot?"
          sig(args)
          code_america_marigot?
        when "america_martinique?"
          sig(args)
          code_america_martinique?
        when "america_matamoros?"
          sig(args)
          code_america_matamoros?
        when "america_mazatlan?"
          sig(args)
          code_america_mazatlan?
        when "america_mendoza?"
          sig(args)
          code_america_mendoza?
        when "america_menominee?"
          sig(args)
          code_america_menominee?
        when "america_merida?"
          sig(args)
          code_america_merida?
        when "america_metlakatla?"
          sig(args)
          code_america_metlakatla?
        when "america_mexico_city?"
          sig(args)
          code_america_mexico_city?
        when "america_miquelon?"
          sig(args)
          code_america_miquelon?
        when "america_moncton?"
          sig(args)
          code_america_moncton?
        when "america_monterrey?"
          sig(args)
          code_america_monterrey?
        when "america_montevideo?"
          sig(args)
          code_america_montevideo?
        when "america_montreal?"
          sig(args)
          code_america_montreal?
        when "america_montserrat?"
          sig(args)
          code_america_montserrat?
        when "america_nassau?"
          sig(args)
          code_america_nassau?
        when "america_new_york?"
          sig(args)
          code_america_new_york?
        when "america_nipigon?"
          sig(args)
          code_america_nipigon?
        when "america_nome?"
          sig(args)
          code_america_nome?
        when "america_noronha?"
          sig(args)
          code_america_noronha?
        when "america_north_dakota_beulah?"
          sig(args)
          code_america_north_dakota_beulah?
        when "america_north_dakota_center?"
          sig(args)
          code_america_north_dakota_center?
        when "america_north_dakota_new_salem?"
          sig(args)
          code_america_north_dakota_new_salem?
        when "america_nuuk?"
          sig(args)
          code_america_nuuk?
        when "america_ojinaga?"
          sig(args)
          code_america_ojinaga?
        when "america_panama?"
          sig(args)
          code_america_panama?
        when "america_pangnirtung?"
          sig(args)
          code_america_pangnirtung?
        when "america_paramaribo?"
          sig(args)
          code_america_paramaribo?
        when "america_phoenix?"
          sig(args)
          code_america_phoenix?
        when "america_port_minus_au_minus_prince?"
          sig(args)
          code_america_port_minus_au_minus_prince?
        when "america_port_of_spain?"
          sig(args)
          code_america_port_of_spain?
        when "america_porto_acre?"
          sig(args)
          code_america_porto_acre?
        when "america_porto_velho?"
          sig(args)
          code_america_porto_velho?
        when "america_puerto_rico?"
          sig(args)
          code_america_puerto_rico?
        when "america_punta_arenas?"
          sig(args)
          code_america_punta_arenas?
        when "america_rainy_river?"
          sig(args)
          code_america_rainy_river?
        when "america_rankin_inlet?"
          sig(args)
          code_america_rankin_inlet?
        when "america_recife?"
          sig(args)
          code_america_recife?
        when "america_regina?"
          sig(args)
          code_america_regina?
        when "america_resolute?"
          sig(args)
          code_america_resolute?
        when "america_rio_branco?"
          sig(args)
          code_america_rio_branco?
        when "america_rosario?"
          sig(args)
          code_america_rosario?
        when "america_santa_isabel?"
          sig(args)
          code_america_santa_isabel?
        when "america_santarem?"
          sig(args)
          code_america_santarem?
        when "america_santiago?"
          sig(args)
          code_america_santiago?
        when "america_santo_domingo?"
          sig(args)
          code_america_santo_domingo?
        when "america_sao_paulo?"
          sig(args)
          code_america_sao_paulo?
        when "america_scoresbysund?"
          sig(args)
          code_america_scoresbysund?
        when "america_shiprock?"
          sig(args)
          code_america_shiprock?
        when "america_sitka?"
          sig(args)
          code_america_sitka?
        when "america_st_barthelemy?"
          sig(args)
          code_america_st_barthelemy?
        when "america_st_johns?"
          sig(args)
          code_america_st_johns?
        when "america_st_kitts?"
          sig(args)
          code_america_st_kitts?
        when "america_st_lucia?"
          sig(args)
          code_america_st_lucia?
        when "america_st_thomas?"
          sig(args)
          code_america_st_thomas?
        when "america_st_vincent?"
          sig(args)
          code_america_st_vincent?
        when "america_swift_current?"
          sig(args)
          code_america_swift_current?
        when "america_tegucigalpa?"
          sig(args)
          code_america_tegucigalpa?
        when "america_thule?"
          sig(args)
          code_america_thule?
        when "america_thunder_bay?"
          sig(args)
          code_america_thunder_bay?
        when "america_tijuana?"
          sig(args)
          code_america_tijuana?
        when "america_toronto?"
          sig(args)
          code_america_toronto?
        when "america_tortola?"
          sig(args)
          code_america_tortola?
        when "america_vancouver?"
          sig(args)
          code_america_vancouver?
        when "america_virgin?"
          sig(args)
          code_america_virgin?
        when "america_whitehorse?"
          sig(args)
          code_america_whitehorse?
        when "america_winnipeg?"
          sig(args)
          code_america_winnipeg?
        when "america_yakutat?"
          sig(args)
          code_america_yakutat?
        when "america_yellowknife?"
          sig(args)
          code_america_yellowknife?
        when "antarctica_casey?"
          sig(args)
          code_antarctica_casey?
        when "antarctica_davis?"
          sig(args)
          code_antarctica_davis?
        when "antarctica_dumontdurville?"
          sig(args)
          code_antarctica_dumontdurville?
        when "antarctica_macquarie?"
          sig(args)
          code_antarctica_macquarie?
        when "antarctica_mawson?"
          sig(args)
          code_antarctica_mawson?
        when "antarctica_mcmurdo?"
          sig(args)
          code_antarctica_mcmurdo?
        when "antarctica_palmer?"
          sig(args)
          code_antarctica_palmer?
        when "antarctica_rothera?"
          sig(args)
          code_antarctica_rothera?
        when "antarctica_south_pole?"
          sig(args)
          code_antarctica_south_pole?
        when "antarctica_syowa?"
          sig(args)
          code_antarctica_syowa?
        when "antarctica_troll?"
          sig(args)
          code_antarctica_troll?
        when "antarctica_vostok?"
          sig(args)
          code_antarctica_vostok?
        when "arctic_longyearbyen?"
          sig(args)
          code_arctic_longyearbyen?
        when "asia_aden?"
          sig(args)
          code_asia_aden?
        when "asia_almaty?"
          sig(args)
          code_asia_almaty?
        when "asia_amman?"
          sig(args)
          code_asia_amman?
        when "asia_anadyr?"
          sig(args)
          code_asia_anadyr?
        when "asia_aqtau?"
          sig(args)
          code_asia_aqtau?
        when "asia_aqtobe?"
          sig(args)
          code_asia_aqtobe?
        when "asia_ashgabat?"
          sig(args)
          code_asia_ashgabat?
        when "asia_ashkhabad?"
          sig(args)
          code_asia_ashkhabad?
        when "asia_atyrau?"
          sig(args)
          code_asia_atyrau?
        when "asia_baghdad?"
          sig(args)
          code_asia_baghdad?
        when "asia_bahrain?"
          sig(args)
          code_asia_bahrain?
        when "asia_baku?"
          sig(args)
          code_asia_baku?
        when "asia_bangkok?"
          sig(args)
          code_asia_bangkok?
        when "asia_barnaul?"
          sig(args)
          code_asia_barnaul?
        when "asia_beirut?"
          sig(args)
          code_asia_beirut?
        when "asia_bishkek?"
          sig(args)
          code_asia_bishkek?
        when "asia_brunei?"
          sig(args)
          code_asia_brunei?
        when "asia_calcutta?"
          sig(args)
          code_asia_calcutta?
        when "asia_chita?"
          sig(args)
          code_asia_chita?
        when "asia_choibalsan?"
          sig(args)
          code_asia_choibalsan?
        when "asia_chongqing?"
          sig(args)
          code_asia_chongqing?
        when "asia_chungking?"
          sig(args)
          code_asia_chungking?
        when "asia_colombo?"
          sig(args)
          code_asia_colombo?
        when "asia_dacca?"
          sig(args)
          code_asia_dacca?
        when "asia_damascus?"
          sig(args)
          code_asia_damascus?
        when "asia_dhaka?"
          sig(args)
          code_asia_dhaka?
        when "asia_dili?"
          sig(args)
          code_asia_dili?
        when "asia_dubai?"
          sig(args)
          code_asia_dubai?
        when "asia_dushanbe?"
          sig(args)
          code_asia_dushanbe?
        when "asia_famagusta?"
          sig(args)
          code_asia_famagusta?
        when "asia_gaza?"
          sig(args)
          code_asia_gaza?
        when "asia_harbin?"
          sig(args)
          code_asia_harbin?
        when "asia_hebron?"
          sig(args)
          code_asia_hebron?
        when "asia_ho_chi_minh?"
          sig(args)
          code_asia_ho_chi_minh?
        when "asia_hong_kong?"
          sig(args)
          code_asia_hong_kong?
        when "asia_hovd?"
          sig(args)
          code_asia_hovd?
        when "asia_irkutsk?"
          sig(args)
          code_asia_irkutsk?
        when "asia_istanbul?"
          sig(args)
          code_asia_istanbul?
        when "asia_jakarta?"
          sig(args)
          code_asia_jakarta?
        when "asia_jayapura?"
          sig(args)
          code_asia_jayapura?
        when "asia_jerusalem?"
          sig(args)
          code_asia_jerusalem?
        when "asia_kabul?"
          sig(args)
          code_asia_kabul?
        when "asia_kamchatka?"
          sig(args)
          code_asia_kamchatka?
        when "asia_karachi?"
          sig(args)
          code_asia_karachi?
        when "asia_kashgar?"
          sig(args)
          code_asia_kashgar?
        when "asia_kathmandu?"
          sig(args)
          code_asia_kathmandu?
        when "asia_katmandu?"
          sig(args)
          code_asia_katmandu?
        when "asia_khandyga?"
          sig(args)
          code_asia_khandyga?
        when "asia_kolkata?"
          sig(args)
          code_asia_kolkata?
        when "asia_krasnoyarsk?"
          sig(args)
          code_asia_krasnoyarsk?
        when "asia_kuala_lumpur?"
          sig(args)
          code_asia_kuala_lumpur?
        when "asia_kuching?"
          sig(args)
          code_asia_kuching?
        when "asia_kuwait?"
          sig(args)
          code_asia_kuwait?
        when "asia_macao?"
          sig(args)
          code_asia_macao?
        when "asia_macau?"
          sig(args)
          code_asia_macau?
        when "asia_magadan?"
          sig(args)
          code_asia_magadan?
        when "asia_makassar?"
          sig(args)
          code_asia_makassar?
        when "asia_manila?"
          sig(args)
          code_asia_manila?
        when "asia_muscat?"
          sig(args)
          code_asia_muscat?
        when "asia_nicosia?"
          sig(args)
          code_asia_nicosia?
        when "asia_novokuznetsk?"
          sig(args)
          code_asia_novokuznetsk?
        when "asia_novosibirsk?"
          sig(args)
          code_asia_novosibirsk?
        when "asia_omsk?"
          sig(args)
          code_asia_omsk?
        when "asia_oral?"
          sig(args)
          code_asia_oral?
        when "asia_phnom_penh?"
          sig(args)
          code_asia_phnom_penh?
        when "asia_pontianak?"
          sig(args)
          code_asia_pontianak?
        when "asia_pyongyang?"
          sig(args)
          code_asia_pyongyang?
        when "asia_qatar?"
          sig(args)
          code_asia_qatar?
        when "asia_qostanay?"
          sig(args)
          code_asia_qostanay?
        when "asia_qyzylorda?"
          sig(args)
          code_asia_qyzylorda?
        when "asia_rangoon?"
          sig(args)
          code_asia_rangoon?
        when "asia_riyadh?"
          sig(args)
          code_asia_riyadh?
        when "asia_saigon?"
          sig(args)
          code_asia_saigon?
        when "asia_sakhalin?"
          sig(args)
          code_asia_sakhalin?
        when "asia_samarkand?"
          sig(args)
          code_asia_samarkand?
        when "asia_seoul?"
          sig(args)
          code_asia_seoul?
        when "asia_shanghai?"
          sig(args)
          code_asia_shanghai?
        when "asia_singapore?"
          sig(args)
          code_asia_singapore?
        when "asia_srednekolymsk?"
          sig(args)
          code_asia_srednekolymsk?
        when "asia_taipei?"
          sig(args)
          code_asia_taipei?
        when "asia_tashkent?"
          sig(args)
          code_asia_tashkent?
        when "asia_tbilisi?"
          sig(args)
          code_asia_tbilisi?
        when "asia_tehran?"
          sig(args)
          code_asia_tehran?
        when "asia_tel_aviv?"
          sig(args)
          code_asia_tel_aviv?
        when "asia_thimbu?"
          sig(args)
          code_asia_thimbu?
        when "asia_thimphu?"
          sig(args)
          code_asia_thimphu?
        when "asia_tokyo?"
          sig(args)
          code_asia_tokyo?
        when "asia_tomsk?"
          sig(args)
          code_asia_tomsk?
        when "asia_ujung_pandang?"
          sig(args)
          code_asia_ujung_pandang?
        when "asia_ulaanbaatar?"
          sig(args)
          code_asia_ulaanbaatar?
        when "asia_ulan_bator?"
          sig(args)
          code_asia_ulan_bator?
        when "asia_urumqi?"
          sig(args)
          code_asia_urumqi?
        when "asia_ust_minus_nera?"
          sig(args)
          code_asia_ust_minus_nera?
        when "asia_vientiane?"
          sig(args)
          code_asia_vientiane?
        when "asia_vladivostok?"
          sig(args)
          code_asia_vladivostok?
        when "asia_yakutsk?"
          sig(args)
          code_asia_yakutsk?
        when "asia_yangon?"
          sig(args)
          code_asia_yangon?
        when "asia_yekaterinburg?"
          sig(args)
          code_asia_yekaterinburg?
        when "asia_yerevan?"
          sig(args)
          code_asia_yerevan?
        when "atlantic_azores?"
          sig(args)
          code_atlantic_azores?
        when "atlantic_bermuda?"
          sig(args)
          code_atlantic_bermuda?
        when "atlantic_canary?"
          sig(args)
          code_atlantic_canary?
        when "atlantic_cape_verde?"
          sig(args)
          code_atlantic_cape_verde?
        when "atlantic_faeroe?"
          sig(args)
          code_atlantic_faeroe?
        when "atlantic_faroe?"
          sig(args)
          code_atlantic_faroe?
        when "atlantic_jan_mayen?"
          sig(args)
          code_atlantic_jan_mayen?
        when "atlantic_madeira?"
          sig(args)
          code_atlantic_madeira?
        when "atlantic_reykjavik?"
          sig(args)
          code_atlantic_reykjavik?
        when "atlantic_south_georgia?"
          sig(args)
          code_atlantic_south_georgia?
        when "atlantic_st_helena?"
          sig(args)
          code_atlantic_st_helena?
        when "atlantic_stanley?"
          sig(args)
          code_atlantic_stanley?
        when "australia_act?"
          sig(args)
          code_australia_act?
        when "australia_adelaide?"
          sig(args)
          code_australia_adelaide?
        when "australia_brisbane?"
          sig(args)
          code_australia_brisbane?
        when "australia_broken_hill?"
          sig(args)
          code_australia_broken_hill?
        when "australia_canberra?"
          sig(args)
          code_australia_canberra?
        when "australia_currie?"
          sig(args)
          code_australia_currie?
        when "australia_darwin?"
          sig(args)
          code_australia_darwin?
        when "australia_eucla?"
          sig(args)
          code_australia_eucla?
        when "australia_hobart?"
          sig(args)
          code_australia_hobart?
        when "australia_lhi?"
          sig(args)
          code_australia_lhi?
        when "australia_lindeman?"
          sig(args)
          code_australia_lindeman?
        when "australia_lord_howe?"
          sig(args)
          code_australia_lord_howe?
        when "australia_melbourne?"
          sig(args)
          code_australia_melbourne?
        when "australia_nsw?"
          sig(args)
          code_australia_nsw?
        when "australia_north?"
          sig(args)
          code_australia_north?
        when "australia_perth?"
          sig(args)
          code_australia_perth?
        when "australia_queensland?"
          sig(args)
          code_australia_queensland?
        when "australia_south?"
          sig(args)
          code_australia_south?
        when "australia_sydney?"
          sig(args)
          code_australia_sydney?
        when "australia_tasmania?"
          sig(args)
          code_australia_tasmania?
        when "australia_victoria?"
          sig(args)
          code_australia_victoria?
        when "australia_west?"
          sig(args)
          code_australia_west?
        when "australia_yancowinna?"
          sig(args)
          code_australia_yancowinna?
        when "brazil_acre?"
          sig(args)
          code_brazil_acre?
        when "brazil_denoronha?"
          sig(args)
          code_brazil_denoronha?
        when "brazil_east?"
          sig(args)
          code_brazil_east?
        when "brazil_west?"
          sig(args)
          code_brazil_west?
        when "cet?"
          sig(args)
          code_cet?
        when "cst6cdt?"
          sig(args)
          code_cst6cdt?
        when "canada_atlantic?"
          sig(args)
          code_canada_atlantic?
        when "canada_central?"
          sig(args)
          code_canada_central?
        when "canada_eastern?"
          sig(args)
          code_canada_eastern?
        when "canada_mountain?"
          sig(args)
          code_canada_mountain?
        when "canada_newfoundland?"
          sig(args)
          code_canada_newfoundland?
        when "canada_pacific?"
          sig(args)
          code_canada_pacific?
        when "canada_saskatchewan?"
          sig(args)
          code_canada_saskatchewan?
        when "canada_yukon?"
          sig(args)
          code_canada_yukon?
        when "chile_continental?"
          sig(args)
          code_chile_continental?
        when "chile_easterisland?"
          sig(args)
          code_chile_easterisland?
        when "cuba?"
          sig(args)
          code_cuba?
        when "eet?"
          sig(args)
          code_eet?
        when "est?"
          sig(args)
          code_est?
        when "est5edt?"
          sig(args)
          code_est5edt?
        when "egypt?"
          sig(args)
          code_egypt?
        when "eire?"
          sig(args)
          code_eire?
        when "etc_gmt?"
          sig(args)
          code_etc_gmt?
        when "etc_gmt_plus_0?"
          sig(args)
          code_etc_gmt_plus_0?
        when "etc_gmt_plus_1?"
          sig(args)
          code_etc_gmt_plus_1?
        when "etc_gmt_plus_10?"
          sig(args)
          code_etc_gmt_plus_10?
        when "etc_gmt_plus_11?"
          sig(args)
          code_etc_gmt_plus_11?
        when "etc_gmt_plus_12?"
          sig(args)
          code_etc_gmt_plus_12?
        when "etc_gmt_plus_2?"
          sig(args)
          code_etc_gmt_plus_2?
        when "etc_gmt_plus_3?"
          sig(args)
          code_etc_gmt_plus_3?
        when "etc_gmt_plus_4?"
          sig(args)
          code_etc_gmt_plus_4?
        when "etc_gmt_plus_5?"
          sig(args)
          code_etc_gmt_plus_5?
        when "etc_gmt_plus_6?"
          sig(args)
          code_etc_gmt_plus_6?
        when "etc_gmt_plus_7?"
          sig(args)
          code_etc_gmt_plus_7?
        when "etc_gmt_plus_8?"
          sig(args)
          code_etc_gmt_plus_8?
        when "etc_gmt_plus_9?"
          sig(args)
          code_etc_gmt_plus_9?
        when "etc_gmt_minus_0?"
          sig(args)
          code_etc_gmt_minus_0?
        when "etc_gmt_minus_1?"
          sig(args)
          code_etc_gmt_minus_1?
        when "etc_gmt_minus_10?"
          sig(args)
          code_etc_gmt_minus_10?
        when "etc_gmt_minus_11?"
          sig(args)
          code_etc_gmt_minus_11?
        when "etc_gmt_minus_12?"
          sig(args)
          code_etc_gmt_minus_12?
        when "etc_gmt_minus_13?"
          sig(args)
          code_etc_gmt_minus_13?
        when "etc_gmt_minus_14?"
          sig(args)
          code_etc_gmt_minus_14?
        when "etc_gmt_minus_2?"
          sig(args)
          code_etc_gmt_minus_2?
        when "etc_gmt_minus_3?"
          sig(args)
          code_etc_gmt_minus_3?
        when "etc_gmt_minus_4?"
          sig(args)
          code_etc_gmt_minus_4?
        when "etc_gmt_minus_5?"
          sig(args)
          code_etc_gmt_minus_5?
        when "etc_gmt_minus_6?"
          sig(args)
          code_etc_gmt_minus_6?
        when "etc_gmt_minus_7?"
          sig(args)
          code_etc_gmt_minus_7?
        when "etc_gmt_minus_8?"
          sig(args)
          code_etc_gmt_minus_8?
        when "etc_gmt_minus_9?"
          sig(args)
          code_etc_gmt_minus_9?
        when "etc_gmt0?"
          sig(args)
          code_etc_gmt0?
        when "etc_greenwich?"
          sig(args)
          code_etc_greenwich?
        when "etc_uct?"
          sig(args)
          code_etc_uct?
        when "etc_utc?"
          sig(args)
          code_etc_utc?
        when "etc_universal?"
          sig(args)
          code_etc_universal?
        when "etc_zulu?"
          sig(args)
          code_etc_zulu?
        when "europe_amsterdam?"
          sig(args)
          code_europe_amsterdam?
        when "europe_andorra?"
          sig(args)
          code_europe_andorra?
        when "europe_astrakhan?"
          sig(args)
          code_europe_astrakhan?
        when "europe_athens?"
          sig(args)
          code_europe_athens?
        when "europe_belfast?"
          sig(args)
          code_europe_belfast?
        when "europe_belgrade?"
          sig(args)
          code_europe_belgrade?
        when "europe_berlin?"
          sig(args)
          code_europe_berlin?
        when "europe_bratislava?"
          sig(args)
          code_europe_bratislava?
        when "europe_brussels?"
          sig(args)
          code_europe_brussels?
        when "europe_bucharest?"
          sig(args)
          code_europe_bucharest?
        when "europe_budapest?"
          sig(args)
          code_europe_budapest?
        when "europe_busingen?"
          sig(args)
          code_europe_busingen?
        when "europe_chisinau?"
          sig(args)
          code_europe_chisinau?
        when "europe_copenhagen?"
          sig(args)
          code_europe_copenhagen?
        when "europe_dublin?"
          sig(args)
          code_europe_dublin?
        when "europe_gibraltar?"
          sig(args)
          code_europe_gibraltar?
        when "europe_guernsey?"
          sig(args)
          code_europe_guernsey?
        when "europe_helsinki?"
          sig(args)
          code_europe_helsinki?
        when "europe_isle_of_man?"
          sig(args)
          code_europe_isle_of_man?
        when "europe_istanbul?"
          sig(args)
          code_europe_istanbul?
        when "europe_jersey?"
          sig(args)
          code_europe_jersey?
        when "europe_kaliningrad?"
          sig(args)
          code_europe_kaliningrad?
        when "europe_kiev?"
          sig(args)
          code_europe_kiev?
        when "europe_kirov?"
          sig(args)
          code_europe_kirov?
        when "europe_kyiv?"
          sig(args)
          code_europe_kyiv?
        when "europe_lisbon?"
          sig(args)
          code_europe_lisbon?
        when "europe_ljubljana?"
          sig(args)
          code_europe_ljubljana?
        when "europe_london?"
          sig(args)
          code_europe_london?
        when "europe_luxembourg?"
          sig(args)
          code_europe_luxembourg?
        when "europe_madrid?"
          sig(args)
          code_europe_madrid?
        when "europe_malta?"
          sig(args)
          code_europe_malta?
        when "europe_mariehamn?"
          sig(args)
          code_europe_mariehamn?
        when "europe_minsk?"
          sig(args)
          code_europe_minsk?
        when "europe_monaco?"
          sig(args)
          code_europe_monaco?
        when "europe_moscow?"
          sig(args)
          code_europe_moscow?
        when "europe_nicosia?"
          sig(args)
          code_europe_nicosia?
        when "europe_oslo?"
          sig(args)
          code_europe_oslo?
        when "europe_paris?"
          sig(args)
          code_europe_paris?
        when "europe_podgorica?"
          sig(args)
          code_europe_podgorica?
        when "europe_prague?"
          sig(args)
          code_europe_prague?
        when "europe_riga?"
          sig(args)
          code_europe_riga?
        when "europe_rome?"
          sig(args)
          code_europe_rome?
        when "europe_samara?"
          sig(args)
          code_europe_samara?
        when "europe_san_marino?"
          sig(args)
          code_europe_san_marino?
        when "europe_sarajevo?"
          sig(args)
          code_europe_sarajevo?
        when "europe_saratov?"
          sig(args)
          code_europe_saratov?
        when "europe_simferopol?"
          sig(args)
          code_europe_simferopol?
        when "europe_skopje?"
          sig(args)
          code_europe_skopje?
        when "europe_sofia?"
          sig(args)
          code_europe_sofia?
        when "europe_stockholm?"
          sig(args)
          code_europe_stockholm?
        when "europe_tallinn?"
          sig(args)
          code_europe_tallinn?
        when "europe_tirane?"
          sig(args)
          code_europe_tirane?
        when "europe_tiraspol?"
          sig(args)
          code_europe_tiraspol?
        when "europe_ulyanovsk?"
          sig(args)
          code_europe_ulyanovsk?
        when "europe_uzhgorod?"
          sig(args)
          code_europe_uzhgorod?
        when "europe_vaduz?"
          sig(args)
          code_europe_vaduz?
        when "europe_vatican?"
          sig(args)
          code_europe_vatican?
        when "europe_vienna?"
          sig(args)
          code_europe_vienna?
        when "europe_vilnius?"
          sig(args)
          code_europe_vilnius?
        when "europe_volgograd?"
          sig(args)
          code_europe_volgograd?
        when "europe_warsaw?"
          sig(args)
          code_europe_warsaw?
        when "europe_zagreb?"
          sig(args)
          code_europe_zagreb?
        when "europe_zaporozhye?"
          sig(args)
          code_europe_zaporozhye?
        when "europe_zurich?"
          sig(args)
          code_europe_zurich?
        when "factory?"
          sig(args)
          code_factory?
        when "gb?"
          sig(args)
          code_gb?
        when "gb_minus_eire?"
          sig(args)
          code_gb_minus_eire?
        when "gmt?"
          sig(args)
          code_gmt?
        when "gmt_plus_0?"
          sig(args)
          code_gmt_plus_0?
        when "gmt_minus_0?"
          sig(args)
          code_gmt_minus_0?
        when "gmt0?"
          sig(args)
          code_gmt0?
        when "greenwich?"
          sig(args)
          code_greenwich?
        when "hst?"
          sig(args)
          code_hst?
        when "hongkong?"
          sig(args)
          code_hongkong?
        when "iceland?"
          sig(args)
          code_iceland?
        when "indian_antananarivo?"
          sig(args)
          code_indian_antananarivo?
        when "indian_chagos?"
          sig(args)
          code_indian_chagos?
        when "indian_christmas?"
          sig(args)
          code_indian_christmas?
        when "indian_cocos?"
          sig(args)
          code_indian_cocos?
        when "indian_comoro?"
          sig(args)
          code_indian_comoro?
        when "indian_kerguelen?"
          sig(args)
          code_indian_kerguelen?
        when "indian_mahe?"
          sig(args)
          code_indian_mahe?
        when "indian_maldives?"
          sig(args)
          code_indian_maldives?
        when "indian_mauritius?"
          sig(args)
          code_indian_mauritius?
        when "indian_mayotte?"
          sig(args)
          code_indian_mayotte?
        when "indian_reunion?"
          sig(args)
          code_indian_reunion?
        when "iran?"
          sig(args)
          code_iran?
        when "israel?"
          sig(args)
          code_israel?
        when "jamaica?"
          sig(args)
          code_jamaica?
        when "japan?"
          sig(args)
          code_japan?
        when "kwajalein?"
          sig(args)
          code_kwajalein?
        when "libya?"
          sig(args)
          code_libya?
        when "met?"
          sig(args)
          code_met?
        when "mst?"
          sig(args)
          code_mst?
        when "mst7mdt?"
          sig(args)
          code_mst7mdt?
        when "mexico_bajanorte?"
          sig(args)
          code_mexico_bajanorte?
        when "mexico_bajasur?"
          sig(args)
          code_mexico_bajasur?
        when "mexico_general?"
          sig(args)
          code_mexico_general?
        when "nz?"
          sig(args)
          code_nz?
        when "nz_minus_chat?"
          sig(args)
          code_nz_minus_chat?
        when "navajo?"
          sig(args)
          code_navajo?
        when "prc?"
          sig(args)
          code_prc?
        when "pst8pdt?"
          sig(args)
          code_pst8pdt?
        when "pacific_apia?"
          sig(args)
          code_pacific_apia?
        when "pacific_auckland?"
          sig(args)
          code_pacific_auckland?
        when "pacific_bougainville?"
          sig(args)
          code_pacific_bougainville?
        when "pacific_chatham?"
          sig(args)
          code_pacific_chatham?
        when "pacific_chuuk?"
          sig(args)
          code_pacific_chuuk?
        when "pacific_easter?"
          sig(args)
          code_pacific_easter?
        when "pacific_efate?"
          sig(args)
          code_pacific_efate?
        when "pacific_enderbury?"
          sig(args)
          code_pacific_enderbury?
        when "pacific_fakaofo?"
          sig(args)
          code_pacific_fakaofo?
        when "pacific_fiji?"
          sig(args)
          code_pacific_fiji?
        when "pacific_funafuti?"
          sig(args)
          code_pacific_funafuti?
        when "pacific_galapagos?"
          sig(args)
          code_pacific_galapagos?
        when "pacific_gambier?"
          sig(args)
          code_pacific_gambier?
        when "pacific_guadalcanal?"
          sig(args)
          code_pacific_guadalcanal?
        when "pacific_guam?"
          sig(args)
          code_pacific_guam?
        when "pacific_honolulu?"
          sig(args)
          code_pacific_honolulu?
        when "pacific_johnston?"
          sig(args)
          code_pacific_johnston?
        when "pacific_kanton?"
          sig(args)
          code_pacific_kanton?
        when "pacific_kiritimati?"
          sig(args)
          code_pacific_kiritimati?
        when "pacific_kosrae?"
          sig(args)
          code_pacific_kosrae?
        when "pacific_kwajalein?"
          sig(args)
          code_pacific_kwajalein?
        when "pacific_majuro?"
          sig(args)
          code_pacific_majuro?
        when "pacific_marquesas?"
          sig(args)
          code_pacific_marquesas?
        when "pacific_midway?"
          sig(args)
          code_pacific_midway?
        when "pacific_nauru?"
          sig(args)
          code_pacific_nauru?
        when "pacific_niue?"
          sig(args)
          code_pacific_niue?
        when "pacific_norfolk?"
          sig(args)
          code_pacific_norfolk?
        when "pacific_noumea?"
          sig(args)
          code_pacific_noumea?
        when "pacific_pago_pago?"
          sig(args)
          code_pacific_pago_pago?
        when "pacific_palau?"
          sig(args)
          code_pacific_palau?
        when "pacific_pitcairn?"
          sig(args)
          code_pacific_pitcairn?
        when "pacific_pohnpei?"
          sig(args)
          code_pacific_pohnpei?
        when "pacific_ponape?"
          sig(args)
          code_pacific_ponape?
        when "pacific_port_moresby?"
          sig(args)
          code_pacific_port_moresby?
        when "pacific_rarotonga?"
          sig(args)
          code_pacific_rarotonga?
        when "pacific_saipan?"
          sig(args)
          code_pacific_saipan?
        when "pacific_samoa?"
          sig(args)
          code_pacific_samoa?
        when "pacific_tahiti?"
          sig(args)
          code_pacific_tahiti?
        when "pacific_tarawa?"
          sig(args)
          code_pacific_tarawa?
        when "pacific_tongatapu?"
          sig(args)
          code_pacific_tongatapu?
        when "pacific_truk?"
          sig(args)
          code_pacific_truk?
        when "pacific_wake?"
          sig(args)
          code_pacific_wake?
        when "pacific_wallis?"
          sig(args)
          code_pacific_wallis?
        when "pacific_yap?"
          sig(args)
          code_pacific_yap?
        when "poland?"
          sig(args)
          code_poland?
        when "portugal?"
          sig(args)
          code_portugal?
        when "roc?"
          sig(args)
          code_roc?
        when "rok?"
          sig(args)
          code_rok?
        when "singapore?"
          sig(args)
          code_singapore?
        when "turkey?"
          sig(args)
          code_turkey?
        when "uct?"
          sig(args)
          code_uct?
        when "us_alaska?"
          sig(args)
          code_us_alaska?
        when "us_aleutian?"
          sig(args)
          code_us_aleutian?
        when "us_arizona?"
          sig(args)
          code_us_arizona?
        when "us_central?"
          sig(args)
          code_us_central?
        when "us_east_minus_indiana?"
          sig(args)
          code_us_east_minus_indiana?
        when "us_eastern?"
          sig(args)
          code_us_eastern?
        when "us_hawaii?"
          sig(args)
          code_us_hawaii?
        when "us_indiana_minus_starke?"
          sig(args)
          code_us_indiana_minus_starke?
        when "us_michigan?"
          sig(args)
          code_us_michigan?
        when "us_mountain?"
          sig(args)
          code_us_mountain?
        when "us_pacific?"
          sig(args)
          code_us_pacific?
        when "us_samoa?"
          sig(args)
          code_us_samoa?
        when "utc?"
          sig(args)
          code_utc?
        when "universal?"
          sig(args)
          code_universal?
        when "w_minus_su?"
          sig(args)
          code_w_minus_su?
        when "wet?"
          sig(args)
          code_wet?
        when "zulu?"
          sig(args)
          code_zulu?
        when "utc_offset"
          sig(args)
          code_utc_offset
        when "year_day"
          sig(args)
          code_year_day
        when "month_day"
          sig(args)
          code_month_day
        when "nanosecond"
          sig(args)
          code_nanosecond
        when "nanoseconds"
          sig(args)
          code_nanoseconds
        when "millisecond"
          sig(args)
          code_millisecond
        when "milliseconds"
          sig(args)
          code_milliseconds
        when "utc"
          sig(args)
          code_utc
        when "local"
          sig(args)
          code_local
        when "beginning_of_day"
          sig(args)
          code_beginning_of_day
        when "end_of_day"
          sig(args)
          code_end_of_day
        when "january?"
          sig(args)
          code_january?
        when "february?"
          sig(args)
          code_february?
        when "march?"
          sig(args)
          code_march?
        when "april?"
          sig(args)
          code_april?
        when "may?"
          sig(args)
          code_may?
        when "june?"
          sig(args)
          code_june?
        when "july?"
          sig(args)
          code_july?
        when "august?"
          sig(args)
          code_august?
        when "september?"
          sig(args)
          code_september?
        when "october?"
          sig(args)
          code_october?
        when "november?"
          sig(args)
          code_november?
        when "december?"
          sig(args)
          code_december?
        when "add"
          sig(args) do
            {
              year: (String | Integer).maybe,
              years: (String | Integer).maybe,
              month: (String | Integer).maybe,
              months: (String | Integer).maybe,
              day: (String | Integer).maybe,
              days: (String | Integer).maybe,
              week_day: (String | Integer).maybe,
              week_days: (String | Integer).maybe,
              week: (String | Integer).maybe,
              weeks: (String | Integer).maybe
            }
          end

          if code_value.nothing?
            code_add
          else
            code_add(
              year: code_value.code_get(:year),
              years: code_value.code_get(:years),
              month: code_value.code_get(:month),
              months: code_value.code_get(:months),
              day: code_value.code_get(:day),
              days: code_value.code_get(:days),
              week_day: code_value.code_get(:week_day),
              week_days: code_value.code_get(:week_days),
              week: code_value.code_get(:week),
              weeks: code_value.code_get(:weeks)
            )
          end
        when "substract", "subtract"
          sig(args) do
            {
              year: (String | Integer).maybe,
              years: (String | Integer).maybe,
              month: (String | Integer).maybe,
              months: (String | Integer).maybe,
              day: (String | Integer).maybe,
              days: (String | Integer).maybe,
              week_day: (String | Integer).maybe,
              week_days: (String | Integer).maybe,
              week: (String | Integer).maybe,
              weeks: (String | Integer).maybe
            }
          end

          if code_value.nothing?
            code_substract
          else
            code_substract(
              year: code_value.code_get(:year),
              years: code_value.code_get(:years),
              month: code_value.code_get(:month),
              months: code_value.code_get(:months),
              day: code_value.code_get(:day),
              days: code_value.code_get(:days),
              week_day: code_value.code_get(:week_day),
              week_days: code_value.code_get(:week_days),
              week: code_value.code_get(:week),
              weeks: code_value.code_get(:weeks)
            )
          end
        when "change"
          sig(args) do
            {
              year: (String | Integer).maybe,
              years: (String | Integer).maybe,
              month: (String | Integer).maybe,
              months: (String | Integer).maybe,
              day: (String | Integer).maybe,
              days: (String | Integer).maybe,
              week_day: (String | Integer).maybe,
              week_days: (String | Integer).maybe,
              week: (String | Integer).maybe,
              weeks: (String | Integer).maybe
            }
          end

          if code_value.nothing?
            code_change
          else
            code_change(
              year: code_value.code_get(:year),
              years: code_value.code_get(:years),
              month: code_value.code_get(:month),
              months: code_value.code_get(:months),
              day: code_value.code_get(:day),
              days: code_value.code_get(:days),
              week_day: code_value.code_get(:week_day),
              week_days: code_value.code_get(:week_days),
              week: code_value.code_get(:week),
              weeks: code_value.code_get(:weeks)
            )
          end
        else
          super
        end
      end

      def code_after?(other = nil)
        code_other = other.to_code
        code_other = Date.new if code_other.nothing?

        Boolean.new(raw.after?(code_other.raw))
      end

      def code_before?(other = nil)
        code_other = other.to_code
        code_other = Date.new if code_other.nothing?

        Boolean.new(raw.before?(code_other.raw))
      end

      def code_past?
        code_before?
      end

      def code_future?
        code_after?
      end

      def code_year
        Integer.new(raw.year)
      end

      def code_years
        Integer.new(raw.year)
      end

      def code_month
        Integer.new(raw.month)
      end

      def code_months
        Integer.new(raw.month)
      end

      def code_week
        Integer.new(raw.cweek)
      end

      def code_weeks
        Integer.new(raw.cweek)
      end

      def code_week_day
        Integer.new(raw.wday)
      end

      def code_week_days
        Integer.new(raw.wday)
      end

      def code_day
        Integer.new(raw.day)
      end

      def code_days
        Integer.new(raw.day)
      end

      def code_monday?
        code_week_day.code_one?
      end

      def code_tuesday?
        code_week_day.code_two?
      end

      def code_wednesday?
        code_week_day.code_three?
      end

      def code_thursday?
        code_week_day.code_four?
      end

      def code_friday?
        code_week_day.code_five?
      end

      def code_saturday?
        code_week_day.code_six?
      end

      def code_sunday?
        code_week_day.code_zero?
      end

      def code_january?
        code_month.code_one?
      end

      def code_february?
        code_month.code_two?
      end

      def code_march?
        code_month.code_three?
      end

      def code_april?
        code_month.code_four?
      end

      def code_may?
        code_month.code_five?
      end

      def code_june?
        code_month.code_six?
      end

      def code_july?
        code_month.code_seven?
      end

      def code_august?
        code_month.code_eight?
      end

      def code_september?
        code_month.code_nine?
      end

      def code_october?
        code_month.code_ten?
      end

      def code_november?
        code_month.code_eleven?
      end

      def code_december?
        code_month.code_twelve?
      end

      def code_format(format, locale: nil)
        code_format = format.to_code
        code_locale = locale.to_code

        requested_locale = code_locale.raw&.to_s
        locale = requested_locale&.presence_in(LOCALES)&.to_sym
        locale ||= ::I18n.locale
        locale = ::I18n.locale unless ::I18n.available_locales.include?(
          locale.to_sym
        )

        format = code_format.raw || :default
        format = format.to_sym if ::I18n.exists?(
          "date.formats.#{format}",
          locale
        )

        String.new(::I18n.l(raw, format: format, locale: locale))
      end

      def code_iso8601
        String.new(raw.iso8601)
      end

      def code_iso
        code_iso8601
      end

      def code_rfc2822
        String.new(raw.rfc2822)
      end

      def code_rfc3339
        String.new(raw.rfc3339)
      end

      def code_rfc
        code_rfc3339
      end

      def code_to_list
        List.new([code_year, code_month, code_day])
      end

      def code_to_integer
        Integer.new(raw.beginning_of_day.to_i)
      end

      def code_to_decimal
        Decimal.new(BigDecimal(raw.beginning_of_day.to_r, 16))
      end

      def code_africa_abidjan?
        Boolean.new(current_time_zone_names.include?("Africa/Abidjan"))
      end

      def code_africa_accra?
        Boolean.new(current_time_zone_names.include?("Africa/Accra"))
      end

      def code_africa_addis_ababa?
        Boolean.new(current_time_zone_names.include?("Africa/Addis_Ababa"))
      end

      def code_africa_algiers?
        Boolean.new(current_time_zone_names.include?("Africa/Algiers"))
      end

      def code_africa_asmara?
        Boolean.new(current_time_zone_names.include?("Africa/Asmara"))
      end

      def code_africa_asmera?
        Boolean.new(current_time_zone_names.include?("Africa/Asmera"))
      end

      def code_africa_bamako?
        Boolean.new(current_time_zone_names.include?("Africa/Bamako"))
      end

      def code_africa_bangui?
        Boolean.new(current_time_zone_names.include?("Africa/Bangui"))
      end

      def code_africa_banjul?
        Boolean.new(current_time_zone_names.include?("Africa/Banjul"))
      end

      def code_africa_bissau?
        Boolean.new(current_time_zone_names.include?("Africa/Bissau"))
      end

      def code_africa_blantyre?
        Boolean.new(current_time_zone_names.include?("Africa/Blantyre"))
      end

      def code_africa_brazzaville?
        Boolean.new(current_time_zone_names.include?("Africa/Brazzaville"))
      end

      def code_africa_bujumbura?
        Boolean.new(current_time_zone_names.include?("Africa/Bujumbura"))
      end

      def code_africa_cairo?
        Boolean.new(current_time_zone_names.include?("Africa/Cairo"))
      end

      def code_africa_casablanca?
        Boolean.new(current_time_zone_names.include?("Africa/Casablanca"))
      end

      def code_africa_ceuta?
        Boolean.new(current_time_zone_names.include?("Africa/Ceuta"))
      end

      def code_africa_conakry?
        Boolean.new(current_time_zone_names.include?("Africa/Conakry"))
      end

      def code_africa_dakar?
        Boolean.new(current_time_zone_names.include?("Africa/Dakar"))
      end

      def code_africa_dar_es_salaam?
        Boolean.new(current_time_zone_names.include?("Africa/Dar_es_Salaam"))
      end

      def code_africa_djibouti?
        Boolean.new(current_time_zone_names.include?("Africa/Djibouti"))
      end

      def code_africa_douala?
        Boolean.new(current_time_zone_names.include?("Africa/Douala"))
      end

      def code_africa_el_aaiun?
        Boolean.new(current_time_zone_names.include?("Africa/El_Aaiun"))
      end

      def code_africa_freetown?
        Boolean.new(current_time_zone_names.include?("Africa/Freetown"))
      end

      def code_africa_gaborone?
        Boolean.new(current_time_zone_names.include?("Africa/Gaborone"))
      end

      def code_africa_harare?
        Boolean.new(current_time_zone_names.include?("Africa/Harare"))
      end

      def code_africa_johannesburg?
        Boolean.new(current_time_zone_names.include?("Africa/Johannesburg"))
      end

      def code_africa_juba?
        Boolean.new(current_time_zone_names.include?("Africa/Juba"))
      end

      def code_africa_kampala?
        Boolean.new(current_time_zone_names.include?("Africa/Kampala"))
      end

      def code_africa_khartoum?
        Boolean.new(current_time_zone_names.include?("Africa/Khartoum"))
      end

      def code_africa_kigali?
        Boolean.new(current_time_zone_names.include?("Africa/Kigali"))
      end

      def code_africa_kinshasa?
        Boolean.new(current_time_zone_names.include?("Africa/Kinshasa"))
      end

      def code_africa_lagos?
        Boolean.new(current_time_zone_names.include?("Africa/Lagos"))
      end

      def code_africa_libreville?
        Boolean.new(current_time_zone_names.include?("Africa/Libreville"))
      end

      def code_africa_lome?
        Boolean.new(current_time_zone_names.include?("Africa/Lome"))
      end

      def code_africa_luanda?
        Boolean.new(current_time_zone_names.include?("Africa/Luanda"))
      end

      def code_africa_lubumbashi?
        Boolean.new(current_time_zone_names.include?("Africa/Lubumbashi"))
      end

      def code_africa_lusaka?
        Boolean.new(current_time_zone_names.include?("Africa/Lusaka"))
      end

      def code_africa_malabo?
        Boolean.new(current_time_zone_names.include?("Africa/Malabo"))
      end

      def code_africa_maputo?
        Boolean.new(current_time_zone_names.include?("Africa/Maputo"))
      end

      def code_africa_maseru?
        Boolean.new(current_time_zone_names.include?("Africa/Maseru"))
      end

      def code_africa_mbabane?
        Boolean.new(current_time_zone_names.include?("Africa/Mbabane"))
      end

      def code_africa_mogadishu?
        Boolean.new(current_time_zone_names.include?("Africa/Mogadishu"))
      end

      def code_africa_monrovia?
        Boolean.new(current_time_zone_names.include?("Africa/Monrovia"))
      end

      def code_africa_nairobi?
        Boolean.new(current_time_zone_names.include?("Africa/Nairobi"))
      end

      def code_africa_ndjamena?
        Boolean.new(current_time_zone_names.include?("Africa/Ndjamena"))
      end

      def code_africa_niamey?
        Boolean.new(current_time_zone_names.include?("Africa/Niamey"))
      end

      def code_africa_nouakchott?
        Boolean.new(current_time_zone_names.include?("Africa/Nouakchott"))
      end

      def code_africa_ouagadougou?
        Boolean.new(current_time_zone_names.include?("Africa/Ouagadougou"))
      end

      def code_africa_porto_minus_novo?
        Boolean.new(current_time_zone_names.include?("Africa/Porto-Novo"))
      end

      def code_africa_sao_tome?
        Boolean.new(current_time_zone_names.include?("Africa/Sao_Tome"))
      end

      def code_africa_timbuktu?
        Boolean.new(current_time_zone_names.include?("Africa/Timbuktu"))
      end

      def code_africa_tripoli?
        Boolean.new(current_time_zone_names.include?("Africa/Tripoli"))
      end

      def code_africa_tunis?
        Boolean.new(current_time_zone_names.include?("Africa/Tunis"))
      end

      def code_africa_windhoek?
        Boolean.new(current_time_zone_names.include?("Africa/Windhoek"))
      end

      def code_america_adak?
        Boolean.new(current_time_zone_names.include?("America/Adak"))
      end

      def code_america_anchorage?
        Boolean.new(current_time_zone_names.include?("America/Anchorage"))
      end

      def code_america_anguilla?
        Boolean.new(current_time_zone_names.include?("America/Anguilla"))
      end

      def code_america_antigua?
        Boolean.new(current_time_zone_names.include?("America/Antigua"))
      end

      def code_america_araguaina?
        Boolean.new(current_time_zone_names.include?("America/Araguaina"))
      end

      def code_america_argentina_buenos_aires?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/Buenos_Aires")
        )
      end

      def code_america_argentina_catamarca?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/Catamarca")
        )
      end

      def code_america_argentina_comodrivadavia?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/ComodRivadavia")
        )
      end

      def code_america_argentina_cordoba?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/Cordoba")
        )
      end

      def code_america_argentina_jujuy?
        Boolean.new(current_time_zone_names.include?("America/Argentina/Jujuy"))
      end

      def code_america_argentina_la_rioja?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/La_Rioja")
        )
      end

      def code_america_argentina_mendoza?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/Mendoza")
        )
      end

      def code_america_argentina_rio_gallegos?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/Rio_Gallegos")
        )
      end

      def code_america_argentina_salta?
        Boolean.new(current_time_zone_names.include?("America/Argentina/Salta"))
      end

      def code_america_argentina_san_juan?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/San_Juan")
        )
      end

      def code_america_argentina_san_luis?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/San_Luis")
        )
      end

      def code_america_argentina_tucuman?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/Tucuman")
        )
      end

      def code_america_argentina_ushuaia?
        Boolean.new(
          current_time_zone_names.include?("America/Argentina/Ushuaia")
        )
      end

      def code_america_aruba?
        Boolean.new(current_time_zone_names.include?("America/Aruba"))
      end

      def code_america_asuncion?
        Boolean.new(current_time_zone_names.include?("America/Asuncion"))
      end

      def code_america_atikokan?
        Boolean.new(current_time_zone_names.include?("America/Atikokan"))
      end

      def code_america_atka?
        Boolean.new(current_time_zone_names.include?("America/Atka"))
      end

      def code_america_bahia?
        Boolean.new(current_time_zone_names.include?("America/Bahia"))
      end

      def code_america_bahia_banderas?
        Boolean.new(current_time_zone_names.include?("America/Bahia_Banderas"))
      end

      def code_america_barbados?
        Boolean.new(current_time_zone_names.include?("America/Barbados"))
      end

      def code_america_belem?
        Boolean.new(current_time_zone_names.include?("America/Belem"))
      end

      def code_america_belize?
        Boolean.new(current_time_zone_names.include?("America/Belize"))
      end

      def code_america_blanc_minus_sablon?
        Boolean.new(current_time_zone_names.include?("America/Blanc-Sablon"))
      end

      def code_america_boa_vista?
        Boolean.new(current_time_zone_names.include?("America/Boa_Vista"))
      end

      def code_america_bogota?
        Boolean.new(current_time_zone_names.include?("America/Bogota"))
      end

      def code_america_boise?
        Boolean.new(current_time_zone_names.include?("America/Boise"))
      end

      def code_america_buenos_aires?
        Boolean.new(current_time_zone_names.include?("America/Buenos_Aires"))
      end

      def code_america_cambridge_bay?
        Boolean.new(current_time_zone_names.include?("America/Cambridge_Bay"))
      end

      def code_america_campo_grande?
        Boolean.new(current_time_zone_names.include?("America/Campo_Grande"))
      end

      def code_america_cancun?
        Boolean.new(current_time_zone_names.include?("America/Cancun"))
      end

      def code_america_caracas?
        Boolean.new(current_time_zone_names.include?("America/Caracas"))
      end

      def code_america_catamarca?
        Boolean.new(current_time_zone_names.include?("America/Catamarca"))
      end

      def code_america_cayenne?
        Boolean.new(current_time_zone_names.include?("America/Cayenne"))
      end

      def code_america_cayman?
        Boolean.new(current_time_zone_names.include?("America/Cayman"))
      end

      def code_america_chicago?
        Boolean.new(current_time_zone_names.include?("America/Chicago"))
      end

      def code_america_chihuahua?
        Boolean.new(current_time_zone_names.include?("America/Chihuahua"))
      end

      def code_america_ciudad_juarez?
        Boolean.new(current_time_zone_names.include?("America/Ciudad_Juarez"))
      end

      def code_america_coral_harbour?
        Boolean.new(current_time_zone_names.include?("America/Coral_Harbour"))
      end

      def code_america_cordoba?
        Boolean.new(current_time_zone_names.include?("America/Cordoba"))
      end

      def code_america_costa_rica?
        Boolean.new(current_time_zone_names.include?("America/Costa_Rica"))
      end

      def code_america_coyhaique?
        Boolean.new(current_time_zone_names.include?("America/Coyhaique"))
      end

      def code_america_creston?
        Boolean.new(current_time_zone_names.include?("America/Creston"))
      end

      def code_america_cuiaba?
        Boolean.new(current_time_zone_names.include?("America/Cuiaba"))
      end

      def code_america_curacao?
        Boolean.new(current_time_zone_names.include?("America/Curacao"))
      end

      def code_america_danmarkshavn?
        Boolean.new(current_time_zone_names.include?("America/Danmarkshavn"))
      end

      def code_america_dawson?
        Boolean.new(current_time_zone_names.include?("America/Dawson"))
      end

      def code_america_dawson_creek?
        Boolean.new(current_time_zone_names.include?("America/Dawson_Creek"))
      end

      def code_america_denver?
        Boolean.new(current_time_zone_names.include?("America/Denver"))
      end

      def code_america_detroit?
        Boolean.new(current_time_zone_names.include?("America/Detroit"))
      end

      def code_america_dominica?
        Boolean.new(current_time_zone_names.include?("America/Dominica"))
      end

      def code_america_edmonton?
        Boolean.new(current_time_zone_names.include?("America/Edmonton"))
      end

      def code_america_eirunepe?
        Boolean.new(current_time_zone_names.include?("America/Eirunepe"))
      end

      def code_america_el_salvador?
        Boolean.new(current_time_zone_names.include?("America/El_Salvador"))
      end

      def code_america_ensenada?
        Boolean.new(current_time_zone_names.include?("America/Ensenada"))
      end

      def code_america_fort_nelson?
        Boolean.new(current_time_zone_names.include?("America/Fort_Nelson"))
      end

      def code_america_fort_wayne?
        Boolean.new(current_time_zone_names.include?("America/Fort_Wayne"))
      end

      def code_america_fortaleza?
        Boolean.new(current_time_zone_names.include?("America/Fortaleza"))
      end

      def code_america_glace_bay?
        Boolean.new(current_time_zone_names.include?("America/Glace_Bay"))
      end

      def code_america_godthab?
        Boolean.new(current_time_zone_names.include?("America/Godthab"))
      end

      def code_america_goose_bay?
        Boolean.new(current_time_zone_names.include?("America/Goose_Bay"))
      end

      def code_america_grand_turk?
        Boolean.new(current_time_zone_names.include?("America/Grand_Turk"))
      end

      def code_america_grenada?
        Boolean.new(current_time_zone_names.include?("America/Grenada"))
      end

      def code_america_guadeloupe?
        Boolean.new(current_time_zone_names.include?("America/Guadeloupe"))
      end

      def code_america_guatemala?
        Boolean.new(current_time_zone_names.include?("America/Guatemala"))
      end

      def code_america_guayaquil?
        Boolean.new(current_time_zone_names.include?("America/Guayaquil"))
      end

      def code_america_guyana?
        Boolean.new(current_time_zone_names.include?("America/Guyana"))
      end

      def code_america_halifax?
        Boolean.new(current_time_zone_names.include?("America/Halifax"))
      end

      def code_america_havana?
        Boolean.new(current_time_zone_names.include?("America/Havana"))
      end

      def code_america_hermosillo?
        Boolean.new(current_time_zone_names.include?("America/Hermosillo"))
      end

      def code_america_indiana_indianapolis?
        Boolean.new(
          current_time_zone_names.include?("America/Indiana/Indianapolis")
        )
      end

      def code_america_indiana_knox?
        Boolean.new(current_time_zone_names.include?("America/Indiana/Knox"))
      end

      def code_america_indiana_marengo?
        Boolean.new(current_time_zone_names.include?("America/Indiana/Marengo"))
      end

      def code_america_indiana_petersburg?
        Boolean.new(
          current_time_zone_names.include?("America/Indiana/Petersburg")
        )
      end

      def code_america_indiana_tell_city?
        Boolean.new(
          current_time_zone_names.include?("America/Indiana/Tell_City")
        )
      end

      def code_america_indiana_vevay?
        Boolean.new(current_time_zone_names.include?("America/Indiana/Vevay"))
      end

      def code_america_indiana_vincennes?
        Boolean.new(
          current_time_zone_names.include?("America/Indiana/Vincennes")
        )
      end

      def code_america_indiana_winamac?
        Boolean.new(current_time_zone_names.include?("America/Indiana/Winamac"))
      end

      def code_america_indianapolis?
        Boolean.new(current_time_zone_names.include?("America/Indianapolis"))
      end

      def code_america_inuvik?
        Boolean.new(current_time_zone_names.include?("America/Inuvik"))
      end

      def code_america_iqaluit?
        Boolean.new(current_time_zone_names.include?("America/Iqaluit"))
      end

      def code_america_jamaica?
        Boolean.new(current_time_zone_names.include?("America/Jamaica"))
      end

      def code_america_jujuy?
        Boolean.new(current_time_zone_names.include?("America/Jujuy"))
      end

      def code_america_juneau?
        Boolean.new(current_time_zone_names.include?("America/Juneau"))
      end

      def code_america_kentucky_louisville?
        Boolean.new(
          current_time_zone_names.include?("America/Kentucky/Louisville")
        )
      end

      def code_america_kentucky_monticello?
        Boolean.new(
          current_time_zone_names.include?("America/Kentucky/Monticello")
        )
      end

      def code_america_knox_in?
        Boolean.new(current_time_zone_names.include?("America/Knox_IN"))
      end

      def code_america_kralendijk?
        Boolean.new(current_time_zone_names.include?("America/Kralendijk"))
      end

      def code_america_la_paz?
        Boolean.new(current_time_zone_names.include?("America/La_Paz"))
      end

      def code_america_lima?
        Boolean.new(current_time_zone_names.include?("America/Lima"))
      end

      def code_america_los_angeles?
        Boolean.new(current_time_zone_names.include?("America/Los_Angeles"))
      end

      def code_america_louisville?
        Boolean.new(current_time_zone_names.include?("America/Louisville"))
      end

      def code_america_lower_princes?
        Boolean.new(current_time_zone_names.include?("America/Lower_Princes"))
      end

      def code_america_maceio?
        Boolean.new(current_time_zone_names.include?("America/Maceio"))
      end

      def code_america_managua?
        Boolean.new(current_time_zone_names.include?("America/Managua"))
      end

      def code_america_manaus?
        Boolean.new(current_time_zone_names.include?("America/Manaus"))
      end

      def code_america_marigot?
        Boolean.new(current_time_zone_names.include?("America/Marigot"))
      end

      def code_america_martinique?
        Boolean.new(current_time_zone_names.include?("America/Martinique"))
      end

      def code_america_matamoros?
        Boolean.new(current_time_zone_names.include?("America/Matamoros"))
      end

      def code_america_mazatlan?
        Boolean.new(current_time_zone_names.include?("America/Mazatlan"))
      end

      def code_america_mendoza?
        Boolean.new(current_time_zone_names.include?("America/Mendoza"))
      end

      def code_america_menominee?
        Boolean.new(current_time_zone_names.include?("America/Menominee"))
      end

      def code_america_merida?
        Boolean.new(current_time_zone_names.include?("America/Merida"))
      end

      def code_america_metlakatla?
        Boolean.new(current_time_zone_names.include?("America/Metlakatla"))
      end

      def code_america_mexico_city?
        Boolean.new(current_time_zone_names.include?("America/Mexico_City"))
      end

      def code_america_miquelon?
        Boolean.new(current_time_zone_names.include?("America/Miquelon"))
      end

      def code_america_moncton?
        Boolean.new(current_time_zone_names.include?("America/Moncton"))
      end

      def code_america_monterrey?
        Boolean.new(current_time_zone_names.include?("America/Monterrey"))
      end

      def code_america_montevideo?
        Boolean.new(current_time_zone_names.include?("America/Montevideo"))
      end

      def code_america_montreal?
        Boolean.new(current_time_zone_names.include?("America/Montreal"))
      end

      def code_america_montserrat?
        Boolean.new(current_time_zone_names.include?("America/Montserrat"))
      end

      def code_america_nassau?
        Boolean.new(current_time_zone_names.include?("America/Nassau"))
      end

      def code_america_new_york?
        Boolean.new(current_time_zone_names.include?("America/New_York"))
      end

      def code_america_nipigon?
        Boolean.new(current_time_zone_names.include?("America/Nipigon"))
      end

      def code_america_nome?
        Boolean.new(current_time_zone_names.include?("America/Nome"))
      end

      def code_america_noronha?
        Boolean.new(current_time_zone_names.include?("America/Noronha"))
      end

      def code_america_north_dakota_beulah?
        Boolean.new(
          current_time_zone_names.include?("America/North_Dakota/Beulah")
        )
      end

      def code_america_north_dakota_center?
        Boolean.new(
          current_time_zone_names.include?("America/North_Dakota/Center")
        )
      end

      def code_america_north_dakota_new_salem?
        Boolean.new(
          current_time_zone_names.include?("America/North_Dakota/New_Salem")
        )
      end

      def code_america_nuuk?
        Boolean.new(current_time_zone_names.include?("America/Nuuk"))
      end

      def code_america_ojinaga?
        Boolean.new(current_time_zone_names.include?("America/Ojinaga"))
      end

      def code_america_panama?
        Boolean.new(current_time_zone_names.include?("America/Panama"))
      end

      def code_america_pangnirtung?
        Boolean.new(current_time_zone_names.include?("America/Pangnirtung"))
      end

      def code_america_paramaribo?
        Boolean.new(current_time_zone_names.include?("America/Paramaribo"))
      end

      def code_america_phoenix?
        Boolean.new(current_time_zone_names.include?("America/Phoenix"))
      end

      def code_america_port_minus_au_minus_prince?
        Boolean.new(current_time_zone_names.include?("America/Port-au-Prince"))
      end

      def code_america_port_of_spain?
        Boolean.new(current_time_zone_names.include?("America/Port_of_Spain"))
      end

      def code_america_porto_acre?
        Boolean.new(current_time_zone_names.include?("America/Porto_Acre"))
      end

      def code_america_porto_velho?
        Boolean.new(current_time_zone_names.include?("America/Porto_Velho"))
      end

      def code_america_puerto_rico?
        Boolean.new(current_time_zone_names.include?("America/Puerto_Rico"))
      end

      def code_america_punta_arenas?
        Boolean.new(current_time_zone_names.include?("America/Punta_Arenas"))
      end

      def code_america_rainy_river?
        Boolean.new(current_time_zone_names.include?("America/Rainy_River"))
      end

      def code_america_rankin_inlet?
        Boolean.new(current_time_zone_names.include?("America/Rankin_Inlet"))
      end

      def code_america_recife?
        Boolean.new(current_time_zone_names.include?("America/Recife"))
      end

      def code_america_regina?
        Boolean.new(current_time_zone_names.include?("America/Regina"))
      end

      def code_america_resolute?
        Boolean.new(current_time_zone_names.include?("America/Resolute"))
      end

      def code_america_rio_branco?
        Boolean.new(current_time_zone_names.include?("America/Rio_Branco"))
      end

      def code_america_rosario?
        Boolean.new(current_time_zone_names.include?("America/Rosario"))
      end

      def code_america_santa_isabel?
        Boolean.new(current_time_zone_names.include?("America/Santa_Isabel"))
      end

      def code_america_santarem?
        Boolean.new(current_time_zone_names.include?("America/Santarem"))
      end

      def code_america_santiago?
        Boolean.new(current_time_zone_names.include?("America/Santiago"))
      end

      def code_america_santo_domingo?
        Boolean.new(current_time_zone_names.include?("America/Santo_Domingo"))
      end

      def code_america_sao_paulo?
        Boolean.new(current_time_zone_names.include?("America/Sao_Paulo"))
      end

      def code_america_scoresbysund?
        Boolean.new(current_time_zone_names.include?("America/Scoresbysund"))
      end

      def code_america_shiprock?
        Boolean.new(current_time_zone_names.include?("America/Shiprock"))
      end

      def code_america_sitka?
        Boolean.new(current_time_zone_names.include?("America/Sitka"))
      end

      def code_america_st_barthelemy?
        Boolean.new(current_time_zone_names.include?("America/St_Barthelemy"))
      end

      def code_america_st_johns?
        Boolean.new(current_time_zone_names.include?("America/St_Johns"))
      end

      def code_america_st_kitts?
        Boolean.new(current_time_zone_names.include?("America/St_Kitts"))
      end

      def code_america_st_lucia?
        Boolean.new(current_time_zone_names.include?("America/St_Lucia"))
      end

      def code_america_st_thomas?
        Boolean.new(current_time_zone_names.include?("America/St_Thomas"))
      end

      def code_america_st_vincent?
        Boolean.new(current_time_zone_names.include?("America/St_Vincent"))
      end

      def code_america_swift_current?
        Boolean.new(current_time_zone_names.include?("America/Swift_Current"))
      end

      def code_america_tegucigalpa?
        Boolean.new(current_time_zone_names.include?("America/Tegucigalpa"))
      end

      def code_america_thule?
        Boolean.new(current_time_zone_names.include?("America/Thule"))
      end

      def code_america_thunder_bay?
        Boolean.new(current_time_zone_names.include?("America/Thunder_Bay"))
      end

      def code_america_tijuana?
        Boolean.new(current_time_zone_names.include?("America/Tijuana"))
      end

      def code_america_toronto?
        Boolean.new(current_time_zone_names.include?("America/Toronto"))
      end

      def code_america_tortola?
        Boolean.new(current_time_zone_names.include?("America/Tortola"))
      end

      def code_america_vancouver?
        Boolean.new(current_time_zone_names.include?("America/Vancouver"))
      end

      def code_america_virgin?
        Boolean.new(current_time_zone_names.include?("America/Virgin"))
      end

      def code_america_whitehorse?
        Boolean.new(current_time_zone_names.include?("America/Whitehorse"))
      end

      def code_america_winnipeg?
        Boolean.new(current_time_zone_names.include?("America/Winnipeg"))
      end

      def code_america_yakutat?
        Boolean.new(current_time_zone_names.include?("America/Yakutat"))
      end

      def code_america_yellowknife?
        Boolean.new(current_time_zone_names.include?("America/Yellowknife"))
      end

      def code_antarctica_casey?
        Boolean.new(current_time_zone_names.include?("Antarctica/Casey"))
      end

      def code_antarctica_davis?
        Boolean.new(current_time_zone_names.include?("Antarctica/Davis"))
      end

      def code_antarctica_dumontdurville?
        Boolean.new(
          current_time_zone_names.include?("Antarctica/DumontDUrville")
        )
      end

      def code_antarctica_macquarie?
        Boolean.new(current_time_zone_names.include?("Antarctica/Macquarie"))
      end

      def code_antarctica_mawson?
        Boolean.new(current_time_zone_names.include?("Antarctica/Mawson"))
      end

      def code_antarctica_mcmurdo?
        Boolean.new(current_time_zone_names.include?("Antarctica/McMurdo"))
      end

      def code_antarctica_palmer?
        Boolean.new(current_time_zone_names.include?("Antarctica/Palmer"))
      end

      def code_antarctica_rothera?
        Boolean.new(current_time_zone_names.include?("Antarctica/Rothera"))
      end

      def code_antarctica_south_pole?
        Boolean.new(current_time_zone_names.include?("Antarctica/South_Pole"))
      end

      def code_antarctica_syowa?
        Boolean.new(current_time_zone_names.include?("Antarctica/Syowa"))
      end

      def code_antarctica_troll?
        Boolean.new(current_time_zone_names.include?("Antarctica/Troll"))
      end

      def code_antarctica_vostok?
        Boolean.new(current_time_zone_names.include?("Antarctica/Vostok"))
      end

      def code_arctic_longyearbyen?
        Boolean.new(current_time_zone_names.include?("Arctic/Longyearbyen"))
      end

      def code_asia_aden?
        Boolean.new(current_time_zone_names.include?("Asia/Aden"))
      end

      def code_asia_almaty?
        Boolean.new(current_time_zone_names.include?("Asia/Almaty"))
      end

      def code_asia_amman?
        Boolean.new(current_time_zone_names.include?("Asia/Amman"))
      end

      def code_asia_anadyr?
        Boolean.new(current_time_zone_names.include?("Asia/Anadyr"))
      end

      def code_asia_aqtau?
        Boolean.new(current_time_zone_names.include?("Asia/Aqtau"))
      end

      def code_asia_aqtobe?
        Boolean.new(current_time_zone_names.include?("Asia/Aqtobe"))
      end

      def code_asia_ashgabat?
        Boolean.new(current_time_zone_names.include?("Asia/Ashgabat"))
      end

      def code_asia_ashkhabad?
        Boolean.new(current_time_zone_names.include?("Asia/Ashkhabad"))
      end

      def code_asia_atyrau?
        Boolean.new(current_time_zone_names.include?("Asia/Atyrau"))
      end

      def code_asia_baghdad?
        Boolean.new(current_time_zone_names.include?("Asia/Baghdad"))
      end

      def code_asia_bahrain?
        Boolean.new(current_time_zone_names.include?("Asia/Bahrain"))
      end

      def code_asia_baku?
        Boolean.new(current_time_zone_names.include?("Asia/Baku"))
      end

      def code_asia_bangkok?
        Boolean.new(current_time_zone_names.include?("Asia/Bangkok"))
      end

      def code_asia_barnaul?
        Boolean.new(current_time_zone_names.include?("Asia/Barnaul"))
      end

      def code_asia_beirut?
        Boolean.new(current_time_zone_names.include?("Asia/Beirut"))
      end

      def code_asia_bishkek?
        Boolean.new(current_time_zone_names.include?("Asia/Bishkek"))
      end

      def code_asia_brunei?
        Boolean.new(current_time_zone_names.include?("Asia/Brunei"))
      end

      def code_asia_calcutta?
        Boolean.new(current_time_zone_names.include?("Asia/Calcutta"))
      end

      def code_asia_chita?
        Boolean.new(current_time_zone_names.include?("Asia/Chita"))
      end

      def code_asia_choibalsan?
        Boolean.new(current_time_zone_names.include?("Asia/Choibalsan"))
      end

      def code_asia_chongqing?
        Boolean.new(current_time_zone_names.include?("Asia/Chongqing"))
      end

      def code_asia_chungking?
        Boolean.new(current_time_zone_names.include?("Asia/Chungking"))
      end

      def code_asia_colombo?
        Boolean.new(current_time_zone_names.include?("Asia/Colombo"))
      end

      def code_asia_dacca?
        Boolean.new(current_time_zone_names.include?("Asia/Dacca"))
      end

      def code_asia_damascus?
        Boolean.new(current_time_zone_names.include?("Asia/Damascus"))
      end

      def code_asia_dhaka?
        Boolean.new(current_time_zone_names.include?("Asia/Dhaka"))
      end

      def code_asia_dili?
        Boolean.new(current_time_zone_names.include?("Asia/Dili"))
      end

      def code_asia_dubai?
        Boolean.new(current_time_zone_names.include?("Asia/Dubai"))
      end

      def code_asia_dushanbe?
        Boolean.new(current_time_zone_names.include?("Asia/Dushanbe"))
      end

      def code_asia_famagusta?
        Boolean.new(current_time_zone_names.include?("Asia/Famagusta"))
      end

      def code_asia_gaza?
        Boolean.new(current_time_zone_names.include?("Asia/Gaza"))
      end

      def code_asia_harbin?
        Boolean.new(current_time_zone_names.include?("Asia/Harbin"))
      end

      def code_asia_hebron?
        Boolean.new(current_time_zone_names.include?("Asia/Hebron"))
      end

      def code_asia_ho_chi_minh?
        Boolean.new(current_time_zone_names.include?("Asia/Ho_Chi_Minh"))
      end

      def code_asia_hong_kong?
        Boolean.new(current_time_zone_names.include?("Asia/Hong_Kong"))
      end

      def code_asia_hovd?
        Boolean.new(current_time_zone_names.include?("Asia/Hovd"))
      end

      def code_asia_irkutsk?
        Boolean.new(current_time_zone_names.include?("Asia/Irkutsk"))
      end

      def code_asia_istanbul?
        Boolean.new(current_time_zone_names.include?("Asia/Istanbul"))
      end

      def code_asia_jakarta?
        Boolean.new(current_time_zone_names.include?("Asia/Jakarta"))
      end

      def code_asia_jayapura?
        Boolean.new(current_time_zone_names.include?("Asia/Jayapura"))
      end

      def code_asia_jerusalem?
        Boolean.new(current_time_zone_names.include?("Asia/Jerusalem"))
      end

      def code_asia_kabul?
        Boolean.new(current_time_zone_names.include?("Asia/Kabul"))
      end

      def code_asia_kamchatka?
        Boolean.new(current_time_zone_names.include?("Asia/Kamchatka"))
      end

      def code_asia_karachi?
        Boolean.new(current_time_zone_names.include?("Asia/Karachi"))
      end

      def code_asia_kashgar?
        Boolean.new(current_time_zone_names.include?("Asia/Kashgar"))
      end

      def code_asia_kathmandu?
        Boolean.new(current_time_zone_names.include?("Asia/Kathmandu"))
      end

      def code_asia_katmandu?
        Boolean.new(current_time_zone_names.include?("Asia/Katmandu"))
      end

      def code_asia_khandyga?
        Boolean.new(current_time_zone_names.include?("Asia/Khandyga"))
      end

      def code_asia_kolkata?
        Boolean.new(current_time_zone_names.include?("Asia/Kolkata"))
      end

      def code_asia_krasnoyarsk?
        Boolean.new(current_time_zone_names.include?("Asia/Krasnoyarsk"))
      end

      def code_asia_kuala_lumpur?
        Boolean.new(current_time_zone_names.include?("Asia/Kuala_Lumpur"))
      end

      def code_asia_kuching?
        Boolean.new(current_time_zone_names.include?("Asia/Kuching"))
      end

      def code_asia_kuwait?
        Boolean.new(current_time_zone_names.include?("Asia/Kuwait"))
      end

      def code_asia_macao?
        Boolean.new(current_time_zone_names.include?("Asia/Macao"))
      end

      def code_asia_macau?
        Boolean.new(current_time_zone_names.include?("Asia/Macau"))
      end

      def code_asia_magadan?
        Boolean.new(current_time_zone_names.include?("Asia/Magadan"))
      end

      def code_asia_makassar?
        Boolean.new(current_time_zone_names.include?("Asia/Makassar"))
      end

      def code_asia_manila?
        Boolean.new(current_time_zone_names.include?("Asia/Manila"))
      end

      def code_asia_muscat?
        Boolean.new(current_time_zone_names.include?("Asia/Muscat"))
      end

      def code_asia_nicosia?
        Boolean.new(current_time_zone_names.include?("Asia/Nicosia"))
      end

      def code_asia_novokuznetsk?
        Boolean.new(current_time_zone_names.include?("Asia/Novokuznetsk"))
      end

      def code_asia_novosibirsk?
        Boolean.new(current_time_zone_names.include?("Asia/Novosibirsk"))
      end

      def code_asia_omsk?
        Boolean.new(current_time_zone_names.include?("Asia/Omsk"))
      end

      def code_asia_oral?
        Boolean.new(current_time_zone_names.include?("Asia/Oral"))
      end

      def code_asia_phnom_penh?
        Boolean.new(current_time_zone_names.include?("Asia/Phnom_Penh"))
      end

      def code_asia_pontianak?
        Boolean.new(current_time_zone_names.include?("Asia/Pontianak"))
      end

      def code_asia_pyongyang?
        Boolean.new(current_time_zone_names.include?("Asia/Pyongyang"))
      end

      def code_asia_qatar?
        Boolean.new(current_time_zone_names.include?("Asia/Qatar"))
      end

      def code_asia_qostanay?
        Boolean.new(current_time_zone_names.include?("Asia/Qostanay"))
      end

      def code_asia_qyzylorda?
        Boolean.new(current_time_zone_names.include?("Asia/Qyzylorda"))
      end

      def code_asia_rangoon?
        Boolean.new(current_time_zone_names.include?("Asia/Rangoon"))
      end

      def code_asia_riyadh?
        Boolean.new(current_time_zone_names.include?("Asia/Riyadh"))
      end

      def code_asia_saigon?
        Boolean.new(current_time_zone_names.include?("Asia/Saigon"))
      end

      def code_asia_sakhalin?
        Boolean.new(current_time_zone_names.include?("Asia/Sakhalin"))
      end

      def code_asia_samarkand?
        Boolean.new(current_time_zone_names.include?("Asia/Samarkand"))
      end

      def code_asia_seoul?
        Boolean.new(current_time_zone_names.include?("Asia/Seoul"))
      end

      def code_asia_shanghai?
        Boolean.new(current_time_zone_names.include?("Asia/Shanghai"))
      end

      def code_asia_singapore?
        Boolean.new(current_time_zone_names.include?("Asia/Singapore"))
      end

      def code_asia_srednekolymsk?
        Boolean.new(current_time_zone_names.include?("Asia/Srednekolymsk"))
      end

      def code_asia_taipei?
        Boolean.new(current_time_zone_names.include?("Asia/Taipei"))
      end

      def code_asia_tashkent?
        Boolean.new(current_time_zone_names.include?("Asia/Tashkent"))
      end

      def code_asia_tbilisi?
        Boolean.new(current_time_zone_names.include?("Asia/Tbilisi"))
      end

      def code_asia_tehran?
        Boolean.new(current_time_zone_names.include?("Asia/Tehran"))
      end

      def code_asia_tel_aviv?
        Boolean.new(current_time_zone_names.include?("Asia/Tel_Aviv"))
      end

      def code_asia_thimbu?
        Boolean.new(current_time_zone_names.include?("Asia/Thimbu"))
      end

      def code_asia_thimphu?
        Boolean.new(current_time_zone_names.include?("Asia/Thimphu"))
      end

      def code_asia_tokyo?
        Boolean.new(current_time_zone_names.include?("Asia/Tokyo"))
      end

      def code_asia_tomsk?
        Boolean.new(current_time_zone_names.include?("Asia/Tomsk"))
      end

      def code_asia_ujung_pandang?
        Boolean.new(current_time_zone_names.include?("Asia/Ujung_Pandang"))
      end

      def code_asia_ulaanbaatar?
        Boolean.new(current_time_zone_names.include?("Asia/Ulaanbaatar"))
      end

      def code_asia_ulan_bator?
        Boolean.new(current_time_zone_names.include?("Asia/Ulan_Bator"))
      end

      def code_asia_urumqi?
        Boolean.new(current_time_zone_names.include?("Asia/Urumqi"))
      end

      def code_asia_ust_minus_nera?
        Boolean.new(current_time_zone_names.include?("Asia/Ust-Nera"))
      end

      def code_asia_vientiane?
        Boolean.new(current_time_zone_names.include?("Asia/Vientiane"))
      end

      def code_asia_vladivostok?
        Boolean.new(current_time_zone_names.include?("Asia/Vladivostok"))
      end

      def code_asia_yakutsk?
        Boolean.new(current_time_zone_names.include?("Asia/Yakutsk"))
      end

      def code_asia_yangon?
        Boolean.new(current_time_zone_names.include?("Asia/Yangon"))
      end

      def code_asia_yekaterinburg?
        Boolean.new(current_time_zone_names.include?("Asia/Yekaterinburg"))
      end

      def code_asia_yerevan?
        Boolean.new(current_time_zone_names.include?("Asia/Yerevan"))
      end

      def code_atlantic_azores?
        Boolean.new(current_time_zone_names.include?("Atlantic/Azores"))
      end

      def code_atlantic_bermuda?
        Boolean.new(current_time_zone_names.include?("Atlantic/Bermuda"))
      end

      def code_atlantic_canary?
        Boolean.new(current_time_zone_names.include?("Atlantic/Canary"))
      end

      def code_atlantic_cape_verde?
        Boolean.new(current_time_zone_names.include?("Atlantic/Cape_Verde"))
      end

      def code_atlantic_faeroe?
        Boolean.new(current_time_zone_names.include?("Atlantic/Faeroe"))
      end

      def code_atlantic_faroe?
        Boolean.new(current_time_zone_names.include?("Atlantic/Faroe"))
      end

      def code_atlantic_jan_mayen?
        Boolean.new(current_time_zone_names.include?("Atlantic/Jan_Mayen"))
      end

      def code_atlantic_madeira?
        Boolean.new(current_time_zone_names.include?("Atlantic/Madeira"))
      end

      def code_atlantic_reykjavik?
        Boolean.new(current_time_zone_names.include?("Atlantic/Reykjavik"))
      end

      def code_atlantic_south_georgia?
        Boolean.new(current_time_zone_names.include?("Atlantic/South_Georgia"))
      end

      def code_atlantic_st_helena?
        Boolean.new(current_time_zone_names.include?("Atlantic/St_Helena"))
      end

      def code_atlantic_stanley?
        Boolean.new(current_time_zone_names.include?("Atlantic/Stanley"))
      end

      def code_australia_act?
        Boolean.new(current_time_zone_names.include?("Australia/ACT"))
      end

      def code_australia_adelaide?
        Boolean.new(current_time_zone_names.include?("Australia/Adelaide"))
      end

      def code_australia_brisbane?
        Boolean.new(current_time_zone_names.include?("Australia/Brisbane"))
      end

      def code_australia_broken_hill?
        Boolean.new(current_time_zone_names.include?("Australia/Broken_Hill"))
      end

      def code_australia_canberra?
        Boolean.new(current_time_zone_names.include?("Australia/Canberra"))
      end

      def code_australia_currie?
        Boolean.new(current_time_zone_names.include?("Australia/Currie"))
      end

      def code_australia_darwin?
        Boolean.new(current_time_zone_names.include?("Australia/Darwin"))
      end

      def code_australia_eucla?
        Boolean.new(current_time_zone_names.include?("Australia/Eucla"))
      end

      def code_australia_hobart?
        Boolean.new(current_time_zone_names.include?("Australia/Hobart"))
      end

      def code_australia_lhi?
        Boolean.new(current_time_zone_names.include?("Australia/LHI"))
      end

      def code_australia_lindeman?
        Boolean.new(current_time_zone_names.include?("Australia/Lindeman"))
      end

      def code_australia_lord_howe?
        Boolean.new(current_time_zone_names.include?("Australia/Lord_Howe"))
      end

      def code_australia_melbourne?
        Boolean.new(current_time_zone_names.include?("Australia/Melbourne"))
      end

      def code_australia_nsw?
        Boolean.new(current_time_zone_names.include?("Australia/NSW"))
      end

      def code_australia_north?
        Boolean.new(current_time_zone_names.include?("Australia/North"))
      end

      def code_australia_perth?
        Boolean.new(current_time_zone_names.include?("Australia/Perth"))
      end

      def code_australia_queensland?
        Boolean.new(current_time_zone_names.include?("Australia/Queensland"))
      end

      def code_australia_south?
        Boolean.new(current_time_zone_names.include?("Australia/South"))
      end

      def code_australia_sydney?
        Boolean.new(current_time_zone_names.include?("Australia/Sydney"))
      end

      def code_australia_tasmania?
        Boolean.new(current_time_zone_names.include?("Australia/Tasmania"))
      end

      def code_australia_victoria?
        Boolean.new(current_time_zone_names.include?("Australia/Victoria"))
      end

      def code_australia_west?
        Boolean.new(current_time_zone_names.include?("Australia/West"))
      end

      def code_australia_yancowinna?
        Boolean.new(current_time_zone_names.include?("Australia/Yancowinna"))
      end

      def code_brazil_acre?
        Boolean.new(current_time_zone_names.include?("Brazil/Acre"))
      end

      def code_brazil_denoronha?
        Boolean.new(current_time_zone_names.include?("Brazil/DeNoronha"))
      end

      def code_brazil_east?
        Boolean.new(current_time_zone_names.include?("Brazil/East"))
      end

      def code_brazil_west?
        Boolean.new(current_time_zone_names.include?("Brazil/West"))
      end

      def code_cet?
        Boolean.new(current_time_zone_names.include?("CET"))
      end

      def code_cst6cdt?
        Boolean.new(current_time_zone_names.include?("CST6CDT"))
      end

      def code_canada_atlantic?
        Boolean.new(current_time_zone_names.include?("Canada/Atlantic"))
      end

      def code_canada_central?
        Boolean.new(current_time_zone_names.include?("Canada/Central"))
      end

      def code_canada_eastern?
        Boolean.new(current_time_zone_names.include?("Canada/Eastern"))
      end

      def code_canada_mountain?
        Boolean.new(current_time_zone_names.include?("Canada/Mountain"))
      end

      def code_canada_newfoundland?
        Boolean.new(current_time_zone_names.include?("Canada/Newfoundland"))
      end

      def code_canada_pacific?
        Boolean.new(current_time_zone_names.include?("Canada/Pacific"))
      end

      def code_canada_saskatchewan?
        Boolean.new(current_time_zone_names.include?("Canada/Saskatchewan"))
      end

      def code_canada_yukon?
        Boolean.new(current_time_zone_names.include?("Canada/Yukon"))
      end

      def code_chile_continental?
        Boolean.new(current_time_zone_names.include?("Chile/Continental"))
      end

      def code_chile_easterisland?
        Boolean.new(current_time_zone_names.include?("Chile/EasterIsland"))
      end

      def code_cuba?
        Boolean.new(current_time_zone_names.include?("Cuba"))
      end

      def code_eet?
        Boolean.new(current_time_zone_names.include?("EET"))
      end

      def code_est?
        Boolean.new(current_time_zone_names.include?("EST"))
      end

      def code_est5edt?
        Boolean.new(current_time_zone_names.include?("EST5EDT"))
      end

      def code_egypt?
        Boolean.new(current_time_zone_names.include?("Egypt"))
      end

      def code_eire?
        Boolean.new(current_time_zone_names.include?("Eire"))
      end

      def code_etc_gmt?
        Boolean.new(current_time_zone_names.include?("Etc/GMT"))
      end

      def code_etc_gmt_plus_0?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+0"))
      end

      def code_etc_gmt_plus_1?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+1"))
      end

      def code_etc_gmt_plus_10?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+10"))
      end

      def code_etc_gmt_plus_11?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+11"))
      end

      def code_etc_gmt_plus_12?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+12"))
      end

      def code_etc_gmt_plus_2?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+2"))
      end

      def code_etc_gmt_plus_3?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+3"))
      end

      def code_etc_gmt_plus_4?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+4"))
      end

      def code_etc_gmt_plus_5?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+5"))
      end

      def code_etc_gmt_plus_6?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+6"))
      end

      def code_etc_gmt_plus_7?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+7"))
      end

      def code_etc_gmt_plus_8?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+8"))
      end

      def code_etc_gmt_plus_9?
        Boolean.new(current_time_zone_names.include?("Etc/GMT+9"))
      end

      def code_etc_gmt_minus_0?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-0"))
      end

      def code_etc_gmt_minus_1?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-1"))
      end

      def code_etc_gmt_minus_10?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-10"))
      end

      def code_etc_gmt_minus_11?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-11"))
      end

      def code_etc_gmt_minus_12?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-12"))
      end

      def code_etc_gmt_minus_13?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-13"))
      end

      def code_etc_gmt_minus_14?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-14"))
      end

      def code_etc_gmt_minus_2?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-2"))
      end

      def code_etc_gmt_minus_3?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-3"))
      end

      def code_etc_gmt_minus_4?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-4"))
      end

      def code_etc_gmt_minus_5?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-5"))
      end

      def code_etc_gmt_minus_6?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-6"))
      end

      def code_etc_gmt_minus_7?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-7"))
      end

      def code_etc_gmt_minus_8?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-8"))
      end

      def code_etc_gmt_minus_9?
        Boolean.new(current_time_zone_names.include?("Etc/GMT-9"))
      end

      def code_etc_gmt0?
        Boolean.new(current_time_zone_names.include?("Etc/GMT0"))
      end

      def code_etc_greenwich?
        Boolean.new(current_time_zone_names.include?("Etc/Greenwich"))
      end

      def code_etc_uct?
        Boolean.new(current_time_zone_names.include?("Etc/UCT"))
      end

      def code_etc_utc?
        Boolean.new(current_time_zone_names.include?("Etc/UTC"))
      end

      def code_etc_universal?
        Boolean.new(current_time_zone_names.include?("Etc/Universal"))
      end

      def code_etc_zulu?
        Boolean.new(current_time_zone_names.include?("Etc/Zulu"))
      end

      def code_europe_amsterdam?
        Boolean.new(current_time_zone_names.include?("Europe/Amsterdam"))
      end

      def code_europe_andorra?
        Boolean.new(current_time_zone_names.include?("Europe/Andorra"))
      end

      def code_europe_astrakhan?
        Boolean.new(current_time_zone_names.include?("Europe/Astrakhan"))
      end

      def code_europe_athens?
        Boolean.new(current_time_zone_names.include?("Europe/Athens"))
      end

      def code_europe_belfast?
        Boolean.new(current_time_zone_names.include?("Europe/Belfast"))
      end

      def code_europe_belgrade?
        Boolean.new(current_time_zone_names.include?("Europe/Belgrade"))
      end

      def code_europe_berlin?
        Boolean.new(current_time_zone_names.include?("Europe/Berlin"))
      end

      def code_europe_bratislava?
        Boolean.new(current_time_zone_names.include?("Europe/Bratislava"))
      end

      def code_europe_brussels?
        Boolean.new(current_time_zone_names.include?("Europe/Brussels"))
      end

      def code_europe_bucharest?
        Boolean.new(current_time_zone_names.include?("Europe/Bucharest"))
      end

      def code_europe_budapest?
        Boolean.new(current_time_zone_names.include?("Europe/Budapest"))
      end

      def code_europe_busingen?
        Boolean.new(current_time_zone_names.include?("Europe/Busingen"))
      end

      def code_europe_chisinau?
        Boolean.new(current_time_zone_names.include?("Europe/Chisinau"))
      end

      def code_europe_copenhagen?
        Boolean.new(current_time_zone_names.include?("Europe/Copenhagen"))
      end

      def code_europe_dublin?
        Boolean.new(current_time_zone_names.include?("Europe/Dublin"))
      end

      def code_europe_gibraltar?
        Boolean.new(current_time_zone_names.include?("Europe/Gibraltar"))
      end

      def code_europe_guernsey?
        Boolean.new(current_time_zone_names.include?("Europe/Guernsey"))
      end

      def code_europe_helsinki?
        Boolean.new(current_time_zone_names.include?("Europe/Helsinki"))
      end

      def code_europe_isle_of_man?
        Boolean.new(current_time_zone_names.include?("Europe/Isle_of_Man"))
      end

      def code_europe_istanbul?
        Boolean.new(current_time_zone_names.include?("Europe/Istanbul"))
      end

      def code_europe_jersey?
        Boolean.new(current_time_zone_names.include?("Europe/Jersey"))
      end

      def code_europe_kaliningrad?
        Boolean.new(current_time_zone_names.include?("Europe/Kaliningrad"))
      end

      def code_europe_kiev?
        Boolean.new(current_time_zone_names.include?("Europe/Kiev"))
      end

      def code_europe_kirov?
        Boolean.new(current_time_zone_names.include?("Europe/Kirov"))
      end

      def code_europe_kyiv?
        Boolean.new(current_time_zone_names.include?("Europe/Kyiv"))
      end

      def code_europe_lisbon?
        Boolean.new(current_time_zone_names.include?("Europe/Lisbon"))
      end

      def code_europe_ljubljana?
        Boolean.new(current_time_zone_names.include?("Europe/Ljubljana"))
      end

      def code_europe_london?
        Boolean.new(current_time_zone_names.include?("Europe/London"))
      end

      def code_europe_luxembourg?
        Boolean.new(current_time_zone_names.include?("Europe/Luxembourg"))
      end

      def code_europe_madrid?
        Boolean.new(current_time_zone_names.include?("Europe/Madrid"))
      end

      def code_europe_malta?
        Boolean.new(current_time_zone_names.include?("Europe/Malta"))
      end

      def code_europe_mariehamn?
        Boolean.new(current_time_zone_names.include?("Europe/Mariehamn"))
      end

      def code_europe_minsk?
        Boolean.new(current_time_zone_names.include?("Europe/Minsk"))
      end

      def code_europe_monaco?
        Boolean.new(current_time_zone_names.include?("Europe/Monaco"))
      end

      def code_europe_moscow?
        Boolean.new(current_time_zone_names.include?("Europe/Moscow"))
      end

      def code_europe_nicosia?
        Boolean.new(current_time_zone_names.include?("Europe/Nicosia"))
      end

      def code_europe_oslo?
        Boolean.new(current_time_zone_names.include?("Europe/Oslo"))
      end

      def code_europe_paris?
        Boolean.new(current_time_zone_names.include?("Europe/Paris"))
      end

      def code_europe_podgorica?
        Boolean.new(current_time_zone_names.include?("Europe/Podgorica"))
      end

      def code_europe_prague?
        Boolean.new(current_time_zone_names.include?("Europe/Prague"))
      end

      def code_europe_riga?
        Boolean.new(current_time_zone_names.include?("Europe/Riga"))
      end

      def code_europe_rome?
        Boolean.new(current_time_zone_names.include?("Europe/Rome"))
      end

      def code_europe_samara?
        Boolean.new(current_time_zone_names.include?("Europe/Samara"))
      end

      def code_europe_san_marino?
        Boolean.new(current_time_zone_names.include?("Europe/San_Marino"))
      end

      def code_europe_sarajevo?
        Boolean.new(current_time_zone_names.include?("Europe/Sarajevo"))
      end

      def code_europe_saratov?
        Boolean.new(current_time_zone_names.include?("Europe/Saratov"))
      end

      def code_europe_simferopol?
        Boolean.new(current_time_zone_names.include?("Europe/Simferopol"))
      end

      def code_europe_skopje?
        Boolean.new(current_time_zone_names.include?("Europe/Skopje"))
      end

      def code_europe_sofia?
        Boolean.new(current_time_zone_names.include?("Europe/Sofia"))
      end

      def code_europe_stockholm?
        Boolean.new(current_time_zone_names.include?("Europe/Stockholm"))
      end

      def code_europe_tallinn?
        Boolean.new(current_time_zone_names.include?("Europe/Tallinn"))
      end

      def code_europe_tirane?
        Boolean.new(current_time_zone_names.include?("Europe/Tirane"))
      end

      def code_europe_tiraspol?
        Boolean.new(current_time_zone_names.include?("Europe/Tiraspol"))
      end

      def code_europe_ulyanovsk?
        Boolean.new(current_time_zone_names.include?("Europe/Ulyanovsk"))
      end

      def code_europe_uzhgorod?
        Boolean.new(current_time_zone_names.include?("Europe/Uzhgorod"))
      end

      def code_europe_vaduz?
        Boolean.new(current_time_zone_names.include?("Europe/Vaduz"))
      end

      def code_europe_vatican?
        Boolean.new(current_time_zone_names.include?("Europe/Vatican"))
      end

      def code_europe_vienna?
        Boolean.new(current_time_zone_names.include?("Europe/Vienna"))
      end

      def code_europe_vilnius?
        Boolean.new(current_time_zone_names.include?("Europe/Vilnius"))
      end

      def code_europe_volgograd?
        Boolean.new(current_time_zone_names.include?("Europe/Volgograd"))
      end

      def code_europe_warsaw?
        Boolean.new(current_time_zone_names.include?("Europe/Warsaw"))
      end

      def code_europe_zagreb?
        Boolean.new(current_time_zone_names.include?("Europe/Zagreb"))
      end

      def code_europe_zaporozhye?
        Boolean.new(current_time_zone_names.include?("Europe/Zaporozhye"))
      end

      def code_europe_zurich?
        Boolean.new(current_time_zone_names.include?("Europe/Zurich"))
      end

      def code_factory?
        Boolean.new(current_time_zone_names.include?("Factory"))
      end

      def code_gb?
        Boolean.new(current_time_zone_names.include?("GB"))
      end

      def code_gb_minus_eire?
        Boolean.new(current_time_zone_names.include?("GB-Eire"))
      end

      def code_gmt?
        Boolean.new(current_time_zone_names.include?("GMT"))
      end

      def code_gmt_plus_0?
        Boolean.new(current_time_zone_names.include?("GMT+0"))
      end

      def code_gmt_minus_0?
        Boolean.new(current_time_zone_names.include?("GMT-0"))
      end

      def code_gmt0?
        Boolean.new(current_time_zone_names.include?("GMT0"))
      end

      def code_greenwich?
        Boolean.new(current_time_zone_names.include?("Greenwich"))
      end

      def code_hst?
        Boolean.new(current_time_zone_names.include?("HST"))
      end

      def code_hongkong?
        Boolean.new(current_time_zone_names.include?("Hongkong"))
      end

      def code_iceland?
        Boolean.new(current_time_zone_names.include?("Iceland"))
      end

      def code_indian_antananarivo?
        Boolean.new(current_time_zone_names.include?("Indian/Antananarivo"))
      end

      def code_indian_chagos?
        Boolean.new(current_time_zone_names.include?("Indian/Chagos"))
      end

      def code_indian_christmas?
        Boolean.new(current_time_zone_names.include?("Indian/Christmas"))
      end

      def code_indian_cocos?
        Boolean.new(current_time_zone_names.include?("Indian/Cocos"))
      end

      def code_indian_comoro?
        Boolean.new(current_time_zone_names.include?("Indian/Comoro"))
      end

      def code_indian_kerguelen?
        Boolean.new(current_time_zone_names.include?("Indian/Kerguelen"))
      end

      def code_indian_mahe?
        Boolean.new(current_time_zone_names.include?("Indian/Mahe"))
      end

      def code_indian_maldives?
        Boolean.new(current_time_zone_names.include?("Indian/Maldives"))
      end

      def code_indian_mauritius?
        Boolean.new(current_time_zone_names.include?("Indian/Mauritius"))
      end

      def code_indian_mayotte?
        Boolean.new(current_time_zone_names.include?("Indian/Mayotte"))
      end

      def code_indian_reunion?
        Boolean.new(current_time_zone_names.include?("Indian/Reunion"))
      end

      def code_iran?
        Boolean.new(current_time_zone_names.include?("Iran"))
      end

      def code_israel?
        Boolean.new(current_time_zone_names.include?("Israel"))
      end

      def code_jamaica?
        Boolean.new(current_time_zone_names.include?("Jamaica"))
      end

      def code_japan?
        Boolean.new(current_time_zone_names.include?("Japan"))
      end

      def code_kwajalein?
        Boolean.new(current_time_zone_names.include?("Kwajalein"))
      end

      def code_libya?
        Boolean.new(current_time_zone_names.include?("Libya"))
      end

      def code_met?
        Boolean.new(current_time_zone_names.include?("MET"))
      end

      def code_mst?
        Boolean.new(current_time_zone_names.include?("MST"))
      end

      def code_mst7mdt?
        Boolean.new(current_time_zone_names.include?("MST7MDT"))
      end

      def code_mexico_bajanorte?
        Boolean.new(current_time_zone_names.include?("Mexico/BajaNorte"))
      end

      def code_mexico_bajasur?
        Boolean.new(current_time_zone_names.include?("Mexico/BajaSur"))
      end

      def code_mexico_general?
        Boolean.new(current_time_zone_names.include?("Mexico/General"))
      end

      def code_nz?
        Boolean.new(current_time_zone_names.include?("NZ"))
      end

      def code_nz_minus_chat?
        Boolean.new(current_time_zone_names.include?("NZ-CHAT"))
      end

      def code_navajo?
        Boolean.new(current_time_zone_names.include?("Navajo"))
      end

      def code_prc?
        Boolean.new(current_time_zone_names.include?("PRC"))
      end

      def code_pst8pdt?
        Boolean.new(current_time_zone_names.include?("PST8PDT"))
      end

      def code_pacific_apia?
        Boolean.new(current_time_zone_names.include?("Pacific/Apia"))
      end

      def code_pacific_auckland?
        Boolean.new(current_time_zone_names.include?("Pacific/Auckland"))
      end

      def code_pacific_bougainville?
        Boolean.new(current_time_zone_names.include?("Pacific/Bougainville"))
      end

      def code_pacific_chatham?
        Boolean.new(current_time_zone_names.include?("Pacific/Chatham"))
      end

      def code_pacific_chuuk?
        Boolean.new(current_time_zone_names.include?("Pacific/Chuuk"))
      end

      def code_pacific_easter?
        Boolean.new(current_time_zone_names.include?("Pacific/Easter"))
      end

      def code_pacific_efate?
        Boolean.new(current_time_zone_names.include?("Pacific/Efate"))
      end

      def code_pacific_enderbury?
        Boolean.new(current_time_zone_names.include?("Pacific/Enderbury"))
      end

      def code_pacific_fakaofo?
        Boolean.new(current_time_zone_names.include?("Pacific/Fakaofo"))
      end

      def code_pacific_fiji?
        Boolean.new(current_time_zone_names.include?("Pacific/Fiji"))
      end

      def code_pacific_funafuti?
        Boolean.new(current_time_zone_names.include?("Pacific/Funafuti"))
      end

      def code_pacific_galapagos?
        Boolean.new(current_time_zone_names.include?("Pacific/Galapagos"))
      end

      def code_pacific_gambier?
        Boolean.new(current_time_zone_names.include?("Pacific/Gambier"))
      end

      def code_pacific_guadalcanal?
        Boolean.new(current_time_zone_names.include?("Pacific/Guadalcanal"))
      end

      def code_pacific_guam?
        Boolean.new(current_time_zone_names.include?("Pacific/Guam"))
      end

      def code_pacific_honolulu?
        Boolean.new(current_time_zone_names.include?("Pacific/Honolulu"))
      end

      def code_pacific_johnston?
        Boolean.new(current_time_zone_names.include?("Pacific/Johnston"))
      end

      def code_pacific_kanton?
        Boolean.new(current_time_zone_names.include?("Pacific/Kanton"))
      end

      def code_pacific_kiritimati?
        Boolean.new(current_time_zone_names.include?("Pacific/Kiritimati"))
      end

      def code_pacific_kosrae?
        Boolean.new(current_time_zone_names.include?("Pacific/Kosrae"))
      end

      def code_pacific_kwajalein?
        Boolean.new(current_time_zone_names.include?("Pacific/Kwajalein"))
      end

      def code_pacific_majuro?
        Boolean.new(current_time_zone_names.include?("Pacific/Majuro"))
      end

      def code_pacific_marquesas?
        Boolean.new(current_time_zone_names.include?("Pacific/Marquesas"))
      end

      def code_pacific_midway?
        Boolean.new(current_time_zone_names.include?("Pacific/Midway"))
      end

      def code_pacific_nauru?
        Boolean.new(current_time_zone_names.include?("Pacific/Nauru"))
      end

      def code_pacific_niue?
        Boolean.new(current_time_zone_names.include?("Pacific/Niue"))
      end

      def code_pacific_norfolk?
        Boolean.new(current_time_zone_names.include?("Pacific/Norfolk"))
      end

      def code_pacific_noumea?
        Boolean.new(current_time_zone_names.include?("Pacific/Noumea"))
      end

      def code_pacific_pago_pago?
        Boolean.new(current_time_zone_names.include?("Pacific/Pago_Pago"))
      end

      def code_pacific_palau?
        Boolean.new(current_time_zone_names.include?("Pacific/Palau"))
      end

      def code_pacific_pitcairn?
        Boolean.new(current_time_zone_names.include?("Pacific/Pitcairn"))
      end

      def code_pacific_pohnpei?
        Boolean.new(current_time_zone_names.include?("Pacific/Pohnpei"))
      end

      def code_pacific_ponape?
        Boolean.new(current_time_zone_names.include?("Pacific/Ponape"))
      end

      def code_pacific_port_moresby?
        Boolean.new(current_time_zone_names.include?("Pacific/Port_Moresby"))
      end

      def code_pacific_rarotonga?
        Boolean.new(current_time_zone_names.include?("Pacific/Rarotonga"))
      end

      def code_pacific_saipan?
        Boolean.new(current_time_zone_names.include?("Pacific/Saipan"))
      end

      def code_pacific_samoa?
        Boolean.new(current_time_zone_names.include?("Pacific/Samoa"))
      end

      def code_pacific_tahiti?
        Boolean.new(current_time_zone_names.include?("Pacific/Tahiti"))
      end

      def code_pacific_tarawa?
        Boolean.new(current_time_zone_names.include?("Pacific/Tarawa"))
      end

      def code_pacific_tongatapu?
        Boolean.new(current_time_zone_names.include?("Pacific/Tongatapu"))
      end

      def code_pacific_truk?
        Boolean.new(current_time_zone_names.include?("Pacific/Truk"))
      end

      def code_pacific_wake?
        Boolean.new(current_time_zone_names.include?("Pacific/Wake"))
      end

      def code_pacific_wallis?
        Boolean.new(current_time_zone_names.include?("Pacific/Wallis"))
      end

      def code_pacific_yap?
        Boolean.new(current_time_zone_names.include?("Pacific/Yap"))
      end

      def code_poland?
        Boolean.new(current_time_zone_names.include?("Poland"))
      end

      def code_portugal?
        Boolean.new(current_time_zone_names.include?("Portugal"))
      end

      def code_roc?
        Boolean.new(current_time_zone_names.include?("ROC"))
      end

      def code_rok?
        Boolean.new(current_time_zone_names.include?("ROK"))
      end

      def code_singapore?
        Boolean.new(current_time_zone_names.include?("Singapore"))
      end

      def code_turkey?
        Boolean.new(current_time_zone_names.include?("Turkey"))
      end

      def code_uct?
        Boolean.new(current_time_zone_names.include?("UCT"))
      end

      def code_us_alaska?
        Boolean.new(current_time_zone_names.include?("US/Alaska"))
      end

      def code_us_aleutian?
        Boolean.new(current_time_zone_names.include?("US/Aleutian"))
      end

      def code_us_arizona?
        Boolean.new(current_time_zone_names.include?("US/Arizona"))
      end

      def code_us_central?
        Boolean.new(current_time_zone_names.include?("US/Central"))
      end

      def code_us_east_minus_indiana?
        Boolean.new(current_time_zone_names.include?("US/East-Indiana"))
      end

      def code_us_eastern?
        Boolean.new(current_time_zone_names.include?("US/Eastern"))
      end

      def code_us_hawaii?
        Boolean.new(current_time_zone_names.include?("US/Hawaii"))
      end

      def code_us_indiana_minus_starke?
        Boolean.new(current_time_zone_names.include?("US/Indiana-Starke"))
      end

      def code_us_michigan?
        Boolean.new(current_time_zone_names.include?("US/Michigan"))
      end

      def code_us_mountain?
        Boolean.new(current_time_zone_names.include?("US/Mountain"))
      end

      def code_us_pacific?
        Boolean.new(current_time_zone_names.include?("US/Pacific"))
      end

      def code_us_samoa?
        Boolean.new(current_time_zone_names.include?("US/Samoa"))
      end

      def code_utc?
        Boolean.new(
          current_time_zone_names.include?("UTC") ||
            current_time_zone_names.include?("Etc/UTC")
        )
      end

      def code_universal?
        Boolean.new(current_time_zone_names.include?("Universal"))
      end

      def code_w_minus_su?
        Boolean.new(current_time_zone_names.include?("W-SU"))
      end

      def code_wet?
        Boolean.new(current_time_zone_names.include?("WET"))
      end

      def code_zulu?
        Boolean.new(current_time_zone_names.include?("Zulu"))
      end

      def current_time_zone_names
        [::Time.zone.name, ::Time.zone.tzinfo.name]
      end

      def code_utc_offset
        Integer.new(::Time.zone.utc_offset)
      end

      def code_year_day
        Integer.new(raw.yday)
      end

      def code_month_day
        code_day
      end

      def code_nanosecond
        Integer.new(0)
      end

      def code_nanoseconds
        code_nanosecond
      end

      def code_millisecond
        Integer.new(0)
      end

      def code_milliseconds
        code_millisecond
      end

      def code_utc
        self
      end

      def code_local
        self
      end

      def code_beginning_of_day
        Time.new(raw.beginning_of_day)
      end

      def code_end_of_day
        Time.new(raw.end_of_day)
      end

      def code_format_locale_from_arguments(code_arguments)
        code_options = code_arguments.raw[1].to_code
        return Nothing.new unless code_options.is_a?(Dictionary)

        code_options.code_get(:locale)
      end

      def code_hour
        Integer.new(0)
      end

      def code_hours
        Integer.new(0)
      end

      def code_minute
        Integer.new(0)
      end

      def code_minutes
        Integer.new(0)
      end

      def code_second
        Integer.new(0)
      end

      def code_seconds
        Integer.new(0)
      end

      def code_today
        Date.new
      end

      def code_current
        Date.new
      end

      def code_now
        Date.new
      end

      def code_tomorrow
        code_add(day: 1)
      end

      def code_yesterday
        code_substract(day: 1)
      end

      def code_add(
        year: nil,
        years: nil,
        month: nil,
        months: nil,
        day: nil,
        days: nil,
        week_day: nil,
        week_days: nil,
        week: nil,
        weeks: nil
      )
        code_year = year.to_code.nothing? ? years.to_code : year.to_code
        code_month = month.to_code.nothing? ? months.to_code : month.to_code
        code_day = day.to_code.nothing? ? days.to_code : day.to_code
        code_week_day =
          week_day.to_code.nothing? ? week_days.to_code : week_day.to_code
        code_week = week.to_code.nothing? ? weeks.to_code : week.to_code

        year = code_years.code_to_integer.raw + code_year.code_to_integer.raw
        month = code_months.code_to_integer.raw + code_month.code_to_integer.raw
        day = code_days.code_to_integer.raw + code_day.code_to_integer.raw
        week_day =
          code_week_days.code_to_integer.raw + code_week_day.code_to_integer.raw
        week = code_weeks.code_to_integer.raw + code_week.code_to_integer.raw

        code_change(
          year: year,
          month: month,
          day: day,
          week_day: week_day,
          week: week
        )
      end

      def code_substract(
        year: nil,
        years: nil,
        month: nil,
        months: nil,
        day: nil,
        days: nil,
        week_day: nil,
        week_days: nil,
        week: nil,
        weeks: nil
      )
        code_year = year.to_code.nothing? ? years.to_code : year.to_code
        code_month = month.to_code.nothing? ? months.to_code : month.to_code
        code_day = day.to_code.nothing? ? days.to_code : day.to_code
        code_week_day =
          week_day.to_code.nothing? ? week_days.to_code : week_day.to_code
        code_week = week.to_code.nothing? ? weeks.to_code : week.to_code

        year = code_years.code_to_integer.raw - code_year.code_to_integer.raw
        month = code_months.code_to_integer.raw - code_month.code_to_integer.raw
        day = code_days.code_to_integer.raw - code_day.code_to_integer.raw
        week_day =
          code_week_days.code_to_integer.raw - code_week_day.code_to_integer.raw
        week = code_weeks.code_to_integer.raw - code_week.code_to_integer.raw

        code_change(
          year: year,
          month: month,
          day: day,
          week_day: week_day,
          week: week
        )
      end

      def code_subtract(...)
        code_substract(...)
      end

      def code_change(
        year: nil,
        years: nil,
        month: nil,
        months: nil,
        day: nil,
        days: nil,
        week_day: nil,
        week_days: nil,
        week: nil,
        weeks: nil
      )
        code_year = year.to_code.nothing? ? years.to_code : year.to_code
        code_month = month.to_code.nothing? ? months.to_code : month.to_code
        code_day = day.to_code.nothing? ? days.to_code : day.to_code
        code_week_day =
          week_day.to_code.nothing? ? week_days.to_code : week_day.to_code
        code_week = week.to_code.nothing? ? weeks.to_code : week.to_code

        year = code_year.raw || code_years.raw
        month = code_month.raw || code_months.raw
        day = code_day.raw || code_days.raw
        wday = code_week_day.raw || code_week_days.raw
        cweek = code_week.raw || code_weeks.raw

        dup = raw.dup
        dup += (year - raw.year).years
        dup += (month - raw.month).months
        dup += (day - raw.day).days
        dup += (wday - raw.wday).days
        dup += (cweek - raw.to_date.cweek).weeks

        Date.new(dup)
      end

      def code_zone
        String.new(::Time.zone.name)
      end

      def self.code_zone_assign(value)
        code_value = value.to_code

        ::Time.zone = code_value.raw
        code_value
      end
    end
  end
end
