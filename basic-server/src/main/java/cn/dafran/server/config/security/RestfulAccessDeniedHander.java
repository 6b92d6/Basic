package cn.dafran.server.config.security;

import cn.dafran.server.untils.RespBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Classname RestfulAccessDeniedHander
 * @Author 6b92d6
 * @Description 当访问接口没有权限时, 自定义返回结果
 */
@Component
public class RestfulAccessDeniedHander implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AccessDeniedException e) throws IOException, ServletException {
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json");
        PrintWriter writer = httpServletResponse.getWriter();
        RespBean respBean = RespBean.error("权限不足,请联系管理员");
        respBean.setCode(403);
        writer.write(new ObjectMapper().writeValueAsString(respBean));
        writer.flush();
        writer.close();
    }

}
