package cn.dafran.server.config.security;

import cn.dafran.server.untils.RespBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Classname RestAuthorizationEntryPoint
 * @Author 6b92d6
 * @Description 当未登录或者 token失效时访问接口时,自定义的返回结果
 */
@Component
public class RestAuthorizationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json");
        PrintWriter writer = httpServletResponse.getWriter();
        RespBean respBean = RespBean.error("尚未登录,请登录");
        respBean.setCode(401);
        writer.write(new ObjectMapper().writeValueAsString(respBean));
        writer.flush();
        writer.close();

    }

}
