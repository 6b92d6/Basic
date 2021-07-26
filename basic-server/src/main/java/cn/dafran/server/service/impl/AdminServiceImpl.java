package cn.dafran.server.service.impl;


import cn.dafran.server.mapper.AdminMapper;
import cn.dafran.server.pojo.Admin;
import cn.dafran.server.service.AdminService;
import cn.dafran.server.untils.JwtTokenUtil;
import cn.dafran.server.untils.RespBean;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 6b92d6
 * @since 2021-07-13
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    /**
     * 登录之后返回token
     * @param username
     * @param password
     * @param code
     * @param request
     * @return
     */
    @Override
    public RespBean login(String username, String password, String code, HttpServletRequest request) {
        //将Session中生成的验证码进行判断对比
        String capcha = (String) request.getSession().getAttribute("captcha");
        //没有输入验证码或者验证码不匹配
        if (StringUtils.isEmpty(code) || !capcha.equalsIgnoreCase(code)){
            return RespBean.error("验证码输入错误，请重新输入");
        }
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        //没有用户或者密码不正确 1.判断状态，用户信息为空
        if (null==userDetails ){
            return RespBean.error("用户名不正确");
        }
        if (!passwordEncoder.matches(password,userDetails.getPassword())) {
            return RespBean.error("密码不正确");
        }
        if (!userDetails.isEnabled()){
            return RespBean.error("该账户已经被禁用,请联系管理员");
        }

        //更新security登录用户对象
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails,null,userDetails.getAuthorities());
        //将登录用户对象放入全局上下文
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);

        //生成token
        String token = jwtTokenUtil.generateToken(userDetails);
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token",token);
        tokenMap.put("tokenHead",tokenHead);
        return RespBean.success("登录成功",tokenMap);
    }

    /**
     * 根据用户名获取用户
     * @param username
     * @return
     */
    @Override
    public Admin getAdminsByUserName(String username) {
        return adminMapper.selectOne(new QueryWrapper<Admin>()
                .eq("username",username)
                .eq("enabled",true));
    }
}
