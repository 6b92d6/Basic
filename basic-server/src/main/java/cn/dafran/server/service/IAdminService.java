package cn.dafran.server.service;

import cn.dafran.server.pojo.Admin;
import cn.dafran.server.pojo.Role;
import cn.dafran.server.untils.RespBean;
import com.baomidou.mybatisplus.extension.service.IService;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 6b92d6
 * @since 2021-07-13
 */
public interface IAdminService extends IService<Admin> {

    /**
     * 登录之后返回token
     * @param username
     * @param password
     * @param
     * @param request
     * @return
    RespBean login(String username, String password, String code, HttpServletRequest request);*/
    RespBean login(String username, String password, HttpServletRequest request);

    /**
     * 根据用户名获取用户
     * @param username
     * @return
     */
    Admin getAdminsByUserName(String username);

    /**
     * 根据用户id查询角色列表
     * @param adminId
     * @return
     */
    List<Role> getRoles(Integer adminId);
}
