package top.plgxs.admin.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.StringTokenizer;

import org.apache.commons.lang3.StringUtils;

/**
 * 日期工具类
 * @author lipian
 */
public class TimeUtil {
    // 线程安全的格式化日期的两种写法
    /**
     * yyyy-MM-dd HH:mm:ss
     */
    private static DateTimeFormatter       datetimeFormat = DateTimeFormatter
        .ofPattern("yyyy-MM-dd HH:mm:ss");
    /**
     * yyyy-MM-dd
     */
    private static DateTimeFormatter       dateFormat     = DateTimeFormatter
        .ofPattern("yyyy-MM-dd");
    /**
     * HH:mm:ss
     */
    private static ThreadLocal<DateFormat> timeFormat2     = new ThreadLocal<DateFormat>() {
                                                                   @Override
                                                                   protected DateFormat initialValue() {
                                                                       return new SimpleDateFormat(
                                                                           "HH:mm:ss");
                                                                   }
                                                               };
    private static ThreadLocal<DateFormat> timeFormat = ThreadLocal.withInitial(() -> new SimpleDateFormat("HH:mm:ss"));

    public static void main(String[] args) {
        System.out.println(getTime());
    }

    /**
     * date to localdate
     * @param date
     * @return
     */
    public static LocalDate dateToLocalDate(Date date) {
        Instant instant = date.toInstant();
        ZonedDateTime zdt = instant.atZone(ZoneId.systemDefault());
        LocalDate localDate = zdt.toLocalDate();
        return localDate;
    }

    /**
     * date to localdatetime
     * @param date
     * @return
     */
    public static LocalDateTime dateToLocalDateTime(Date date) {
        Instant instant = date.toInstant();
        ZonedDateTime zdt = instant.atZone(ZoneId.systemDefault());
        LocalDateTime localDateTime = zdt.toLocalDateTime();
        return localDateTime;
    }

    /**
     * date to localtime
     * @param date
     * @return
     */
    public static LocalTime dateToLocalTime(Date date) {
        Instant instant = date.toInstant();
        ZonedDateTime zdt = instant.atZone(ZoneId.systemDefault());
        LocalTime localTime = zdt.toLocalTime();
        return localTime;
    }

    /**
     * localdate to date
     * @param localDate
     * @return
     */
    public static Date localDateToDate(LocalDate localDate) {
        ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
        Instant instant1 = zonedDateTime.toInstant();
        Date from = Date.from(instant1);
        return from;
    }

    /**
     * localdatetime to date
     * @param dateTime
     * @return
     */
    public static Date localDateTimeToDate(LocalDateTime dateTime) {
        ZonedDateTime zonedDateTime = dateTime.atZone(ZoneId.systemDefault());
        Instant instant1 = zonedDateTime.toInstant();
        Date from = Date.from(instant1);
        return from;
    }

    /**
     * 取得当天日期,格式 2019-02-11
     * @return
     */
    public static String getToday() {
        LocalDate date = LocalDate.now();
        return date.format(dateFormat);
    }

    /**
     * 取得当天日期时间,格式 2019-02-11 23:09:21
     * @return
     */
    public static String getTodaytime() {
        LocalDateTime dateTime = LocalDateTime.now();
        return dateTime.format(datetimeFormat);
    }

    /**
     * 取得当前时间,格式 23:12:20
     * @return
     */
    public static String getTime() {
        Instant instant = Instant.now();
        Date date = Date.from(instant);
        return timeFormat.get().format(date);
    }

    /**
     * 取得当前小时
     * @return
     */
    public static int getHour() {
        LocalTime time = LocalTime.now();
        return time.getHour();
    }

    /**
     * 取得当前分钟
     * @return
     */
    public static int getMinute() {
        LocalTime time = LocalTime.now();
        return time.getMinute();
    }

    /**
     * 取得当前秒
     * @return
     */
    public static int getSecond() {
        LocalTime time = LocalTime.now();
        return time.getSecond();
    }

