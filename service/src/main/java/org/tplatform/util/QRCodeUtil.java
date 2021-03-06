package org.tplatform.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;

/**
 * Created by tianyi on 16/8/7.
 */
public class QRCodeUtil {

  private static final int BLACK = 0xFF000000; //用于设置图案的颜色
  private static final int WHITE = 0xFFFFFFFF; //用于背景色

  private QRCodeUtil() {
  }

//  public static BufferedImage toBufferedImage(BitMatrix matrix) {
//    int width = matrix.getWidth();
//    int height = matrix.getHeight();
//    BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_BINARY);
//    int onColor = BLACK;
//    int offColor = WHITE;
//    int[] pixels = new int[width * height];
//    int index = 0;
//    for (int y = 0; y < height; y++) {
//      for (int x = 0; x < width; x++) {
//        pixels[index++] = matrix.get(x, y) ? onColor : offColor;
//      }
//    }
//    image.setRGB(0, 0, width, height, pixels, 0, width);
//    return image;
//  }

  public static BufferedImage toBufferedImage(BitMatrix matrix) {
    int width = matrix.getWidth();
    int height = matrix.getHeight();
    BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_BINARY);
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        image.setRGB(x, y,  (matrix.get(x, y) ? BLACK : WHITE));
//              image.setRGB(x, y,  (matrix.get(x, y) ? Color.YELLOW.getRGB() : Color.CYAN.getRGB()));
      }
    }
    return image;
  }

  public static void writeToFile(BitMatrix matrix, String format, File file) throws IOException {
    BufferedImage image = toBufferedImage(matrix);
    //设置logo图标
    image = LogoMatrix(image);

    if (!ImageIO.write(image, format, file)) {
      throw new IOException("Could not write an image of format " + format + " to " + file);
    }else{
      System.out.println("图片生成成功！");
    }
  }

  public static void writeToStream(BitMatrix matrix, String format, OutputStream stream) throws IOException {
    BufferedImage image = toBufferedImage(matrix);
    //设置logo图标
    image = LogoMatrix(image);

    if (!ImageIO.write(image, format, stream)) {
      throw new IOException("Could not write an image of format " + format);
    }
  }

  /**
   * 设置 logo
   * @param matrixImage 源二维码图片
   * @return 返回带有logo的二维码图片
   * @throws IOException
   * @author Administrator sangwenhao
   */
  public static BufferedImage LogoMatrix(BufferedImage matrixImage) throws IOException {
    /**
     * 读取二维码图片，并构建绘图对象
     */
    Graphics2D g2 = matrixImage.createGraphics();

    int matrixWidth = matrixImage.getWidth();
    int matrixHeigh = matrixImage.getHeight();

    /**
     * 读取Logo图片
     */
    BufferedImage logo = ImageIO.read(new File("/Users/tianyi/test.jpg"));

    //开始绘制图片
    g2.drawImage(logo,matrixWidth/5*2,matrixHeigh/5*2, matrixWidth/5, matrixHeigh/5, null);//绘制
    BasicStroke stroke = new BasicStroke(5,BasicStroke.CAP_ROUND,BasicStroke.JOIN_ROUND);
    g2.setStroke(stroke);// 设置笔画对象
    //指定弧度的圆角矩形
    RoundRectangle2D.Float round = new RoundRectangle2D.Float(matrixWidth/5*2, matrixHeigh/5*2, matrixWidth/5, matrixHeigh/5,20,20);
    g2.setColor(Color.white);
    g2.draw(round);// 绘制圆弧矩形

    //设置logo 有一道灰色边框
    BasicStroke stroke2 = new BasicStroke(1,BasicStroke.CAP_ROUND,BasicStroke.JOIN_ROUND);
    g2.setStroke(stroke2);// 设置笔画对象
    RoundRectangle2D.Float round2 = new RoundRectangle2D.Float(matrixWidth/5*2+2, matrixHeigh/5*2+2, matrixWidth/5-4, matrixHeigh/5-4,20,20);
    g2.setColor(new Color(128,128,128));
    g2.draw(round2);// 绘制圆弧矩形

    g2.dispose();
    matrixImage.flush() ;
    return matrixImage ;
  }


  public static void Encode_QR_CODE() throws IOException, WriterException {
    String contents = "ZXing 二维码内容1234!"; // 二维码内容
    int width = 430; // 二维码图片宽度 300
    int height = 430; // 二维码图片高度300

    String format = "gif";// 二维码的图片格式 gif

    Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
    // 指定纠错等级,纠错级别（L 7%、M 15%、Q 25%、H 30%）
    hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
    // 内容所使用字符集编码
    hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
//      hints.put(EncodeHintType.MAX_SIZE, 350);//设置图片的最大值
//      hints.put(EncodeHintType.MIN_SIZE, 100);//设置图片的最小值
    hints.put(EncodeHintType.MARGIN, 1);//设置二维码边的空度，非负数

    BitMatrix bitMatrix = new MultiFormatWriter().encode(contents,//要编码的内容
        //编码类型，目前zxing支持：Aztec 2D,CODABAR 1D format,Code 39 1D,Code 93 1D ,Code 128 1D,
        //Data Matrix 2D , EAN-8 1D,EAN-13 1D,ITF (Interleaved Two of Five) 1D,
        //MaxiCode 2D barcode,PDF417,QR Code 2D,RSS 14,RSS EXPANDED,UPC-A 1D,UPC-E 1D,UPC/EAN extension,UPC_EAN_EXTENSION
        BarcodeFormat.QR_CODE,
        width, //条形码的宽度
        height, //条形码的高度
        hints);//生成条形码时的一些配置,此项可选

    // 生成二维码
    File outputFile = new File("/Users/tianyi/tianyi.gif");//指定输出路径
    writeToFile(bitMatrix, format, outputFile);
//    ImageIO.write(toBufferedImage(bitMatrix), format, outputFile);
  }

  public static void main(String[] args) {
    try {
      Encode_QR_CODE();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (WriterException e) {
      e.printStackTrace();
    }
  }

}
