# frozen_string_literal: true

class Code
  class Object
    class Time < Object
      DEFAULT_ZONE = "Etc/UTC"

      class << self
        delegate(
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
          :code_add,
          :code_substract,
          :code_subtract,
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

        first = args.first
        self.raw =
          case first
          when String, ::String
            ::Time.zone.parse(first.to_s) || raise(Error)
          when Time
            first.raw.dup.in_time_zone(::Time.zone)
          when ::Time
            first.dup.in_time_zone(::Time.zone)
          when Date
            first.raw.to_time.in_time_zone(::Time.zone)
          when ::Date
            first.to_time.in_time_zone(::Time.zone)
          when ::ActiveSupport::TimeWithZone
            first.dup
          when Integer, Decimal, ::Integer, ::Float, ::BigDecimal
            code_value = first.to_code
            timestamp =
              (code_value.is_a?(Decimal) ? code_value.raw.to_r : code_value.raw)
            ::Time.zone.at(timestamp)
          else
            ::Time.zone.now
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
          ::Time.zone ||= DEFAULT_ZONE
          code_zone
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

      def self.code_zone
        String.new(::Time.zone.name)
      end

      def self.code_zone_assign(value)
        code_value = value.to_code

        ::Time.zone = code_value.raw
        code_value
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
        locale = ::I18n.locale unless ::I18n.available_locales.include?(
          locale.to_sym
        )

        format = code_format.raw || :default
        format = format.to_sym if ::I18n.exists?(
          "time.formats.#{format}",
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
        List.new(
          [
            code_year,
            code_month,
            code_day,
            code_hour,
            code_minute,
            code_second,
            code_zone
          ]
        )
      end

      def code_to_integer
        Integer.new(raw.to_i)
      end

      def code_to_decimal
        Decimal.new(BigDecimal(raw.to_r, 16))
      end

      def code_africa_abidjan?
        Boolean.new(raw_time_zone_names.include?("Africa/Abidjan"))
      end

      def code_africa_accra?
        Boolean.new(raw_time_zone_names.include?("Africa/Accra"))
      end

      def code_africa_addis_ababa?
        Boolean.new(raw_time_zone_names.include?("Africa/Addis_Ababa"))
      end

      def code_africa_algiers?
        Boolean.new(raw_time_zone_names.include?("Africa/Algiers"))
      end

      def code_africa_asmara?
        Boolean.new(raw_time_zone_names.include?("Africa/Asmara"))
      end

      def code_africa_asmera?
        Boolean.new(raw_time_zone_names.include?("Africa/Asmera"))
      end

      def code_africa_bamako?
        Boolean.new(raw_time_zone_names.include?("Africa/Bamako"))
      end

      def code_africa_bangui?
        Boolean.new(raw_time_zone_names.include?("Africa/Bangui"))
      end

      def code_africa_banjul?
        Boolean.new(raw_time_zone_names.include?("Africa/Banjul"))
      end

      def code_africa_bissau?
        Boolean.new(raw_time_zone_names.include?("Africa/Bissau"))
      end

      def code_africa_blantyre?
        Boolean.new(raw_time_zone_names.include?("Africa/Blantyre"))
      end

      def code_africa_brazzaville?
        Boolean.new(raw_time_zone_names.include?("Africa/Brazzaville"))
      end

      def code_africa_bujumbura?
        Boolean.new(raw_time_zone_names.include?("Africa/Bujumbura"))
      end

      def code_africa_cairo?
        Boolean.new(raw_time_zone_names.include?("Africa/Cairo"))
      end

      def code_africa_casablanca?
        Boolean.new(raw_time_zone_names.include?("Africa/Casablanca"))
      end

      def code_africa_ceuta?
        Boolean.new(raw_time_zone_names.include?("Africa/Ceuta"))
      end

      def code_africa_conakry?
        Boolean.new(raw_time_zone_names.include?("Africa/Conakry"))
      end

      def code_africa_dakar?
        Boolean.new(raw_time_zone_names.include?("Africa/Dakar"))
      end

      def code_africa_dar_es_salaam?
        Boolean.new(raw_time_zone_names.include?("Africa/Dar_es_Salaam"))
      end

      def code_africa_djibouti?
        Boolean.new(raw_time_zone_names.include?("Africa/Djibouti"))
      end

      def code_africa_douala?
        Boolean.new(raw_time_zone_names.include?("Africa/Douala"))
      end

      def code_africa_el_aaiun?
        Boolean.new(raw_time_zone_names.include?("Africa/El_Aaiun"))
      end

      def code_africa_freetown?
        Boolean.new(raw_time_zone_names.include?("Africa/Freetown"))
      end

      def code_africa_gaborone?
        Boolean.new(raw_time_zone_names.include?("Africa/Gaborone"))
      end

      def code_africa_harare?
        Boolean.new(raw_time_zone_names.include?("Africa/Harare"))
      end

      def code_africa_johannesburg?
        Boolean.new(raw_time_zone_names.include?("Africa/Johannesburg"))
      end

      def code_africa_juba?
        Boolean.new(raw_time_zone_names.include?("Africa/Juba"))
      end

      def code_africa_kampala?
        Boolean.new(raw_time_zone_names.include?("Africa/Kampala"))
      end

      def code_africa_khartoum?
        Boolean.new(raw_time_zone_names.include?("Africa/Khartoum"))
      end

      def code_africa_kigali?
        Boolean.new(raw_time_zone_names.include?("Africa/Kigali"))
      end

      def code_africa_kinshasa?
        Boolean.new(raw_time_zone_names.include?("Africa/Kinshasa"))
      end

      def code_africa_lagos?
        Boolean.new(raw_time_zone_names.include?("Africa/Lagos"))
      end

      def code_africa_libreville?
        Boolean.new(raw_time_zone_names.include?("Africa/Libreville"))
      end

      def code_africa_lome?
        Boolean.new(raw_time_zone_names.include?("Africa/Lome"))
      end

      def code_africa_luanda?
        Boolean.new(raw_time_zone_names.include?("Africa/Luanda"))
      end

      def code_africa_lubumbashi?
        Boolean.new(raw_time_zone_names.include?("Africa/Lubumbashi"))
      end

      def code_africa_lusaka?
        Boolean.new(raw_time_zone_names.include?("Africa/Lusaka"))
      end

      def code_africa_malabo?
        Boolean.new(raw_time_zone_names.include?("Africa/Malabo"))
      end

      def code_africa_maputo?
        Boolean.new(raw_time_zone_names.include?("Africa/Maputo"))
      end

      def code_africa_maseru?
        Boolean.new(raw_time_zone_names.include?("Africa/Maseru"))
      end

      def code_africa_mbabane?
        Boolean.new(raw_time_zone_names.include?("Africa/Mbabane"))
      end

      def code_africa_mogadishu?
        Boolean.new(raw_time_zone_names.include?("Africa/Mogadishu"))
      end

      def code_africa_monrovia?
        Boolean.new(raw_time_zone_names.include?("Africa/Monrovia"))
      end

      def code_africa_nairobi?
        Boolean.new(raw_time_zone_names.include?("Africa/Nairobi"))
      end

      def code_africa_ndjamena?
        Boolean.new(raw_time_zone_names.include?("Africa/Ndjamena"))
      end

      def code_africa_niamey?
        Boolean.new(raw_time_zone_names.include?("Africa/Niamey"))
      end

      def code_africa_nouakchott?
        Boolean.new(raw_time_zone_names.include?("Africa/Nouakchott"))
      end

      def code_africa_ouagadougou?
        Boolean.new(raw_time_zone_names.include?("Africa/Ouagadougou"))
      end

      def code_africa_porto_minus_novo?
        Boolean.new(raw_time_zone_names.include?("Africa/Porto-Novo"))
      end

      def code_africa_sao_tome?
        Boolean.new(raw_time_zone_names.include?("Africa/Sao_Tome"))
      end

      def code_africa_timbuktu?
        Boolean.new(raw_time_zone_names.include?("Africa/Timbuktu"))
      end

      def code_africa_tripoli?
        Boolean.new(raw_time_zone_names.include?("Africa/Tripoli"))
      end

      def code_africa_tunis?
        Boolean.new(raw_time_zone_names.include?("Africa/Tunis"))
      end

      def code_africa_windhoek?
        Boolean.new(raw_time_zone_names.include?("Africa/Windhoek"))
      end

      def code_america_adak?
        Boolean.new(raw_time_zone_names.include?("America/Adak"))
      end

      def code_america_anchorage?
        Boolean.new(raw_time_zone_names.include?("America/Anchorage"))
      end

      def code_america_anguilla?
        Boolean.new(raw_time_zone_names.include?("America/Anguilla"))
      end

      def code_america_antigua?
        Boolean.new(raw_time_zone_names.include?("America/Antigua"))
      end

      def code_america_araguaina?
        Boolean.new(raw_time_zone_names.include?("America/Araguaina"))
      end

      def code_america_argentina_buenos_aires?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Buenos_Aires"))
      end

      def code_america_argentina_catamarca?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Catamarca"))
      end

      def code_america_argentina_comodrivadavia?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/ComodRivadavia"))
      end

      def code_america_argentina_cordoba?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Cordoba"))
      end

      def code_america_argentina_jujuy?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Jujuy"))
      end

      def code_america_argentina_la_rioja?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/La_Rioja"))
      end

      def code_america_argentina_mendoza?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Mendoza"))
      end

      def code_america_argentina_rio_gallegos?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Rio_Gallegos"))
      end

      def code_america_argentina_salta?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Salta"))
      end

      def code_america_argentina_san_juan?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/San_Juan"))
      end

      def code_america_argentina_san_luis?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/San_Luis"))
      end

      def code_america_argentina_tucuman?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Tucuman"))
      end

      def code_america_argentina_ushuaia?
        Boolean.new(raw_time_zone_names.include?("America/Argentina/Ushuaia"))
      end

      def code_america_aruba?
        Boolean.new(raw_time_zone_names.include?("America/Aruba"))
      end

      def code_america_asuncion?
        Boolean.new(raw_time_zone_names.include?("America/Asuncion"))
      end

      def code_america_atikokan?
        Boolean.new(raw_time_zone_names.include?("America/Atikokan"))
      end

      def code_america_atka?
        Boolean.new(raw_time_zone_names.include?("America/Atka"))
      end

      def code_america_bahia?
        Boolean.new(raw_time_zone_names.include?("America/Bahia"))
      end

      def code_america_bahia_banderas?
        Boolean.new(raw_time_zone_names.include?("America/Bahia_Banderas"))
      end

      def code_america_barbados?
        Boolean.new(raw_time_zone_names.include?("America/Barbados"))
      end

      def code_america_belem?
        Boolean.new(raw_time_zone_names.include?("America/Belem"))
      end

      def code_america_belize?
        Boolean.new(raw_time_zone_names.include?("America/Belize"))
      end

      def code_america_blanc_minus_sablon?
        Boolean.new(raw_time_zone_names.include?("America/Blanc-Sablon"))
      end

      def code_america_boa_vista?
        Boolean.new(raw_time_zone_names.include?("America/Boa_Vista"))
      end

      def code_america_bogota?
        Boolean.new(raw_time_zone_names.include?("America/Bogota"))
      end

      def code_america_boise?
        Boolean.new(raw_time_zone_names.include?("America/Boise"))
      end

      def code_america_buenos_aires?
        Boolean.new(raw_time_zone_names.include?("America/Buenos_Aires"))
      end

      def code_america_cambridge_bay?
        Boolean.new(raw_time_zone_names.include?("America/Cambridge_Bay"))
      end

      def code_america_campo_grande?
        Boolean.new(raw_time_zone_names.include?("America/Campo_Grande"))
      end

      def code_america_cancun?
        Boolean.new(raw_time_zone_names.include?("America/Cancun"))
      end

      def code_america_caracas?
        Boolean.new(raw_time_zone_names.include?("America/Caracas"))
      end

      def code_america_catamarca?
        Boolean.new(raw_time_zone_names.include?("America/Catamarca"))
      end

      def code_america_cayenne?
        Boolean.new(raw_time_zone_names.include?("America/Cayenne"))
      end

      def code_america_cayman?
        Boolean.new(raw_time_zone_names.include?("America/Cayman"))
      end

      def code_america_chicago?
        Boolean.new(raw_time_zone_names.include?("America/Chicago"))
      end

      def code_america_chihuahua?
        Boolean.new(raw_time_zone_names.include?("America/Chihuahua"))
      end

      def code_america_ciudad_juarez?
        Boolean.new(raw_time_zone_names.include?("America/Ciudad_Juarez"))
      end

      def code_america_coral_harbour?
        Boolean.new(raw_time_zone_names.include?("America/Coral_Harbour"))
      end

      def code_america_cordoba?
        Boolean.new(raw_time_zone_names.include?("America/Cordoba"))
      end

      def code_america_costa_rica?
        Boolean.new(raw_time_zone_names.include?("America/Costa_Rica"))
      end

      def code_america_coyhaique?
        Boolean.new(raw_time_zone_names.include?("America/Coyhaique"))
      end

      def code_america_creston?
        Boolean.new(raw_time_zone_names.include?("America/Creston"))
      end

      def code_america_cuiaba?
        Boolean.new(raw_time_zone_names.include?("America/Cuiaba"))
      end

      def code_america_curacao?
        Boolean.new(raw_time_zone_names.include?("America/Curacao"))
      end

      def code_america_danmarkshavn?
        Boolean.new(raw_time_zone_names.include?("America/Danmarkshavn"))
      end

      def code_america_dawson?
        Boolean.new(raw_time_zone_names.include?("America/Dawson"))
      end

      def code_america_dawson_creek?
        Boolean.new(raw_time_zone_names.include?("America/Dawson_Creek"))
      end

      def code_america_denver?
        Boolean.new(raw_time_zone_names.include?("America/Denver"))
      end

      def code_america_detroit?
        Boolean.new(raw_time_zone_names.include?("America/Detroit"))
      end

      def code_america_dominica?
        Boolean.new(raw_time_zone_names.include?("America/Dominica"))
      end

      def code_america_edmonton?
        Boolean.new(raw_time_zone_names.include?("America/Edmonton"))
      end

      def code_america_eirunepe?
        Boolean.new(raw_time_zone_names.include?("America/Eirunepe"))
      end

      def code_america_el_salvador?
        Boolean.new(raw_time_zone_names.include?("America/El_Salvador"))
      end

      def code_america_ensenada?
        Boolean.new(raw_time_zone_names.include?("America/Ensenada"))
      end

      def code_america_fort_nelson?
        Boolean.new(raw_time_zone_names.include?("America/Fort_Nelson"))
      end

      def code_america_fort_wayne?
        Boolean.new(raw_time_zone_names.include?("America/Fort_Wayne"))
      end

      def code_america_fortaleza?
        Boolean.new(raw_time_zone_names.include?("America/Fortaleza"))
      end

      def code_america_glace_bay?
        Boolean.new(raw_time_zone_names.include?("America/Glace_Bay"))
      end

      def code_america_godthab?
        Boolean.new(raw_time_zone_names.include?("America/Godthab"))
      end

      def code_america_goose_bay?
        Boolean.new(raw_time_zone_names.include?("America/Goose_Bay"))
      end

      def code_america_grand_turk?
        Boolean.new(raw_time_zone_names.include?("America/Grand_Turk"))
      end

      def code_america_grenada?
        Boolean.new(raw_time_zone_names.include?("America/Grenada"))
      end

      def code_america_guadeloupe?
        Boolean.new(raw_time_zone_names.include?("America/Guadeloupe"))
      end

      def code_america_guatemala?
        Boolean.new(raw_time_zone_names.include?("America/Guatemala"))
      end

      def code_america_guayaquil?
        Boolean.new(raw_time_zone_names.include?("America/Guayaquil"))
      end

      def code_america_guyana?
        Boolean.new(raw_time_zone_names.include?("America/Guyana"))
      end

      def code_america_halifax?
        Boolean.new(raw_time_zone_names.include?("America/Halifax"))
      end

      def code_america_havana?
        Boolean.new(raw_time_zone_names.include?("America/Havana"))
      end

      def code_america_hermosillo?
        Boolean.new(raw_time_zone_names.include?("America/Hermosillo"))
      end

      def code_america_indiana_indianapolis?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Indianapolis"))
      end

      def code_america_indiana_knox?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Knox"))
      end

      def code_america_indiana_marengo?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Marengo"))
      end

      def code_america_indiana_petersburg?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Petersburg"))
      end

      def code_america_indiana_tell_city?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Tell_City"))
      end

      def code_america_indiana_vevay?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Vevay"))
      end

      def code_america_indiana_vincennes?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Vincennes"))
      end

      def code_america_indiana_winamac?
        Boolean.new(raw_time_zone_names.include?("America/Indiana/Winamac"))
      end

      def code_america_indianapolis?
        Boolean.new(raw_time_zone_names.include?("America/Indianapolis"))
      end

      def code_america_inuvik?
        Boolean.new(raw_time_zone_names.include?("America/Inuvik"))
      end

      def code_america_iqaluit?
        Boolean.new(raw_time_zone_names.include?("America/Iqaluit"))
      end

      def code_america_jamaica?
        Boolean.new(raw_time_zone_names.include?("America/Jamaica"))
      end

      def code_america_jujuy?
        Boolean.new(raw_time_zone_names.include?("America/Jujuy"))
      end

      def code_america_juneau?
        Boolean.new(raw_time_zone_names.include?("America/Juneau"))
      end

      def code_america_kentucky_louisville?
        Boolean.new(raw_time_zone_names.include?("America/Kentucky/Louisville"))
      end

      def code_america_kentucky_monticello?
        Boolean.new(raw_time_zone_names.include?("America/Kentucky/Monticello"))
      end

      def code_america_knox_in?
        Boolean.new(raw_time_zone_names.include?("America/Knox_IN"))
      end

      def code_america_kralendijk?
        Boolean.new(raw_time_zone_names.include?("America/Kralendijk"))
      end

      def code_america_la_paz?
        Boolean.new(raw_time_zone_names.include?("America/La_Paz"))
      end

      def code_america_lima?
        Boolean.new(raw_time_zone_names.include?("America/Lima"))
      end

      def code_america_los_angeles?
        Boolean.new(raw_time_zone_names.include?("America/Los_Angeles"))
      end

      def code_america_louisville?
        Boolean.new(raw_time_zone_names.include?("America/Louisville"))
      end

      def code_america_lower_princes?
        Boolean.new(raw_time_zone_names.include?("America/Lower_Princes"))
      end

      def code_america_maceio?
        Boolean.new(raw_time_zone_names.include?("America/Maceio"))
      end

      def code_america_managua?
        Boolean.new(raw_time_zone_names.include?("America/Managua"))
      end

      def code_america_manaus?
        Boolean.new(raw_time_zone_names.include?("America/Manaus"))
      end

      def code_america_marigot?
        Boolean.new(raw_time_zone_names.include?("America/Marigot"))
      end

      def code_america_martinique?
        Boolean.new(raw_time_zone_names.include?("America/Martinique"))
      end

      def code_america_matamoros?
        Boolean.new(raw_time_zone_names.include?("America/Matamoros"))
      end

      def code_america_mazatlan?
        Boolean.new(raw_time_zone_names.include?("America/Mazatlan"))
      end

      def code_america_mendoza?
        Boolean.new(raw_time_zone_names.include?("America/Mendoza"))
      end

      def code_america_menominee?
        Boolean.new(raw_time_zone_names.include?("America/Menominee"))
      end

      def code_america_merida?
        Boolean.new(raw_time_zone_names.include?("America/Merida"))
      end

      def code_america_metlakatla?
        Boolean.new(raw_time_zone_names.include?("America/Metlakatla"))
      end

      def code_america_mexico_city?
        Boolean.new(raw_time_zone_names.include?("America/Mexico_City"))
      end

      def code_america_miquelon?
        Boolean.new(raw_time_zone_names.include?("America/Miquelon"))
      end

      def code_america_moncton?
        Boolean.new(raw_time_zone_names.include?("America/Moncton"))
      end

      def code_america_monterrey?
        Boolean.new(raw_time_zone_names.include?("America/Monterrey"))
      end

      def code_america_montevideo?
        Boolean.new(raw_time_zone_names.include?("America/Montevideo"))
      end

      def code_america_montreal?
        Boolean.new(raw_time_zone_names.include?("America/Montreal"))
      end

      def code_america_montserrat?
        Boolean.new(raw_time_zone_names.include?("America/Montserrat"))
      end

      def code_america_nassau?
        Boolean.new(raw_time_zone_names.include?("America/Nassau"))
      end

      def code_america_new_york?
        Boolean.new(raw_time_zone_names.include?("America/New_York"))
      end

      def code_america_nipigon?
        Boolean.new(raw_time_zone_names.include?("America/Nipigon"))
      end

      def code_america_nome?
        Boolean.new(raw_time_zone_names.include?("America/Nome"))
      end

      def code_america_noronha?
        Boolean.new(raw_time_zone_names.include?("America/Noronha"))
      end

      def code_america_north_dakota_beulah?
        Boolean.new(raw_time_zone_names.include?("America/North_Dakota/Beulah"))
      end

      def code_america_north_dakota_center?
        Boolean.new(raw_time_zone_names.include?("America/North_Dakota/Center"))
      end

      def code_america_north_dakota_new_salem?
        Boolean.new(raw_time_zone_names.include?("America/North_Dakota/New_Salem"))
      end

      def code_america_nuuk?
        Boolean.new(raw_time_zone_names.include?("America/Nuuk"))
      end

      def code_america_ojinaga?
        Boolean.new(raw_time_zone_names.include?("America/Ojinaga"))
      end

      def code_america_panama?
        Boolean.new(raw_time_zone_names.include?("America/Panama"))
      end

      def code_america_pangnirtung?
        Boolean.new(raw_time_zone_names.include?("America/Pangnirtung"))
      end

      def code_america_paramaribo?
        Boolean.new(raw_time_zone_names.include?("America/Paramaribo"))
      end

      def code_america_phoenix?
        Boolean.new(raw_time_zone_names.include?("America/Phoenix"))
      end

      def code_america_port_minus_au_minus_prince?
        Boolean.new(raw_time_zone_names.include?("America/Port-au-Prince"))
      end

      def code_america_port_of_spain?
        Boolean.new(raw_time_zone_names.include?("America/Port_of_Spain"))
      end

      def code_america_porto_acre?
        Boolean.new(raw_time_zone_names.include?("America/Porto_Acre"))
      end

      def code_america_porto_velho?
        Boolean.new(raw_time_zone_names.include?("America/Porto_Velho"))
      end

      def code_america_puerto_rico?
        Boolean.new(raw_time_zone_names.include?("America/Puerto_Rico"))
      end

      def code_america_punta_arenas?
        Boolean.new(raw_time_zone_names.include?("America/Punta_Arenas"))
      end

      def code_america_rainy_river?
        Boolean.new(raw_time_zone_names.include?("America/Rainy_River"))
      end

      def code_america_rankin_inlet?
        Boolean.new(raw_time_zone_names.include?("America/Rankin_Inlet"))
      end

      def code_america_recife?
        Boolean.new(raw_time_zone_names.include?("America/Recife"))
      end

      def code_america_regina?
        Boolean.new(raw_time_zone_names.include?("America/Regina"))
      end

      def code_america_resolute?
        Boolean.new(raw_time_zone_names.include?("America/Resolute"))
      end

      def code_america_rio_branco?
        Boolean.new(raw_time_zone_names.include?("America/Rio_Branco"))
      end

      def code_america_rosario?
        Boolean.new(raw_time_zone_names.include?("America/Rosario"))
      end

      def code_america_santa_isabel?
        Boolean.new(raw_time_zone_names.include?("America/Santa_Isabel"))
      end

      def code_america_santarem?
        Boolean.new(raw_time_zone_names.include?("America/Santarem"))
      end

      def code_america_santiago?
        Boolean.new(raw_time_zone_names.include?("America/Santiago"))
      end

      def code_america_santo_domingo?
        Boolean.new(raw_time_zone_names.include?("America/Santo_Domingo"))
      end

      def code_america_sao_paulo?
        Boolean.new(raw_time_zone_names.include?("America/Sao_Paulo"))
      end

      def code_america_scoresbysund?
        Boolean.new(raw_time_zone_names.include?("America/Scoresbysund"))
      end

      def code_america_shiprock?
        Boolean.new(raw_time_zone_names.include?("America/Shiprock"))
      end

      def code_america_sitka?
        Boolean.new(raw_time_zone_names.include?("America/Sitka"))
      end

      def code_america_st_barthelemy?
        Boolean.new(raw_time_zone_names.include?("America/St_Barthelemy"))
      end

      def code_america_st_johns?
        Boolean.new(raw_time_zone_names.include?("America/St_Johns"))
      end

      def code_america_st_kitts?
        Boolean.new(raw_time_zone_names.include?("America/St_Kitts"))
      end

      def code_america_st_lucia?
        Boolean.new(raw_time_zone_names.include?("America/St_Lucia"))
      end

      def code_america_st_thomas?
        Boolean.new(raw_time_zone_names.include?("America/St_Thomas"))
      end

      def code_america_st_vincent?
        Boolean.new(raw_time_zone_names.include?("America/St_Vincent"))
      end

      def code_america_swift_current?
        Boolean.new(raw_time_zone_names.include?("America/Swift_Current"))
      end

      def code_america_tegucigalpa?
        Boolean.new(raw_time_zone_names.include?("America/Tegucigalpa"))
      end

      def code_america_thule?
        Boolean.new(raw_time_zone_names.include?("America/Thule"))
      end

      def code_america_thunder_bay?
        Boolean.new(raw_time_zone_names.include?("America/Thunder_Bay"))
      end

      def code_america_tijuana?
        Boolean.new(raw_time_zone_names.include?("America/Tijuana"))
      end

      def code_america_toronto?
        Boolean.new(raw_time_zone_names.include?("America/Toronto"))
      end

      def code_america_tortola?
        Boolean.new(raw_time_zone_names.include?("America/Tortola"))
      end

      def code_america_vancouver?
        Boolean.new(raw_time_zone_names.include?("America/Vancouver"))
      end

      def code_america_virgin?
        Boolean.new(raw_time_zone_names.include?("America/Virgin"))
      end

      def code_america_whitehorse?
        Boolean.new(raw_time_zone_names.include?("America/Whitehorse"))
      end

      def code_america_winnipeg?
        Boolean.new(raw_time_zone_names.include?("America/Winnipeg"))
      end

      def code_america_yakutat?
        Boolean.new(raw_time_zone_names.include?("America/Yakutat"))
      end

      def code_america_yellowknife?
        Boolean.new(raw_time_zone_names.include?("America/Yellowknife"))
      end

      def code_antarctica_casey?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Casey"))
      end

      def code_antarctica_davis?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Davis"))
      end

      def code_antarctica_dumontdurville?
        Boolean.new(raw_time_zone_names.include?("Antarctica/DumontDUrville"))
      end

      def code_antarctica_macquarie?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Macquarie"))
      end

      def code_antarctica_mawson?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Mawson"))
      end

      def code_antarctica_mcmurdo?
        Boolean.new(raw_time_zone_names.include?("Antarctica/McMurdo"))
      end

      def code_antarctica_palmer?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Palmer"))
      end

      def code_antarctica_rothera?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Rothera"))
      end

      def code_antarctica_south_pole?
        Boolean.new(raw_time_zone_names.include?("Antarctica/South_Pole"))
      end

      def code_antarctica_syowa?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Syowa"))
      end

      def code_antarctica_troll?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Troll"))
      end

      def code_antarctica_vostok?
        Boolean.new(raw_time_zone_names.include?("Antarctica/Vostok"))
      end

      def code_arctic_longyearbyen?
        Boolean.new(raw_time_zone_names.include?("Arctic/Longyearbyen"))
      end

      def code_asia_aden?
        Boolean.new(raw_time_zone_names.include?("Asia/Aden"))
      end

      def code_asia_almaty?
        Boolean.new(raw_time_zone_names.include?("Asia/Almaty"))
      end

      def code_asia_amman?
        Boolean.new(raw_time_zone_names.include?("Asia/Amman"))
      end

      def code_asia_anadyr?
        Boolean.new(raw_time_zone_names.include?("Asia/Anadyr"))
      end

      def code_asia_aqtau?
        Boolean.new(raw_time_zone_names.include?("Asia/Aqtau"))
      end

      def code_asia_aqtobe?
        Boolean.new(raw_time_zone_names.include?("Asia/Aqtobe"))
      end

      def code_asia_ashgabat?
        Boolean.new(raw_time_zone_names.include?("Asia/Ashgabat"))
      end

      def code_asia_ashkhabad?
        Boolean.new(raw_time_zone_names.include?("Asia/Ashkhabad"))
      end

      def code_asia_atyrau?
        Boolean.new(raw_time_zone_names.include?("Asia/Atyrau"))
      end

      def code_asia_baghdad?
        Boolean.new(raw_time_zone_names.include?("Asia/Baghdad"))
      end

      def code_asia_bahrain?
        Boolean.new(raw_time_zone_names.include?("Asia/Bahrain"))
      end

      def code_asia_baku?
        Boolean.new(raw_time_zone_names.include?("Asia/Baku"))
      end

      def code_asia_bangkok?
        Boolean.new(raw_time_zone_names.include?("Asia/Bangkok"))
      end

      def code_asia_barnaul?
        Boolean.new(raw_time_zone_names.include?("Asia/Barnaul"))
      end

      def code_asia_beirut?
        Boolean.new(raw_time_zone_names.include?("Asia/Beirut"))
      end

      def code_asia_bishkek?
        Boolean.new(raw_time_zone_names.include?("Asia/Bishkek"))
      end

      def code_asia_brunei?
        Boolean.new(raw_time_zone_names.include?("Asia/Brunei"))
      end

      def code_asia_calcutta?
        Boolean.new(raw_time_zone_names.include?("Asia/Calcutta"))
      end

      def code_asia_chita?
        Boolean.new(raw_time_zone_names.include?("Asia/Chita"))
      end

      def code_asia_choibalsan?
        Boolean.new(raw_time_zone_names.include?("Asia/Choibalsan"))
      end

      def code_asia_chongqing?
        Boolean.new(raw_time_zone_names.include?("Asia/Chongqing"))
      end

      def code_asia_chungking?
        Boolean.new(raw_time_zone_names.include?("Asia/Chungking"))
      end

      def code_asia_colombo?
        Boolean.new(raw_time_zone_names.include?("Asia/Colombo"))
      end

      def code_asia_dacca?
        Boolean.new(raw_time_zone_names.include?("Asia/Dacca"))
      end

      def code_asia_damascus?
        Boolean.new(raw_time_zone_names.include?("Asia/Damascus"))
      end

      def code_asia_dhaka?
        Boolean.new(raw_time_zone_names.include?("Asia/Dhaka"))
      end

      def code_asia_dili?
        Boolean.new(raw_time_zone_names.include?("Asia/Dili"))
      end

      def code_asia_dubai?
        Boolean.new(raw_time_zone_names.include?("Asia/Dubai"))
      end

      def code_asia_dushanbe?
        Boolean.new(raw_time_zone_names.include?("Asia/Dushanbe"))
      end

      def code_asia_famagusta?
        Boolean.new(raw_time_zone_names.include?("Asia/Famagusta"))
      end

      def code_asia_gaza?
        Boolean.new(raw_time_zone_names.include?("Asia/Gaza"))
      end

      def code_asia_harbin?
        Boolean.new(raw_time_zone_names.include?("Asia/Harbin"))
      end

      def code_asia_hebron?
        Boolean.new(raw_time_zone_names.include?("Asia/Hebron"))
      end

      def code_asia_ho_chi_minh?
        Boolean.new(raw_time_zone_names.include?("Asia/Ho_Chi_Minh"))
      end

      def code_asia_hong_kong?
        Boolean.new(raw_time_zone_names.include?("Asia/Hong_Kong"))
      end

      def code_asia_hovd?
        Boolean.new(raw_time_zone_names.include?("Asia/Hovd"))
      end

      def code_asia_irkutsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Irkutsk"))
      end

      def code_asia_istanbul?
        Boolean.new(raw_time_zone_names.include?("Asia/Istanbul"))
      end

      def code_asia_jakarta?
        Boolean.new(raw_time_zone_names.include?("Asia/Jakarta"))
      end

      def code_asia_jayapura?
        Boolean.new(raw_time_zone_names.include?("Asia/Jayapura"))
      end

      def code_asia_jerusalem?
        Boolean.new(raw_time_zone_names.include?("Asia/Jerusalem"))
      end

      def code_asia_kabul?
        Boolean.new(raw_time_zone_names.include?("Asia/Kabul"))
      end

      def code_asia_kamchatka?
        Boolean.new(raw_time_zone_names.include?("Asia/Kamchatka"))
      end

      def code_asia_karachi?
        Boolean.new(raw_time_zone_names.include?("Asia/Karachi"))
      end

      def code_asia_kashgar?
        Boolean.new(raw_time_zone_names.include?("Asia/Kashgar"))
      end

      def code_asia_kathmandu?
        Boolean.new(raw_time_zone_names.include?("Asia/Kathmandu"))
      end

      def code_asia_katmandu?
        Boolean.new(raw_time_zone_names.include?("Asia/Katmandu"))
      end

      def code_asia_khandyga?
        Boolean.new(raw_time_zone_names.include?("Asia/Khandyga"))
      end

      def code_asia_kolkata?
        Boolean.new(raw_time_zone_names.include?("Asia/Kolkata"))
      end

      def code_asia_krasnoyarsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Krasnoyarsk"))
      end

      def code_asia_kuala_lumpur?
        Boolean.new(raw_time_zone_names.include?("Asia/Kuala_Lumpur"))
      end

      def code_asia_kuching?
        Boolean.new(raw_time_zone_names.include?("Asia/Kuching"))
      end

      def code_asia_kuwait?
        Boolean.new(raw_time_zone_names.include?("Asia/Kuwait"))
      end

      def code_asia_macao?
        Boolean.new(raw_time_zone_names.include?("Asia/Macao"))
      end

      def code_asia_macau?
        Boolean.new(raw_time_zone_names.include?("Asia/Macau"))
      end

      def code_asia_magadan?
        Boolean.new(raw_time_zone_names.include?("Asia/Magadan"))
      end

      def code_asia_makassar?
        Boolean.new(raw_time_zone_names.include?("Asia/Makassar"))
      end

      def code_asia_manila?
        Boolean.new(raw_time_zone_names.include?("Asia/Manila"))
      end

      def code_asia_muscat?
        Boolean.new(raw_time_zone_names.include?("Asia/Muscat"))
      end

      def code_asia_nicosia?
        Boolean.new(raw_time_zone_names.include?("Asia/Nicosia"))
      end

      def code_asia_novokuznetsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Novokuznetsk"))
      end

      def code_asia_novosibirsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Novosibirsk"))
      end

      def code_asia_omsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Omsk"))
      end

      def code_asia_oral?
        Boolean.new(raw_time_zone_names.include?("Asia/Oral"))
      end

      def code_asia_phnom_penh?
        Boolean.new(raw_time_zone_names.include?("Asia/Phnom_Penh"))
      end

      def code_asia_pontianak?
        Boolean.new(raw_time_zone_names.include?("Asia/Pontianak"))
      end

      def code_asia_pyongyang?
        Boolean.new(raw_time_zone_names.include?("Asia/Pyongyang"))
      end

      def code_asia_qatar?
        Boolean.new(raw_time_zone_names.include?("Asia/Qatar"))
      end

      def code_asia_qostanay?
        Boolean.new(raw_time_zone_names.include?("Asia/Qostanay"))
      end

      def code_asia_qyzylorda?
        Boolean.new(raw_time_zone_names.include?("Asia/Qyzylorda"))
      end

      def code_asia_rangoon?
        Boolean.new(raw_time_zone_names.include?("Asia/Rangoon"))
      end

      def code_asia_riyadh?
        Boolean.new(raw_time_zone_names.include?("Asia/Riyadh"))
      end

      def code_asia_saigon?
        Boolean.new(raw_time_zone_names.include?("Asia/Saigon"))
      end

      def code_asia_sakhalin?
        Boolean.new(raw_time_zone_names.include?("Asia/Sakhalin"))
      end

      def code_asia_samarkand?
        Boolean.new(raw_time_zone_names.include?("Asia/Samarkand"))
      end

      def code_asia_seoul?
        Boolean.new(raw_time_zone_names.include?("Asia/Seoul"))
      end

      def code_asia_shanghai?
        Boolean.new(raw_time_zone_names.include?("Asia/Shanghai"))
      end

      def code_asia_singapore?
        Boolean.new(raw_time_zone_names.include?("Asia/Singapore"))
      end

      def code_asia_srednekolymsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Srednekolymsk"))
      end

      def code_asia_taipei?
        Boolean.new(raw_time_zone_names.include?("Asia/Taipei"))
      end

      def code_asia_tashkent?
        Boolean.new(raw_time_zone_names.include?("Asia/Tashkent"))
      end

      def code_asia_tbilisi?
        Boolean.new(raw_time_zone_names.include?("Asia/Tbilisi"))
      end

      def code_asia_tehran?
        Boolean.new(raw_time_zone_names.include?("Asia/Tehran"))
      end

      def code_asia_tel_aviv?
        Boolean.new(raw_time_zone_names.include?("Asia/Tel_Aviv"))
      end

      def code_asia_thimbu?
        Boolean.new(raw_time_zone_names.include?("Asia/Thimbu"))
      end

      def code_asia_thimphu?
        Boolean.new(raw_time_zone_names.include?("Asia/Thimphu"))
      end

      def code_asia_tokyo?
        Boolean.new(raw_time_zone_names.include?("Asia/Tokyo"))
      end

      def code_asia_tomsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Tomsk"))
      end

      def code_asia_ujung_pandang?
        Boolean.new(raw_time_zone_names.include?("Asia/Ujung_Pandang"))
      end

      def code_asia_ulaanbaatar?
        Boolean.new(raw_time_zone_names.include?("Asia/Ulaanbaatar"))
      end

      def code_asia_ulan_bator?
        Boolean.new(raw_time_zone_names.include?("Asia/Ulan_Bator"))
      end

      def code_asia_urumqi?
        Boolean.new(raw_time_zone_names.include?("Asia/Urumqi"))
      end

      def code_asia_ust_minus_nera?
        Boolean.new(raw_time_zone_names.include?("Asia/Ust-Nera"))
      end

      def code_asia_vientiane?
        Boolean.new(raw_time_zone_names.include?("Asia/Vientiane"))
      end

      def code_asia_vladivostok?
        Boolean.new(raw_time_zone_names.include?("Asia/Vladivostok"))
      end

      def code_asia_yakutsk?
        Boolean.new(raw_time_zone_names.include?("Asia/Yakutsk"))
      end

      def code_asia_yangon?
        Boolean.new(raw_time_zone_names.include?("Asia/Yangon"))
      end

      def code_asia_yekaterinburg?
        Boolean.new(raw_time_zone_names.include?("Asia/Yekaterinburg"))
      end

      def code_asia_yerevan?
        Boolean.new(raw_time_zone_names.include?("Asia/Yerevan"))
      end

      def code_atlantic_azores?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Azores"))
      end

      def code_atlantic_bermuda?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Bermuda"))
      end

      def code_atlantic_canary?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Canary"))
      end

      def code_atlantic_cape_verde?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Cape_Verde"))
      end

      def code_atlantic_faeroe?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Faeroe"))
      end

      def code_atlantic_faroe?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Faroe"))
      end

      def code_atlantic_jan_mayen?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Jan_Mayen"))
      end

      def code_atlantic_madeira?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Madeira"))
      end

      def code_atlantic_reykjavik?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Reykjavik"))
      end

      def code_atlantic_south_georgia?
        Boolean.new(raw_time_zone_names.include?("Atlantic/South_Georgia"))
      end

      def code_atlantic_st_helena?
        Boolean.new(raw_time_zone_names.include?("Atlantic/St_Helena"))
      end

      def code_atlantic_stanley?
        Boolean.new(raw_time_zone_names.include?("Atlantic/Stanley"))
      end

      def code_australia_act?
        Boolean.new(raw_time_zone_names.include?("Australia/ACT"))
      end

      def code_australia_adelaide?
        Boolean.new(raw_time_zone_names.include?("Australia/Adelaide"))
      end

      def code_australia_brisbane?
        Boolean.new(raw_time_zone_names.include?("Australia/Brisbane"))
      end

      def code_australia_broken_hill?
        Boolean.new(raw_time_zone_names.include?("Australia/Broken_Hill"))
      end

      def code_australia_canberra?
        Boolean.new(raw_time_zone_names.include?("Australia/Canberra"))
      end

      def code_australia_currie?
        Boolean.new(raw_time_zone_names.include?("Australia/Currie"))
      end

      def code_australia_darwin?
        Boolean.new(raw_time_zone_names.include?("Australia/Darwin"))
      end

      def code_australia_eucla?
        Boolean.new(raw_time_zone_names.include?("Australia/Eucla"))
      end

      def code_australia_hobart?
        Boolean.new(raw_time_zone_names.include?("Australia/Hobart"))
      end

      def code_australia_lhi?
        Boolean.new(raw_time_zone_names.include?("Australia/LHI"))
      end

      def code_australia_lindeman?
        Boolean.new(raw_time_zone_names.include?("Australia/Lindeman"))
      end

      def code_australia_lord_howe?
        Boolean.new(raw_time_zone_names.include?("Australia/Lord_Howe"))
      end

      def code_australia_melbourne?
        Boolean.new(raw_time_zone_names.include?("Australia/Melbourne"))
      end

      def code_australia_nsw?
        Boolean.new(raw_time_zone_names.include?("Australia/NSW"))
      end

      def code_australia_north?
        Boolean.new(raw_time_zone_names.include?("Australia/North"))
      end

      def code_australia_perth?
        Boolean.new(raw_time_zone_names.include?("Australia/Perth"))
      end

      def code_australia_queensland?
        Boolean.new(raw_time_zone_names.include?("Australia/Queensland"))
      end

      def code_australia_south?
        Boolean.new(raw_time_zone_names.include?("Australia/South"))
      end

      def code_australia_sydney?
        Boolean.new(raw_time_zone_names.include?("Australia/Sydney"))
      end

      def code_australia_tasmania?
        Boolean.new(raw_time_zone_names.include?("Australia/Tasmania"))
      end

      def code_australia_victoria?
        Boolean.new(raw_time_zone_names.include?("Australia/Victoria"))
      end

      def code_australia_west?
        Boolean.new(raw_time_zone_names.include?("Australia/West"))
      end

      def code_australia_yancowinna?
        Boolean.new(raw_time_zone_names.include?("Australia/Yancowinna"))
      end

      def code_brazil_acre?
        Boolean.new(raw_time_zone_names.include?("Brazil/Acre"))
      end

      def code_brazil_denoronha?
        Boolean.new(raw_time_zone_names.include?("Brazil/DeNoronha"))
      end

      def code_brazil_east?
        Boolean.new(raw_time_zone_names.include?("Brazil/East"))
      end

      def code_brazil_west?
        Boolean.new(raw_time_zone_names.include?("Brazil/West"))
      end

      def code_cet?
        Boolean.new(raw_time_zone_names.include?("CET"))
      end

      def code_cst6cdt?
        Boolean.new(raw_time_zone_names.include?("CST6CDT"))
      end

      def code_canada_atlantic?
        Boolean.new(raw_time_zone_names.include?("Canada/Atlantic"))
      end

      def code_canada_central?
        Boolean.new(raw_time_zone_names.include?("Canada/Central"))
      end

      def code_canada_eastern?
        Boolean.new(raw_time_zone_names.include?("Canada/Eastern"))
      end

      def code_canada_mountain?
        Boolean.new(raw_time_zone_names.include?("Canada/Mountain"))
      end

      def code_canada_newfoundland?
        Boolean.new(raw_time_zone_names.include?("Canada/Newfoundland"))
      end

      def code_canada_pacific?
        Boolean.new(raw_time_zone_names.include?("Canada/Pacific"))
      end

      def code_canada_saskatchewan?
        Boolean.new(raw_time_zone_names.include?("Canada/Saskatchewan"))
      end

      def code_canada_yukon?
        Boolean.new(raw_time_zone_names.include?("Canada/Yukon"))
      end

      def code_chile_continental?
        Boolean.new(raw_time_zone_names.include?("Chile/Continental"))
      end

      def code_chile_easterisland?
        Boolean.new(raw_time_zone_names.include?("Chile/EasterIsland"))
      end

      def code_cuba?
        Boolean.new(raw_time_zone_names.include?("Cuba"))
      end

      def code_eet?
        Boolean.new(raw_time_zone_names.include?("EET"))
      end

      def code_est?
        Boolean.new(raw_time_zone_names.include?("EST"))
      end

      def code_est5edt?
        Boolean.new(raw_time_zone_names.include?("EST5EDT"))
      end

      def code_egypt?
        Boolean.new(raw_time_zone_names.include?("Egypt"))
      end

      def code_eire?
        Boolean.new(raw_time_zone_names.include?("Eire"))
      end

      def code_etc_gmt?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT"))
      end

      def code_etc_gmt_plus_0?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+0"))
      end

      def code_etc_gmt_plus_1?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+1"))
      end

      def code_etc_gmt_plus_10?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+10"))
      end

      def code_etc_gmt_plus_11?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+11"))
      end

      def code_etc_gmt_plus_12?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+12"))
      end

      def code_etc_gmt_plus_2?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+2"))
      end

      def code_etc_gmt_plus_3?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+3"))
      end

      def code_etc_gmt_plus_4?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+4"))
      end

      def code_etc_gmt_plus_5?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+5"))
      end

      def code_etc_gmt_plus_6?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+6"))
      end

      def code_etc_gmt_plus_7?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+7"))
      end

      def code_etc_gmt_plus_8?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+8"))
      end

      def code_etc_gmt_plus_9?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT+9"))
      end

      def code_etc_gmt_minus_0?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-0"))
      end

      def code_etc_gmt_minus_1?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-1"))
      end

      def code_etc_gmt_minus_10?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-10"))
      end

      def code_etc_gmt_minus_11?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-11"))
      end

      def code_etc_gmt_minus_12?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-12"))
      end

      def code_etc_gmt_minus_13?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-13"))
      end

      def code_etc_gmt_minus_14?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-14"))
      end

      def code_etc_gmt_minus_2?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-2"))
      end

      def code_etc_gmt_minus_3?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-3"))
      end

      def code_etc_gmt_minus_4?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-4"))
      end

      def code_etc_gmt_minus_5?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-5"))
      end

      def code_etc_gmt_minus_6?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-6"))
      end

      def code_etc_gmt_minus_7?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-7"))
      end

      def code_etc_gmt_minus_8?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-8"))
      end

      def code_etc_gmt_minus_9?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT-9"))
      end

      def code_etc_gmt0?
        Boolean.new(raw_time_zone_names.include?("Etc/GMT0"))
      end

      def code_etc_greenwich?
        Boolean.new(raw_time_zone_names.include?("Etc/Greenwich"))
      end

      def code_etc_uct?
        Boolean.new(raw_time_zone_names.include?("Etc/UCT"))
      end

      def code_etc_utc?
        Boolean.new(raw_time_zone_names.include?("Etc/UTC"))
      end

      def code_etc_universal?
        Boolean.new(raw_time_zone_names.include?("Etc/Universal"))
      end

      def code_etc_zulu?
        Boolean.new(raw_time_zone_names.include?("Etc/Zulu"))
      end

      def code_europe_amsterdam?
        Boolean.new(raw_time_zone_names.include?("Europe/Amsterdam"))
      end

      def code_europe_andorra?
        Boolean.new(raw_time_zone_names.include?("Europe/Andorra"))
      end

      def code_europe_astrakhan?
        Boolean.new(raw_time_zone_names.include?("Europe/Astrakhan"))
      end

      def code_europe_athens?
        Boolean.new(raw_time_zone_names.include?("Europe/Athens"))
      end

      def code_europe_belfast?
        Boolean.new(raw_time_zone_names.include?("Europe/Belfast"))
      end

      def code_europe_belgrade?
        Boolean.new(raw_time_zone_names.include?("Europe/Belgrade"))
      end

      def code_europe_berlin?
        Boolean.new(raw_time_zone_names.include?("Europe/Berlin"))
      end

      def code_europe_bratislava?
        Boolean.new(raw_time_zone_names.include?("Europe/Bratislava"))
      end

      def code_europe_brussels?
        Boolean.new(raw_time_zone_names.include?("Europe/Brussels"))
      end

      def code_europe_bucharest?
        Boolean.new(raw_time_zone_names.include?("Europe/Bucharest"))
      end

      def code_europe_budapest?
        Boolean.new(raw_time_zone_names.include?("Europe/Budapest"))
      end

      def code_europe_busingen?
        Boolean.new(raw_time_zone_names.include?("Europe/Busingen"))
      end

      def code_europe_chisinau?
        Boolean.new(raw_time_zone_names.include?("Europe/Chisinau"))
      end

      def code_europe_copenhagen?
        Boolean.new(raw_time_zone_names.include?("Europe/Copenhagen"))
      end

      def code_europe_dublin?
        Boolean.new(raw_time_zone_names.include?("Europe/Dublin"))
      end

      def code_europe_gibraltar?
        Boolean.new(raw_time_zone_names.include?("Europe/Gibraltar"))
      end

      def code_europe_guernsey?
        Boolean.new(raw_time_zone_names.include?("Europe/Guernsey"))
      end

      def code_europe_helsinki?
        Boolean.new(raw_time_zone_names.include?("Europe/Helsinki"))
      end

      def code_europe_isle_of_man?
        Boolean.new(raw_time_zone_names.include?("Europe/Isle_of_Man"))
      end

      def code_europe_istanbul?
        Boolean.new(raw_time_zone_names.include?("Europe/Istanbul"))
      end

      def code_europe_jersey?
        Boolean.new(raw_time_zone_names.include?("Europe/Jersey"))
      end

      def code_europe_kaliningrad?
        Boolean.new(raw_time_zone_names.include?("Europe/Kaliningrad"))
      end

      def code_europe_kiev?
        Boolean.new(raw_time_zone_names.include?("Europe/Kiev"))
      end

      def code_europe_kirov?
        Boolean.new(raw_time_zone_names.include?("Europe/Kirov"))
      end

      def code_europe_kyiv?
        Boolean.new(raw_time_zone_names.include?("Europe/Kyiv"))
      end

      def code_europe_lisbon?
        Boolean.new(raw_time_zone_names.include?("Europe/Lisbon"))
      end

      def code_europe_ljubljana?
        Boolean.new(raw_time_zone_names.include?("Europe/Ljubljana"))
      end

      def code_europe_london?
        Boolean.new(raw_time_zone_names.include?("Europe/London"))
      end

      def code_europe_luxembourg?
        Boolean.new(raw_time_zone_names.include?("Europe/Luxembourg"))
      end

      def code_europe_madrid?
        Boolean.new(raw_time_zone_names.include?("Europe/Madrid"))
      end

      def code_europe_malta?
        Boolean.new(raw_time_zone_names.include?("Europe/Malta"))
      end

      def code_europe_mariehamn?
        Boolean.new(raw_time_zone_names.include?("Europe/Mariehamn"))
      end

      def code_europe_minsk?
        Boolean.new(raw_time_zone_names.include?("Europe/Minsk"))
      end

      def code_europe_monaco?
        Boolean.new(raw_time_zone_names.include?("Europe/Monaco"))
      end

      def code_europe_moscow?
        Boolean.new(raw_time_zone_names.include?("Europe/Moscow"))
      end

      def code_europe_nicosia?
        Boolean.new(raw_time_zone_names.include?("Europe/Nicosia"))
      end

      def code_europe_oslo?
        Boolean.new(raw_time_zone_names.include?("Europe/Oslo"))
      end

      def code_europe_paris?
        Boolean.new(raw_time_zone_names.include?("Europe/Paris"))
      end

      def code_europe_podgorica?
        Boolean.new(raw_time_zone_names.include?("Europe/Podgorica"))
      end

      def code_europe_prague?
        Boolean.new(raw_time_zone_names.include?("Europe/Prague"))
      end

      def code_europe_riga?
        Boolean.new(raw_time_zone_names.include?("Europe/Riga"))
      end

      def code_europe_rome?
        Boolean.new(raw_time_zone_names.include?("Europe/Rome"))
      end

      def code_europe_samara?
        Boolean.new(raw_time_zone_names.include?("Europe/Samara"))
      end

      def code_europe_san_marino?
        Boolean.new(raw_time_zone_names.include?("Europe/San_Marino"))
      end

      def code_europe_sarajevo?
        Boolean.new(raw_time_zone_names.include?("Europe/Sarajevo"))
      end

      def code_europe_saratov?
        Boolean.new(raw_time_zone_names.include?("Europe/Saratov"))
      end

      def code_europe_simferopol?
        Boolean.new(raw_time_zone_names.include?("Europe/Simferopol"))
      end

      def code_europe_skopje?
        Boolean.new(raw_time_zone_names.include?("Europe/Skopje"))
      end

      def code_europe_sofia?
        Boolean.new(raw_time_zone_names.include?("Europe/Sofia"))
      end

      def code_europe_stockholm?
        Boolean.new(raw_time_zone_names.include?("Europe/Stockholm"))
      end

      def code_europe_tallinn?
        Boolean.new(raw_time_zone_names.include?("Europe/Tallinn"))
      end

      def code_europe_tirane?
        Boolean.new(raw_time_zone_names.include?("Europe/Tirane"))
      end

      def code_europe_tiraspol?
        Boolean.new(raw_time_zone_names.include?("Europe/Tiraspol"))
      end

      def code_europe_ulyanovsk?
        Boolean.new(raw_time_zone_names.include?("Europe/Ulyanovsk"))
      end

      def code_europe_uzhgorod?
        Boolean.new(raw_time_zone_names.include?("Europe/Uzhgorod"))
      end

      def code_europe_vaduz?
        Boolean.new(raw_time_zone_names.include?("Europe/Vaduz"))
      end

      def code_europe_vatican?
        Boolean.new(raw_time_zone_names.include?("Europe/Vatican"))
      end

      def code_europe_vienna?
        Boolean.new(raw_time_zone_names.include?("Europe/Vienna"))
      end

      def code_europe_vilnius?
        Boolean.new(raw_time_zone_names.include?("Europe/Vilnius"))
      end

      def code_europe_volgograd?
        Boolean.new(raw_time_zone_names.include?("Europe/Volgograd"))
      end

      def code_europe_warsaw?
        Boolean.new(raw_time_zone_names.include?("Europe/Warsaw"))
      end

      def code_europe_zagreb?
        Boolean.new(raw_time_zone_names.include?("Europe/Zagreb"))
      end

      def code_europe_zaporozhye?
        Boolean.new(raw_time_zone_names.include?("Europe/Zaporozhye"))
      end

      def code_europe_zurich?
        Boolean.new(raw_time_zone_names.include?("Europe/Zurich"))
      end

      def code_factory?
        Boolean.new(raw_time_zone_names.include?("Factory"))
      end

      def code_gb?
        Boolean.new(raw_time_zone_names.include?("GB"))
      end

      def code_gb_minus_eire?
        Boolean.new(raw_time_zone_names.include?("GB-Eire"))
      end

      def code_gmt?
        Boolean.new(raw_time_zone_names.include?("GMT"))
      end

      def code_gmt_plus_0?
        Boolean.new(raw_time_zone_names.include?("GMT+0"))
      end

      def code_gmt_minus_0?
        Boolean.new(raw_time_zone_names.include?("GMT-0"))
      end

      def code_gmt0?
        Boolean.new(raw_time_zone_names.include?("GMT0"))
      end

      def code_greenwich?
        Boolean.new(raw_time_zone_names.include?("Greenwich"))
      end

      def code_hst?
        Boolean.new(raw_time_zone_names.include?("HST"))
      end

      def code_hongkong?
        Boolean.new(raw_time_zone_names.include?("Hongkong"))
      end

      def code_iceland?
        Boolean.new(raw_time_zone_names.include?("Iceland"))
      end

      def code_indian_antananarivo?
        Boolean.new(raw_time_zone_names.include?("Indian/Antananarivo"))
      end

      def code_indian_chagos?
        Boolean.new(raw_time_zone_names.include?("Indian/Chagos"))
      end

      def code_indian_christmas?
        Boolean.new(raw_time_zone_names.include?("Indian/Christmas"))
      end

      def code_indian_cocos?
        Boolean.new(raw_time_zone_names.include?("Indian/Cocos"))
      end

      def code_indian_comoro?
        Boolean.new(raw_time_zone_names.include?("Indian/Comoro"))
      end

      def code_indian_kerguelen?
        Boolean.new(raw_time_zone_names.include?("Indian/Kerguelen"))
      end

      def code_indian_mahe?
        Boolean.new(raw_time_zone_names.include?("Indian/Mahe"))
      end

      def code_indian_maldives?
        Boolean.new(raw_time_zone_names.include?("Indian/Maldives"))
      end

      def code_indian_mauritius?
        Boolean.new(raw_time_zone_names.include?("Indian/Mauritius"))
      end

      def code_indian_mayotte?
        Boolean.new(raw_time_zone_names.include?("Indian/Mayotte"))
      end

      def code_indian_reunion?
        Boolean.new(raw_time_zone_names.include?("Indian/Reunion"))
      end

      def code_iran?
        Boolean.new(raw_time_zone_names.include?("Iran"))
      end

      def code_israel?
        Boolean.new(raw_time_zone_names.include?("Israel"))
      end

      def code_jamaica?
        Boolean.new(raw_time_zone_names.include?("Jamaica"))
      end

      def code_japan?
        Boolean.new(raw_time_zone_names.include?("Japan"))
      end

      def code_kwajalein?
        Boolean.new(raw_time_zone_names.include?("Kwajalein"))
      end

      def code_libya?
        Boolean.new(raw_time_zone_names.include?("Libya"))
      end

      def code_met?
        Boolean.new(raw_time_zone_names.include?("MET"))
      end

      def code_mst?
        Boolean.new(raw_time_zone_names.include?("MST"))
      end

      def code_mst7mdt?
        Boolean.new(raw_time_zone_names.include?("MST7MDT"))
      end

      def code_mexico_bajanorte?
        Boolean.new(raw_time_zone_names.include?("Mexico/BajaNorte"))
      end

      def code_mexico_bajasur?
        Boolean.new(raw_time_zone_names.include?("Mexico/BajaSur"))
      end

      def code_mexico_general?
        Boolean.new(raw_time_zone_names.include?("Mexico/General"))
      end

      def code_nz?
        Boolean.new(raw_time_zone_names.include?("NZ"))
      end

      def code_nz_minus_chat?
        Boolean.new(raw_time_zone_names.include?("NZ-CHAT"))
      end

      def code_navajo?
        Boolean.new(raw_time_zone_names.include?("Navajo"))
      end

      def code_prc?
        Boolean.new(raw_time_zone_names.include?("PRC"))
      end

      def code_pst8pdt?
        Boolean.new(raw_time_zone_names.include?("PST8PDT"))
      end

      def code_pacific_apia?
        Boolean.new(raw_time_zone_names.include?("Pacific/Apia"))
      end

      def code_pacific_auckland?
        Boolean.new(raw_time_zone_names.include?("Pacific/Auckland"))
      end

      def code_pacific_bougainville?
        Boolean.new(raw_time_zone_names.include?("Pacific/Bougainville"))
      end

      def code_pacific_chatham?
        Boolean.new(raw_time_zone_names.include?("Pacific/Chatham"))
      end

      def code_pacific_chuuk?
        Boolean.new(raw_time_zone_names.include?("Pacific/Chuuk"))
      end

      def code_pacific_easter?
        Boolean.new(raw_time_zone_names.include?("Pacific/Easter"))
      end

      def code_pacific_efate?
        Boolean.new(raw_time_zone_names.include?("Pacific/Efate"))
      end

      def code_pacific_enderbury?
        Boolean.new(raw_time_zone_names.include?("Pacific/Enderbury"))
      end

      def code_pacific_fakaofo?
        Boolean.new(raw_time_zone_names.include?("Pacific/Fakaofo"))
      end

      def code_pacific_fiji?
        Boolean.new(raw_time_zone_names.include?("Pacific/Fiji"))
      end

      def code_pacific_funafuti?
        Boolean.new(raw_time_zone_names.include?("Pacific/Funafuti"))
      end

      def code_pacific_galapagos?
        Boolean.new(raw_time_zone_names.include?("Pacific/Galapagos"))
      end

      def code_pacific_gambier?
        Boolean.new(raw_time_zone_names.include?("Pacific/Gambier"))
      end

      def code_pacific_guadalcanal?
        Boolean.new(raw_time_zone_names.include?("Pacific/Guadalcanal"))
      end

      def code_pacific_guam?
        Boolean.new(raw_time_zone_names.include?("Pacific/Guam"))
      end

      def code_pacific_honolulu?
        Boolean.new(raw_time_zone_names.include?("Pacific/Honolulu"))
      end

      def code_pacific_johnston?
        Boolean.new(raw_time_zone_names.include?("Pacific/Johnston"))
      end

      def code_pacific_kanton?
        Boolean.new(raw_time_zone_names.include?("Pacific/Kanton"))
      end

      def code_pacific_kiritimati?
        Boolean.new(raw_time_zone_names.include?("Pacific/Kiritimati"))
      end

      def code_pacific_kosrae?
        Boolean.new(raw_time_zone_names.include?("Pacific/Kosrae"))
      end

      def code_pacific_kwajalein?
        Boolean.new(raw_time_zone_names.include?("Pacific/Kwajalein"))
      end

      def code_pacific_majuro?
        Boolean.new(raw_time_zone_names.include?("Pacific/Majuro"))
      end

      def code_pacific_marquesas?
        Boolean.new(raw_time_zone_names.include?("Pacific/Marquesas"))
      end

      def code_pacific_midway?
        Boolean.new(raw_time_zone_names.include?("Pacific/Midway"))
      end

      def code_pacific_nauru?
        Boolean.new(raw_time_zone_names.include?("Pacific/Nauru"))
      end

      def code_pacific_niue?
        Boolean.new(raw_time_zone_names.include?("Pacific/Niue"))
      end

      def code_pacific_norfolk?
        Boolean.new(raw_time_zone_names.include?("Pacific/Norfolk"))
      end

      def code_pacific_noumea?
        Boolean.new(raw_time_zone_names.include?("Pacific/Noumea"))
      end

      def code_pacific_pago_pago?
        Boolean.new(raw_time_zone_names.include?("Pacific/Pago_Pago"))
      end

      def code_pacific_palau?
        Boolean.new(raw_time_zone_names.include?("Pacific/Palau"))
      end

      def code_pacific_pitcairn?
        Boolean.new(raw_time_zone_names.include?("Pacific/Pitcairn"))
      end

      def code_pacific_pohnpei?
        Boolean.new(raw_time_zone_names.include?("Pacific/Pohnpei"))
      end

      def code_pacific_ponape?
        Boolean.new(raw_time_zone_names.include?("Pacific/Ponape"))
      end

      def code_pacific_port_moresby?
        Boolean.new(raw_time_zone_names.include?("Pacific/Port_Moresby"))
      end

      def code_pacific_rarotonga?
        Boolean.new(raw_time_zone_names.include?("Pacific/Rarotonga"))
      end

      def code_pacific_saipan?
        Boolean.new(raw_time_zone_names.include?("Pacific/Saipan"))
      end

      def code_pacific_samoa?
        Boolean.new(raw_time_zone_names.include?("Pacific/Samoa"))
      end

      def code_pacific_tahiti?
        Boolean.new(raw_time_zone_names.include?("Pacific/Tahiti"))
      end

      def code_pacific_tarawa?
        Boolean.new(raw_time_zone_names.include?("Pacific/Tarawa"))
      end

      def code_pacific_tongatapu?
        Boolean.new(raw_time_zone_names.include?("Pacific/Tongatapu"))
      end

      def code_pacific_truk?
        Boolean.new(raw_time_zone_names.include?("Pacific/Truk"))
      end

      def code_pacific_wake?
        Boolean.new(raw_time_zone_names.include?("Pacific/Wake"))
      end

      def code_pacific_wallis?
        Boolean.new(raw_time_zone_names.include?("Pacific/Wallis"))
      end

      def code_pacific_yap?
        Boolean.new(raw_time_zone_names.include?("Pacific/Yap"))
      end

      def code_poland?
        Boolean.new(raw_time_zone_names.include?("Poland"))
      end

      def code_portugal?
        Boolean.new(raw_time_zone_names.include?("Portugal"))
      end

      def code_roc?
        Boolean.new(raw_time_zone_names.include?("ROC"))
      end

      def code_rok?
        Boolean.new(raw_time_zone_names.include?("ROK"))
      end

      def code_singapore?
        Boolean.new(raw_time_zone_names.include?("Singapore"))
      end

      def code_turkey?
        Boolean.new(raw_time_zone_names.include?("Turkey"))
      end

      def code_uct?
        Boolean.new(raw_time_zone_names.include?("UCT"))
      end

      def code_us_alaska?
        Boolean.new(raw_time_zone_names.include?("US/Alaska"))
      end

      def code_us_aleutian?
        Boolean.new(raw_time_zone_names.include?("US/Aleutian"))
      end

      def code_us_arizona?
        Boolean.new(raw_time_zone_names.include?("US/Arizona"))
      end

      def code_us_central?
        Boolean.new(raw_time_zone_names.include?("US/Central"))
      end

      def code_us_east_minus_indiana?
        Boolean.new(raw_time_zone_names.include?("US/East-Indiana"))
      end

      def code_us_eastern?
        Boolean.new(raw_time_zone_names.include?("US/Eastern"))
      end

      def code_us_hawaii?
        Boolean.new(raw_time_zone_names.include?("US/Hawaii"))
      end

      def code_us_indiana_minus_starke?
        Boolean.new(raw_time_zone_names.include?("US/Indiana-Starke"))
      end

      def code_us_michigan?
        Boolean.new(raw_time_zone_names.include?("US/Michigan"))
      end

      def code_us_mountain?
        Boolean.new(raw_time_zone_names.include?("US/Mountain"))
      end

      def code_us_pacific?
        Boolean.new(raw_time_zone_names.include?("US/Pacific"))
      end

      def code_us_samoa?
        Boolean.new(raw_time_zone_names.include?("US/Samoa"))
      end

      def code_utc?
        Boolean.new(
          raw.utc? ||
            raw_time_zone_names.include?("UTC") ||
            raw_time_zone_names.include?("Etc/UTC")
        )
      end

      def code_universal?
        Boolean.new(raw_time_zone_names.include?("Universal"))
      end

      def code_w_minus_su?
        Boolean.new(raw_time_zone_names.include?("W-SU"))
      end

      def code_wet?
        Boolean.new(raw_time_zone_names.include?("WET"))
      end

      def code_zulu?
        Boolean.new(raw_time_zone_names.include?("Zulu"))
      end

      def raw_time_zone_names
        if raw.is_a?(::ActiveSupport::TimeWithZone)
          [raw.time_zone.name, raw.time_zone.tzinfo.name]
        else
          [raw.zone]
        end
      end

      def code_utc_offset
        Integer.new(raw.utc_offset)
      end

      def code_year_day
        Integer.new(raw.yday)
      end

      def code_month_day
        code_day
      end

      def code_nanosecond
        Integer.new(raw.nsec)
      end

      def code_nanoseconds
        code_nanosecond
      end

      def code_millisecond
        Integer.new(raw.nsec / 1_000_000)
      end

      def code_milliseconds
        code_millisecond
      end

      def code_utc
        Time.new(raw.utc.in_time_zone("UTC"))
      end

      def code_local
        Time.new(raw.in_time_zone(::Time.zone))
      end

      def code_beginning_of_day
        Time.new(raw.beginning_of_day)
      end

      def code_end_of_day
        Time.new(raw.end_of_day)
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
          year: year,
          month: month,
          day: day,
          week_day: week_day,
          week: week,
          hour: hour,
          minute: minute,
          second: second
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
          year: year,
          month: month,
          day: day,
          week_day: week_day,
          week: week,
          hour: hour,
          minute: minute,
          second: second
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

      def code_zone
        String.new(raw.zone)
      end
    end
  end
end
