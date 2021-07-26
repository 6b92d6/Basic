package cn.dafran.server.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @Classname CaptchaController
 * @Author 6b92d6
 * @Description 验证码
 */
@Api(tags = "验证码")
@RestController
public class CaptchaController {

    @Autowired
    private DefaultKaptcha defaultKaptcha;

    @ApiOperation(value = "生成验证码")
    @RequestMapping(value = "/captcha",method = RequestMethod.GET,produces = "image/jpeg")
    public void captcha(HttpServletRequest request, HttpServletResponse response){
        // 定义response输出类型为image/jpeg类型
        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // 设置IE扩展的HTTP / 1.1无缓存标头（使用addHeader）。
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // 设置标准的HTTP / 1.0无缓存标头。
        response.setHeader("Pragma", "no-cache");
        // 返回一张图片
        response.setContentType("image/jpeg");
        //-------------------生成验证码 begin --------------------------
        String text = defaultKaptcha.createText();
        //将验证码内容放入session
        request.getSession().setAttribute("captcha",text);
        //根据文本验证码内容获取图形验证码
        BufferedImage image = defaultKaptcha.createImage(text);
        ServletOutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            //输出流输出图片,格式为jpg
            ImageIO.write(image,"jpg",outputStream);
            outputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (null != outputStream){
                try{
                    outputStream.close();
                } catch (IOException e){
                    e.printStackTrace();
                }
            }
        }

        //-------------------生成验证码 end --------------------------
    }
}
