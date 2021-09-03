package cn.dafran.server.controller;

import cn.dafran.server.pojo.Admin;
import cn.dafran.server.pojo.AdminLoginParam;
import cn.dafran.server.service.IAdminService;
import cn.dafran.server.untils.RespBean;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

/**
 * @Classname PageController
 * @Author 6b92d6
 * @Description 登录
 */
@Api(tags = "登录管理")
@RestController
public class LoginController {

    @Autowired
    IAdminService adminService;

    @ApiOperation(value = "登录之后返回token")
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public RespBean login(@RequestBody AdminLoginParam adminLoginParam, HttpServletRequest request){
        return adminService.login(adminLoginParam.getUsername(),
                                adminLoginParam.getPassword(),
                                adminLoginParam.getCode(),request);
    }

    @ApiOperation(value ="获取当前登录用户信息")
    @RequestMapping(value = "/admin/info",method = RequestMethod.GET)
    public RespBean getAdminsinfo(Principal principal) {
        // 没有登录信息
        if (null == principal) {
            return RespBean.error("没有此用户信息");
            //return  null;
        }
        String username = principal.getName();
        Admin admin = adminService.getAdminsByUserName(username);
        admin.setPassword(null);
        admin.setRoles(adminService.getRoles(admin.getId()));
        //return admin;
        return RespBean.success("admin",admin);
    }

    @ApiOperation(value = "退出登录")
    @RequestMapping(value = "/logout",method = RequestMethod.POST)
    public RespBean logout() {
        return RespBean.success("注销成功");
    }


}
