//格式化时间
function dateFormat(longTypeDate){
    var dateType = "";
    if(longTypeDate != null && longTypeDate != ''){
        var date = new Date();
        date.setTime(longTypeDate);
        dateType = date.getFullYear()+"-"+getMonth(date)+"-"+getDay(date);//yyyy-MM-dd格式日期
    }
    return dateType;
}
//返回 01-12 的月份值
function getMonth(date){
    var month = "";
    month = date.getMonth() + 1; //getMonth()得到的月份是0-11
    if(month<10){
        month = "0" + month;
    }
    return month;
}
//返回01-30的日期
function getDay(date){
    var day = "";
    day = date.getDate();
    if(day<10){
        day = "0" + day;
    }
    return day;
}