    /**
     * 取得当前年份
     * @return
     */
    public static String getYear() {
        LocalDate date = LocalDate.now();
        return String.valueOf(date.getYear());
    }

    /**
     * 取得当前月份,格式如06
     * @return
     */
    public static String getMonth() {
        LocalDate date = LocalDate.now();
        int month = date.getMonthValue();
        return month < 10 ? "0" + month : String.valueOf(month);
    }

    /**
     * 取得当前日
     * @return
     */
    public static String getDay() {
        LocalDate date = LocalDate.now();
        int day = date.getDayOfMonth();
        return day < 10 ? "0" + day : String.valueOf(day);
    }

    /**
     * 返回N天前（后的）日期，正数是后的日期，负数是前的日期。例如：2019-02-11 12:12:12
     * @param number
     * @return
     */
    public static String plusDay(int number) {
        LocalDateTime dateTime = LocalDateTime.now().plusDays(number);
        return dateTime.format(datetimeFormat);
    }

    /**
     * 日期字符串的格式转换,例如"2019-02-11"转换为2019年2月11日
     * @param sDate
     * @return
     */
    public static String getChnDateString(String sDate) {
        if (sDate == null) {
            return null;
        }
        sDate = sDate.trim();
        if (sDate.length() == 7) {
            sDate += "-01";
        }
        StringTokenizer st = new StringTokenizer(sDate, "-");
        int year = 2100;
        int month = 0;
        int day = 1;
        try {
            year = Integer.parseInt(st.nextToken());
            month = Integer.parseInt(st.nextToken()) - 1;
            day = Integer.parseInt(st.nextToken());
        } catch (Exception e) {
            e.printStackTrace();
        }
        Calendar cl = new GregorianCalendar(year, month, day);
        return cl.get(Calendar.YEAR) + "年" + (cl.get(Calendar.MONTH) + 1) + "月"
               + cl.get(Calendar.DATE) + "日";
    }

    /**
     * 取得某年某月的最后一天,如2019-02-01
     * @param year
     * @param month
     * @return
     */
    public static String getMaxDayOfMonth(int year, int month) {
        LocalDate date = LocalDate.of(year, month, 1);
        System.out.println(date.format(dateFormat));
        LocalDate date2 = date.with(TemporalAdjusters.lastDayOfMonth());
        return date2.format(dateFormat);
    }

    /**
     * 取得某年某月的最后一天,如2019-02-01
     * @param date
     * @return
     */
    public static String getMaxDayOfMonth(LocalDate date) {
        return date.with(TemporalAdjusters.lastDayOfMonth()).format(dateFormat);
    }

    /**
     * 取得某年某月的最后一天,如2019-02-01
     * @param date
     * @return
     */
    public static String getMaxDayOfMonth(Date date) {
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        return localDate.with(TemporalAdjusters.lastDayOfMonth()).format(dateFormat);
    }

    /**
     * 取得某年某月的最后一天,如2019-02-01 01:01:00
     * @param dateTime
     * @return
     */
    public static String getMaxDayOfMonth(LocalDateTime dateTime) {
        return dateTime.with(TemporalAdjusters.lastDayOfMonth()).format(datetimeFormat);
    }

