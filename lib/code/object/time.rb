# frozen_string_literal: true

class Code
  class Object
    class Time < Object
      DEFAULT_ZONE = "Etc/UTC"

      class << self
        delegate(
          :code_format,
          :code_add,
          :code_substract,
          :code_past?,
          :code_future?,
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

      def initialize(*args, **_kargs, &_block)
        ::Time.zone ||= DEFAULT_ZONE

        if args.first.is_a?(String) || args.first.is_a?(::String)
          self.raw = ::Time.zone.parse(args.first.to_s) || raise(Error)
        elsif args.first.is_a?(Time)
          self.raw = args.first.raw.dup.in_time_zone(::Time.zone)
        elsif args.first.is_a?(::Time)
          self.raw = args.first.dup.in_time_zone(::Time.zone)
        elsif args.first.is_a?(Date)
          self.raw = args.first.raw.to_time.in_time_zone(::Time.zone)
        elsif args.first.is_a?(::Date)
          self.raw = args.first.to_time.in_time_zone(::Time.zone)
        elsif args.first.is_a?(::ActiveSupport::TimeWithZone)
          self.raw = args.first.dup
        elsif args.first.is_a?(Integer) || args.first.is_a?(Decimal) ||
            args.first.is_a?(::Integer) || args.first.is_a?(::Float) ||
            args.first.is_a?(::BigDecimal)
          code_value = args.first.to_code
          timestamp =
            if code_value.is_a?(Decimal)
              code_value.raw.to_r
            else
              code_value.raw
            end
          self.raw = ::Time.zone.at(timestamp)
        else
          self.raw = ::Time.zone.now
        end
      end

      def self.call(**args)
        code_operator = args.fetch(:operator, nil).to_code
        code_arguments = args.fetch(:arguments, []).to_code
        code_value = code_arguments.code_first
        code_second = code_arguments.code_second

        case code_operator.to_s
        when "after?"
          sig(args) { (Date | Time).maybe }
          code_after?(code_value)
        when "before?"
          sig(args) { (Date | Time).maybe }
          code_before?(code_value)
        when "now"
          sig(args)
          code_now
        when "tomorrow"
          sig(args)
          code_tomorrow
        when "yesterday"
          sig(args)
          code_yesterday
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
              weeks: (String | Integer).maybe,
              hour: (String | Integer).maybe,
              hours: (String | Integer).maybe,
              minute: (String | Integer).maybe,
              minutes: (String | Integer).maybe,
              second: (String | Integer).maybe,
              seconds: (String | Integer).maybe
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
              weeks: code_value.code_get(:weeks),
              hour: code_value.code_get(:hour),
              hours: code_value.code_get(:hours),
              minute: code_value.code_get(:minute),
              minutes: code_value.code_get(:minutes),
              second: code_value.code_get(:second),
              seconds: code_value.code_get(:seconds)
            )
          end
        when "substract"
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
              weeks: (String | Integer).maybe,
              hour: (String | Integer).maybe,
              hours: (String | Integer).maybe,
              minute: (String | Integer).maybe,
              minutes: (String | Integer).maybe,
              second: (String | Integer).maybe,
              seconds: (String | Integer).maybe
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
              weeks: code_value.code_get(:weeks),
              hour: code_value.code_get(:hour),
              hours: code_value.code_get(:hours),
              minute: code_value.code_get(:minute),
              minutes: code_value.code_get(:minutes),
              second: code_value.code_get(:second),
              seconds: code_value.code_get(:seconds)
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
              weeks: (String | Integer).maybe,
              hour: (String | Integer).maybe,
              hours: (String | Integer).maybe,
              minute: (String | Integer).maybe,
              minutes: (String | Integer).maybe,
              second: (String | Integer).maybe,
              seconds: (String | Integer).maybe
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
              weeks: code_value.code_get(:weeks),
              hour: code_value.code_get(:hour),
              hours: code_value.code_get(:hours),
              minute: code_value.code_get(:minute),
              minutes: code_value.code_get(:minutes),
              second: code_value.code_get(:second),
              seconds: code_value.code_get(:seconds)
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
        when "after?"
          sig(args) { (Date | Time).maybe }
          code_after?(code_value)
        when "before?"
          sig(args) { (Date | Time).maybe }
          code_before?(code_value)
        when "tomorrow"
          sig(args)
          code_tomorrow
        when "yesterday"
          sig(args)
          code_yesterday
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
              weeks: (String | Integer).maybe,
              hour: (String | Integer).maybe,
              hours: (String | Integer).maybe,
              minute: (String | Integer).maybe,
              minutes: (String | Integer).maybe,
              second: (String | Integer).maybe,
              seconds: (String | Integer).maybe
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
              weeks: code_value.code_get(:weeks),
              hour: code_value.code_get(:hour),
              hours: code_value.code_get(:hours),
              minute: code_value.code_get(:minute),
              minutes: code_value.code_get(:minutes),
              second: code_value.code_get(:second),
              seconds: code_value.code_get(:seconds)
            )
          end
        when "substract"
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
              weeks: (String | Integer).maybe,
              hour: (String | Integer).maybe,
              hours: (String | Integer).maybe,
              minute: (String | Integer).maybe,
              minutes: (String | Integer).maybe,
              second: (String | Integer).maybe,
              seconds: (String | Integer).maybe
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
              weeks: code_value.code_get(:weeks),
              hour: code_value.code_get(:hour),
              hours: code_value.code_get(:hours),
              minute: code_value.code_get(:minute),
              minutes: code_value.code_get(:minutes),
              second: code_value.code_get(:second),
              seconds: code_value.code_get(:seconds)
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
              weeks: (String | Integer).maybe,
              hour: (String | Integer).maybe,
              hours: (String | Integer).maybe,
              minute: (String | Integer).maybe,
              minutes: (String | Integer).maybe,
              second: (String | Integer).maybe,
              seconds: (String | Integer).maybe
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
              weeks: code_value.code_get(:weeks),
              hour: code_value.code_get(:hour),
              hours: code_value.code_get(:hours),
              minute: code_value.code_get(:minute),
              minutes: code_value.code_get(:minutes),
              second: code_value.code_get(:second),
              seconds: code_value.code_get(:seconds)
            )
          end
        else
          super
        end
      end

      def code_after?(other = nil)
        code_other = other.to_code
        code_other = Time.new if code_other.nothing?

        Boolean.new(raw.after?(code_other.raw))
      end

      def code_before?(other = nil)
        code_other = other.to_code
        code_other = Time.new if code_other.nothing?

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
        Integer.new(raw.to_date.cweek)
      end

      def code_weeks
        Integer.new(raw.to_date.cweek)
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

      def code_hour
        Integer.new(raw.hour)
      end

      def code_hours
        Integer.new(raw.hour)
      end

      def code_minute
        Integer.new(raw.min)
      end

      def code_minutes
        Integer.new(raw.min)
      end

      def code_second
        Integer.new(raw.sec)
      end

      def code_seconds
        Integer.new(raw.sec)
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
        locale = ::I18n.locale unless ::I18n.available_locales.include?(locale.to_sym)

        format = code_format.raw || :default
        format = format.to_sym if ::I18n.exists?("time.formats.#{format}", locale)

        String.new(::I18n.l(raw, format: format, locale: locale))
      end

      def code_today
        Time.new
      end

      def code_now
        Time.new
      end

      def code_current
        Time.new
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
        weeks: nil,
        hour: nil,
        hours: nil,
        minute: nil,
        minutes: nil,
        second: nil,
        seconds: nil
      )
        code_year = year.to_code.nothing? ? years.to_code : year.to_code
        code_month = month.to_code.nothing? ? months.to_code : month.to_code
        code_day = day.to_code.nothing? ? days.to_code : day.to_code
        code_week_day =
          week_day.to_code.nothing? ? week_days.to_code : week_day.to_code
        code_week = week.to_code.nothing? ? weeks.to_code : week.to_code
        code_hour = hour.to_code.nothing? ? hours.to_code : hour.to_code
        code_minute = minute.to_code.nothing? ? minutes.to_code : minute.to_code
        code_second = second.to_code.nothing? ? seconds.to_code : second.to_code

        year = code_years.code_to_integer.raw + code_year.code_to_integer.raw
        month = code_months.code_to_integer.raw + code_month.code_to_integer.raw
        day = code_days.code_to_integer.raw + code_day.code_to_integer.raw
        week_day =
          code_week_days.code_to_integer.raw + code_week_day.code_to_integer.raw
        week = code_weeks.code_to_integer.raw + code_week.code_to_integer.raw
        hour = code_hours.code_to_integer.raw + code_hour.code_to_integer.raw
        minute =
          code_minutes.code_to_integer.raw + code_minute.code_to_integer.raw
        second =
          code_seconds.code_to_integer.raw + code_second.code_to_integer.raw

        code_change(
          year:,
          month:,
          day:,
          week_day:,
          week:,
          hour:,
          minute:,
          second:
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
        weeks: nil,
        hour: nil,
        hours: nil,
        minute: nil,
        minutes: nil,
        second: nil,
        seconds: nil
      )
        code_year = year.to_code.nothing? ? years.to_code : year.to_code
        code_month = month.to_code.nothing? ? months.to_code : month.to_code
        code_day = day.to_code.nothing? ? days.to_code : day.to_code
        code_week_day =
          week_day.to_code.nothing? ? week_days.to_code : week_day.to_code
        code_week = week.to_code.nothing? ? weeks.to_code : week.to_code
        code_hour = hour.to_code.nothing? ? hours.to_code : hour.to_code
        code_minute = minute.to_code.nothing? ? minutes.to_code : minute.to_code
        code_second = second.to_code.nothing? ? seconds.to_code : second.to_code

        year = code_years.code_to_integer.raw - code_year.code_to_integer.raw
        month = code_months.code_to_integer.raw - code_month.code_to_integer.raw
        day = code_days.code_to_integer.raw - code_day.code_to_integer.raw
        week_day =
          code_week_days.code_to_integer.raw - code_week_day.code_to_integer.raw
        week = code_weeks.code_to_integer.raw - code_week.code_to_integer.raw
        hour = code_hours.code_to_integer.raw - code_hour.code_to_integer.raw
        minute =
          code_minutes.code_to_integer.raw - code_minute.code_to_integer.raw
        second =
          code_seconds.code_to_integer.raw - code_second.code_to_integer.raw

        code_change(
          year:,
          month:,
          day:,
          week_day:,
          week:,
          hour:,
          minute:,
          second:
        )
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
        weeks: nil,
        hour: nil,
        hours: nil,
        minute: nil,
        minutes: nil,
        second: nil,
        seconds: nil
      )
        code_year = year.to_code.nothing? ? years.to_code : year.to_code
        code_month = month.to_code.nothing? ? months.to_code : month.to_code
        code_day = day.to_code.nothing? ? days.to_code : day.to_code
        code_week_day =
          week_day.to_code.nothing? ? week_days.to_code : week_day.to_code
        code_week = week.to_code.nothing? ? weeks.to_code : week.to_code
        code_hour = hour.to_code.nothing? ? hours.to_code : hour.to_code
        code_minute = minute.to_code.nothing? ? minutes.to_code : minute.to_code
        code_second = second.to_code.nothing? ? seconds.to_code : second.to_code

        year = code_year.raw || code_years.raw
        month = code_month.raw || code_months.raw
        day = code_day.raw || code_days.raw
        wday = code_week_day.raw || code_week_days.raw
        cweek = code_week.raw || code_weeks.raw
        hour = code_hour.raw || code_hours.raw
        min = code_minute.raw || code_minutes.raw
        sec = code_second.raw || code_seconds.raw

        dup = raw.dup
        dup += (year - raw.year).years
        dup += (month - raw.month).months
        dup += (day - raw.day).days
        dup += (wday - raw.wday).days
        dup += (cweek - raw.to_date.cweek).weeks
        dup += (hour - raw.hour).hours
        dup += (min - raw.min).minutes
        dup += (sec - raw.sec).seconds

        Time.new(dup)
      end
    end
  end
end
