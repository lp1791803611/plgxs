package top.plgxs.common.export;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.util.CellRangeAddress;
import top.plgxs.common.TimeUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
import java.text.ParseException;
import java.io.OutputStream;

/**
 * 导出到excel
 * @author Strangers。
 * @version 1.0.0
 * @date 15:07 2019/3/10
 */
public class ExportExcel {

    /**
     * 导出到excel
     * @param list  待导出集合
     * @param title excel标题
     * @param rowName excel表头
     * @param methodName 与表头相对应的类属性.例如getId,getName等
     * @param request
     * @param response
     * @throws Exception
     */
    public <T> void exportExcel(List<T> list, String title,String[] rowName,String[] methodName,
                            HttpServletRequest request, HttpServletResponse response) throws Exception {
        HSSFWorkbook workbook = new HSSFWorkbook();         //创建一个工作簿
        HSSFSheet sheet = workbook.createSheet("sheet1");   //创建一个工作表
        sheet.setDefaultColumnWidth((short) 15);            //设置表格默认列宽度为15个字节

        //创建标题行表格
        HSSFRow rowTitle = sheet.createRow(0);              //创建第一行为标题
        HSSFCell cellTitle = rowTitle.createCell((short) 0);

        //设置标题样式
        HSSFCellStyle colunmTitleStyle = getColunmTitleStyle(workbook);
        //设置中英文内容样式
        HSSFCellStyle dataStyle = getDataStyle(workbook);
        //合并单元格
        CellRangeAddress region = new CellRangeAddress(0, (short) 0, 0, (short)(rowName.length-1));
        sheet.addMergedRegion(region);
        cellTitle.setCellStyle(colunmTitleStyle);
        cellTitle.setCellValue(title);

        //定义所需列数
        int columnNum = rowName.length;
        //在索引2的位置创建行(最顶端的行开始的第二行)
        HSSFRow rowRowName  = sheet.createRow(2);           //创建excel中的第三行(索引第二行)为列头
        // 将列头设置到sheet的单元格中
        for(int n=0;n<columnNum;n++){
            HSSFCell  cellRowName = rowRowName .createCell((short) n);      //创建列头对应个数的单元格
            cellRowName.setCellType(HSSFCell.CELL_TYPE_STRING);             //设置列头单元格的数据类型
            HSSFRichTextString text = new HSSFRichTextString(rowName[n]);
            cellRowName.setCellValue(text);                                 //设置列头单元格的值
            cellRowName.setCellStyle(colunmTitleStyle);                     //设置列头单元格样式
        }

        HSSFCell cell = null;            //设置单元格的数据类型
        //将查询出的数据设置到sheet对应的单元格中
        for(short i=0;i<list.size();i++){
            T entity = list.get(i);
            HSSFRow row = sheet.createRow(i+3);
            //第一列为行号
            cell = row.createCell((short) 0,HSSFCell.CELL_TYPE_NUMERIC);
            setCell(cell,dataStyle,Integer.toString(i+1));
            System.out.print(i);
            System.out.println(entity.toString());
            for(int j=1;j<methodName.length;j++){
                cell = row.createCell((short) (j),HSSFCell.CELL_TYPE_STRING);
                Method method = entity.getClass() == null ? null : entity.getClass().getMethod(methodName[j]);
                Object data = method == null ? null : method.invoke(entity);
                setCell(cell,dataStyle,data == null ? "":data.toString());
            }
        }

        //让列宽随着导出的列长自动适应
        for (short colNum = 0; colNum < columnNum; colNum++) {
            int columnWidth = sheet.getColumnWidth(colNum) / 256;
            for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
                HSSFRow currentRow;
                //当前行未被使用过
                if (sheet.getRow(rowNum) == null) {
                    currentRow = sheet.createRow(rowNum);
                } else {
                    currentRow = sheet.getRow(rowNum);
                }
                if (currentRow.getCell(colNum) != null) {
                    HSSFCell currentCell = currentRow.getCell(colNum);
                    if (currentCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                        int length = currentCell.getStringCellValue().getBytes().length;
                        if (columnWidth < length) {
                            columnWidth = length;
                        }
                    }
                }
            }
            if(colNum == 0){
                sheet.setColumnWidth(colNum, (short) ((short)(columnWidth-2) * 256));
            }else{
                sheet.setColumnWidth(colNum, (short) ((columnWidth+4) * 256));
            }
        }
        if(workbook !=null){
            OutputStream out = null;
            try {
                Date date = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                System.out.println(title);
                String filename = title + "_" + df.format(date);                 //导出excel名
                System.out.println(filename);
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment;filename="
                        + java.net.URLEncoder.encode(filename, "UTF-8")+".xls");
                out = response.getOutputStream();
                workbook.write(out);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if(out != null){
                    out.flush();
                    out.close();
                }
            }
        }
    }

    /**
     * 列标题单元格样式
     * @param workbook
     * @return
     * @author lp
     * @date 2017年8月30日 上午11:31:31
     */
    private static HSSFCellStyle getColunmTitleStyle(HSSFWorkbook workbook){
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        font.setFontHeightInPoints((short)11);
        //字体加粗
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式中应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        return style;
    }
    /**
     * 中英文数据信息单元格样式
     * @param workbook
     * @return
     * @author lp
     * @date 2017年8月30日 上午11:31:19
     */
    public static HSSFCellStyle getDataStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为左对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        return style;
    }

    /**
     * 整数数据信息单元格样式
     * @param workbook
     * @return
     * @author lp
     * @date 2017年9月1日 上午11:16:11
     */
    public static HSSFCellStyle getNumStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为右对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        style.setDataFormat(HSSFDataFormat.getBuiltinFormat("0"));
        return style;
    }
    /**
     * 日期单元格样式
     * @param workbook
     * @return
     * @author lp
     * @date 2017年9月13日 下午5:12:28
     */
    public static HSSFCellStyle getDateStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置字体
        style.setFont(font);
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);

        HSSFDataFormat format= workbook.createDataFormat();
        style.setDataFormat(
                format.getFormat("yyyy/M/d")
        );
        return style;
    }
    /**
     * 货币单元格样式——人民币
     * @param workbook
     * @return
     * @author lp
     * @date 2017年9月14日 下午4:56:30
     */
    public static HSSFCellStyle getCurrencyStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置字体
        style.setFont(font);
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        HSSFDataFormat format= workbook.createDataFormat();
        style.setDataFormat(format.getFormat("¥#,##0.00"));
        return style;
    }
    /**
     * 小数单元格样式
     * @param workbook
     * @return
     * @author lp
     * @date 2017年9月14日 下午4:56:30
     */
    public static HSSFCellStyle getDoubleStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置字体
        style.setFont(font);
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        style.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
        return style;
    }
    /**
     * 设置文本单元格样式和value
     * @param cell
     * @param cellStyle
     * @param value
     * @author lp
     * @date 2017年8月30日 上午11:30:16
     */
    public static void setCell(HSSFCell cell, HSSFCellStyle cellStyle, String value) {
        cell.setCellStyle(cellStyle);
        cell.setCellValue(value);
    }
    /**
     * 设置货币样式和value
     * @param cell
     * @param cellStyle
     * @param value
     * @author lp
     * @date 2017年9月15日 上午10:12:13
     */
    public static void setCurrencyCell(HSSFCell cell, HSSFCellStyle cellStyle, Double value) {
        cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
        cell.setCellStyle(cellStyle);
        cell.setCellValue(value);
    }
    /**
     * 设置日期样式和value
     * @param cell
     * @param cellStyle
     * @param value
     * @throws Exception
     * @author lp
     * @date 2017年9月15日 上午10:12:41
     */
    public static void setDateCell(HSSFCell cell, HSSFCellStyle cellStyle, Date value) throws Exception {
        if(value != null){
            value = TimeUtil.datetimeFormat.parse(TimeUtil.datetimeFormat.format(value));
            cell.setCellStyle(cellStyle);
            cell.setCellValue(value);
        }else{
            cell.setCellStyle(cellStyle);
            cell.setCellValue("");
        }

    }
    /**
     * 设置整数样式和value
     * @param cell
     * @param cellStyle
     * @param value
     * @throws Exception
     * @author lp
     * @date 2017年10月9日 上午11:57:03
     */
    public static void setNumCell(HSSFCell cell, HSSFCellStyle cellStyle, Integer value) throws Exception {
        value = value == null ? 0:value;
        cell.setCellStyle(cellStyle);
        cell.setCellValue(value);
    }
    /**
     * 设置小数样式和value
     * @param cell
     * @param cellStyle
     * @param value
     * @throws Exception
     * @author lp
     * @date 2017年10月9日 上午11:57:03
     */
    public static void setDoubleCell(HSSFCell cell, HSSFCellStyle cellStyle, Double value) throws Exception {
        cell.setCellStyle(cellStyle);
        cell.setCellValue(value);
    }
    /**
     * 将BigDecimal类型转化为Double，默认值0.00
     * @param cost
     * @return
     * @author lp
     * @date 2017年8月30日 上午11:49:59
     */
    private static Double costFormat(BigDecimal cost){
        Double result = 0.00;
        if(cost == null || cost.doubleValue() == 0.00){
            result = 0.00;
        }else{
            result = cost.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        }
        return result;
    }
    /**
     * 格式化日期
     * @param date
     * @return
     * @author lp
     * @date 2017年9月1日 上午11:48:45
     */
    public static String dateOfFormat(Date date){
        String result = "";
        if(date != null){
            result = TimeUtil.datetimeFormat.format(date);
        }
        return result;
    }
    /**
     * 将字符串日期数组格式化为日期
     * @param str
     * @return
     * @author lp
     * @date 2017年9月1日 上午11:51:31
     */
    public static String strDateFormat(String str){

        String result;
        try {
            if(str != null && !str.equals("")){
                String[] strArray=str.split(",");
                result = TimeUtil.datetimeFormat.format(TimeUtil.datetimeFormat.parse(strArray[0]));
            }else{
                result = "";
            }

        } catch (ParseException e) {
            result = "";
        }
        return result;
    }
    /**
     * 将字符串日期格式化为日期
     * @param str
     * @return
     * @author lp
     * @date 2017年9月1日 下午12:33:03
     */
    public static Date parseDate(String str){
        Date result = null;
        try {
            if(str != null && !str.equals("")){
                result = TimeUtil.datetimeFormat.parse(str);
            }else{
                result = null;
            }
        } catch (ParseException e) {
            result = null;
        }
        return result;
    }
    /**
     * 将BigDecimal 转为 Double
     * @param value
     * @return
     * @author lp
     * @date 2017年10月9日 下午12:17:24
     */
    public static Double parseDecimal(BigDecimal value){
        Double result = null;
        if(value != null){
            result = value.doubleValue();
        }else{
            result = 0.00;
        }
        return result;
    }
}
