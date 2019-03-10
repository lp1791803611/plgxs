// 计数
function sumNumber(page,size,index){
	var result = "";
	result += (page*size-size+index+1);
	return result;
}

// 格式化时间
function dateFormat(value,row,index){
    var dateType = "";
    if(value != null && value != ''){
        var date = new Date();
        date.setTime(value);
        dateType = date.getFullYear()+"-"+getMonth(date)+"-"+getDay(date);
		// yyyy-MM-dd格式日期
    }
    return dateType;
}
// 返回 01-12 的月份值
function getMonth(date){
    var month = "";
    month = date.getMonth() + 1; // getMonth()得到的月份是0-11
    if(month<10){
        month = "0" + month;
    }
    return month;
}
// 返回01-30的日期
function getDay(date){
    var day = "";
    day = date.getDate();
    if(day<10){
        day = "0" + day;
    }
    return day;
}

/**
 * 自动将form表单封装成json对象
 */
$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [ o[this.name] ];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};