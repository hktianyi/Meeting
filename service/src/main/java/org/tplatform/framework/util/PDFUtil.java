package org.tplatform.framework.util;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.tplatform.framework.log.Logger;
import org.tplatform.meeting.entity.MeetingSchedule;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

/**
 * PDF工具类
 * Created by Tianyi on 2016/09/22.
 */
public class PDFUtil {

  private PDFUtil() {
  }

  public static void create(Map<String, List> params, OutputStream os, boolean hasRemark) throws IOException, DocumentException {

    BaseFont bfCN = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
    Font FontCN = new Font(bfCN, 12, Font.NORMAL);

    // 第一步，创建document对象
    Rectangle rectPageSize = new Rectangle(PageSize.A4);

    //创建document对象并指定边距
    Document document = new Document(rectPageSize, 20, 20, 20, 20);
    // 添加Meta信息
    document.addAuthor("Tianyi");
    document.addCreator("Tianyi");
    document.addTitle("Tianyi");
    document.addSubject("实效节日程");
    document.addCreationDate();

    try {
      // 第二步,将Document实例和文件输出流用PdfWriter类绑定在一起
      //从而完成向Document写，即写入PDF文档
      PdfWriter.getInstance(document, os);
      //第3步,打开文档
      document.open();
      //第3步,向文档添加文字. 文档由段组成
      Paragraph title = new Paragraph("2016艾菲实效节", FontCN);
      title.setAlignment(Element.ALIGN_CENTER);
      document.add(title);

      document.add(Chunk.NEWLINE);

      PdfPTable table = new PdfPTable(hasRemark ? 5 : 4);
      table.setWidthPercentage(100); // 设置宽度
      table.setWidths(hasRemark ? new float[]{12f, 12f, 20f, 41f, 15f} : new float[]{15f, 15f, 25f, 45f});

//      PdfPCell cellTitle = new PdfPCell();
//      cellTitle.setColspan(5);
//      cellTitle.setBackgroundColor(new BaseColor(164, 134, 72));
//      cellTitle.addElement(new Paragraph("日程", FontCN));
//      cellTitle.setHorizontalAlignment(Element.ALIGN_CENTER);
//      cellTitle.setVerticalAlignment(Element.ALIGN_CENTER);
//      table.addCell(cellTitle);

      PdfPCell cellHeader1 = new PdfPCell();
      cellHeader1.setBackgroundColor(new BaseColor(164, 134, 72));
      Paragraph para1 = new Paragraph("日期", FontCN);
      para1.setAlignment(Element.ALIGN_CENTER);
      cellHeader1.addElement(para1);
      cellHeader1.setUseAscender(true);
      cellHeader1.setUseDescender(true);
//      cellHeader1.setHorizontalAlignment(Element.ALIGN_CENTER);
      cellHeader1.setVerticalAlignment(Element.ALIGN_MIDDLE);
      table.addCell(cellHeader1);

      PdfPCell cellHeader2 = new PdfPCell();
      cellHeader2.setUseAscender(true);
      cellHeader2.setUseDescender(true);
//      cellHeader2.setHorizontalAlignment(Element.ALIGN_CENTER);
      cellHeader2.setVerticalAlignment(Element.ALIGN_MIDDLE);
      cellHeader2.setBackgroundColor(new BaseColor(164, 134, 72));
      Paragraph para2 = new Paragraph("时间", FontCN);
      para2.setAlignment(Element.ALIGN_CENTER);
      cellHeader2.addElement(para2);
      table.addCell(cellHeader2);

      PdfPCell cellHeader3 = new PdfPCell();
      cellHeader3.setUseAscender(true);
      cellHeader3.setUseDescender(true);
//      cellHeader3.setHorizontalAlignment(Element.ALIGN_CENTER);
      cellHeader3.setVerticalAlignment(Element.ALIGN_MIDDLE);
      cellHeader3.setBackgroundColor(new BaseColor(164, 134, 72));
      Paragraph para3 = new Paragraph("议程", FontCN);
      para3.setAlignment(Element.ALIGN_CENTER);
      cellHeader3.addElement(para3);
      table.addCell(cellHeader3);

      PdfPCell cellHeader4 = new PdfPCell();
      cellHeader4.setUseAscender(true);
      cellHeader4.setUseDescender(true);
//      cellHeader4.setHorizontalAlignment(Element.ALIGN_CENTER);
      cellHeader4.setVerticalAlignment(Element.ALIGN_MIDDLE);
      cellHeader4.setBackgroundColor(new BaseColor(164, 134, 72));
      Paragraph para4 = new Paragraph("地点", FontCN);
      para4.setAlignment(Element.ALIGN_CENTER);
      cellHeader4.addElement(para4);
      table.addCell(cellHeader4);

      if (hasRemark) {
        PdfPCell cellHeader5 = new PdfPCell();
        cellHeader5.setUseAscender(true);
        cellHeader5.setUseDescender(true);
//        cellHeader5.setHorizontalAlignment(Element.ALIGN_CENTER);
        cellHeader5.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cellHeader5.setBackgroundColor(new BaseColor(164, 134, 72));
        Paragraph para5 = new Paragraph("备注", FontCN);
        para5.setAlignment(Element.ALIGN_CENTER);
        cellHeader5.addElement(para5);
        table.addCell(cellHeader5);
      }

      for(Map.Entry<String, List> entry : params.entrySet()) {
        List<MeetingSchedule> list = entry.getValue();
        PdfPCell cell1 = new PdfPCell();
        cell1.setUseAscender(true);
        cell1.setUseDescender(true);
//        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setRowspan(list.size());
        Paragraph date = new Paragraph(entry.getKey(), FontCN);
        date.setAlignment(Element.ALIGN_CENTER);
        cell1.addElement(date);
        table.addCell(cell1);

        list.forEach(meetingSchedule -> {
          PdfPCell cell2 = new PdfPCell();
          cell2.setUseAscender(true);
          cell2.setUseDescender(true);
//          cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
          cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
          Paragraph time = new Paragraph(meetingSchedule.getStartTime() + " - " + meetingSchedule.getEndTime(), FontCN);
          time.setAlignment(Element.ALIGN_CENTER);
          cell2.addElement(time);
          table.addCell(cell2);
          PdfPCell cell3 = new PdfPCell();
          cell3.setUseAscender(true);
          cell3.setUseDescender(true);
//          cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
          cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
          Paragraph p3 = new Paragraph(meetingSchedule.getTitle().replace("/", "\n"), FontCN);
          p3.setAlignment(Element.ALIGN_CENTER);
          cell3.addElement(p3);
          table.addCell(cell3);
          PdfPCell cell4 = new PdfPCell();
          cell4.setUseAscender(true);
          cell4.setUseDescender(true);
//          cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
          cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
          Paragraph p4 = new Paragraph(meetingSchedule.getContext().replace("<br/>", "\n"), FontCN);
          p4.setAlignment(Element.ALIGN_CENTER);
          cell4.addElement(p4);
          table.addCell(cell4);

          if (hasRemark) {
            PdfPCell cell5 = new PdfPCell();
            cell5.setUseAscender(true);
            cell5.setUseDescender(true);
//            cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
            Paragraph p5 = new Paragraph(meetingSchedule.getHierarchy(), FontCN);
            p5.setAlignment(Element.ALIGN_CENTER);
            cell5.addElement(p5);
            table.addCell(cell5);
          }
        });
      }

      document.add(table);

    } catch (DocumentException e) {
      Logger.e("生产PDF异常", e);
    } finally {
      //关闭document
      document.close();
    }
  }

}
