//package org.tplatform.common;
//
//import com.lowagie.text.DocumentException;
//import com.lowagie.text.pdf.AcroFields;
//import com.lowagie.text.pdf.PdfStamper;
//import org.springframework.web.servlet.view.document.AbstractPdfStamperView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.Map;
//
///**
// * Created by tianyi on 16/9/22.
// */
//public class ViewPdfStamper extends AbstractPdfStamperView {
//  @Override
//  protected void mergePdfDocument(Map<String, Object> model, PdfStamper pdfStamper, HttpServletRequest request, HttpServletResponse response) throws Exception {
//    response.setHeader("Content-Disposition", "attachment;filename=" + new String(model.get("filename").toString().getBytes(), "ISO8859-1"));
//    AcroFields fields = pdfStamper.getAcroFields();
//    fillData(fields, (Map<String, String>) model.get("data"));
//    pdfStamper.setFormFlattening(true);
//  }
//
//  private void fillData(AcroFields fields, Map<String, String> data) throws IOException, DocumentException {
//    for (String key : data.keySet()) {
//      String value = data.get(key);
//      fields.setField(key, value);
//    }
//  }
//}