    /**
     * 取得当天的中文日期，像2006年11月28日 星期二
     * @return
     */
    public static String getChineseToDay() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 E", Locale.CHINESE);
        Calendar cl = new GregorianCalendar();
        return sdf.format(cl.getTime());
    }

    /**
     * 取得当天的中文日期，像2006年11月28日 星期二 下午05:06
     * @return
     */
    public static String getChineseToDayTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 E a", Locale.CHINESE);
        Calendar cl = new GregorianCalendar();
        return sdf.format(cl.getTime());
    }

    /**
     * 根据字符串，取得日期类，yyyy-MM-dd
     * @param str
     * @return date
     */
    public static Date strToDate(String str) {
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 根据字符串，取得日期类，yyyy-MM-dd HH:mm:ss
     * @param str
     * @return date
     */
    public static Date strToDateTime(String str) {
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 根据字符串，取得日期类，yyyy-MM-dd HH:mm:ss
     * @param str
     * @return
     */
    public static LocalDateTime strToLocalDateTime(String str) {
        try {
            if (StringUtils.isBlank(str)) {
                return null;
            }
            return LocalDateTime.parse(str, datetimeFormat);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据字符串，取得日期类，yyyy-MM-dd
     * @param str
     * @return
     */
    public static LocalDate strToLocalDate(String str) {
        try {
            if (StringUtils.isBlank(str)) {
                return null;
            }
            return LocalDate.parse(str, dateFormat);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据字符串，取得日期类,yyyy-MM-dd
     * @param sDate
     * @return
     */
    public static Calendar strToCalendar(String sDate) {
        if (sDate == null) {
            return null;
        }
        sDate = sDate.trim();
        if (sDate.length() == 7) {
            sDate += "-01";
        }
        StringTokenizer st = new StringTokenizer(sDate, "-");
        int year = 2100;
        int month = 0;
        int day = 1;
        try {
            year = Integer.parseInt(st.nextToken());
            month = Integer.parseInt(st.nextToken()) - 1;
            day = Integer.parseInt(st.nextToken());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new GregorianCalendar(year, month, day);
    }

    /**
     * 根据日期类取得日期的字符串形式,yyyy-MM-dd
     * @param sDate
     * @return
     */
    public static String getDateString(LocalDate sDate) {
        if (sDate == null) {
            return "";
        }
        return sDate.format(dateFormat);
    }

    /**
     * 根据日期类取得日期的字符串形式,yyyy-MM-dd
     * @param sDate
     * @return
     */
    public static String getDateString(Calendar sDate) {
        if (sDate == null) {
            return "";
        }
        return (new SimpleDateFormat("yyyy-MM-dd")).format(sDate.getTime());
    }

    /**
     * 根据日期类取得日期的字符串形式,yyyy-MM-dd
     * @param sDate
     * @return
     */
    public static String getDateString(Date sDate) {
        if (sDate == null) {
            return "";
        }
        return (new SimpleDateFormat("yyyy-MM-dd")).format(sDate.getTime());
    }

    /**
     * 根据日期类取得日期的字符串形式(yyyy-MM-dd HH:mm:ss)
     * @param sDate
     * @return
     */
    public static String getDateTimeString(Date sDate) {
        if (sDate == null) {
            return "";
        }
        return (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(sDate.getTime());
    }

    /**
     * 根据日期类取得日期的字符串形式(yyyy-MM-dd HH:mm:ss)
     * @param sDate
     * @return
     */
    public static String getDateTimeString(LocalDateTime sDate) {
        if (sDate == null) {
            return "";
        }
        return sDate.format(datetimeFormat);
    }

    /**根据日期类取年月的字符串形式
     * @param sDate
     * @return
     */
    public static String getYearMonth(Calendar sDate) {
        if (sDate == null) {
            return "";
        }
        return (new SimpleDateFormat("yyyy-MM")).format(sDate.getTime());
    }

    /**比较两个日期类型的字符串，格式为（yyyy-mm-dd）
     * 如果cale1大于cale2，返回1
     * 如果cale1小于cale2，返回-1
     * 如果相等，返回0
     * 如果格式错误，返回-2
     * @param cale1
     * @param cale2
     * @return
     */
    public static int compareCalendar(String cale1, String cale2) {
        Calendar calendar1 = strToCalendar(cale1);
        Calendar calendar2 = strToCalendar(cale2);
        if (calendar1 == null || calendar2 == null) {
            return -2;
        }
        return calendar1.compareTo(calendar2);
    }

    /**获取当前日期   格式 yyyy-MM-01 00:00:01
     * @return
     */
    public static String getYearMonth() {

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM");
        return sf.format(new Date()) + "-01 00:00:00";
    }

    /**
     * 获取当前时间 格式:YYYYMMDDhhmmss
     * @return
     */
    public static String getCurrentTime() {
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
    }

}
