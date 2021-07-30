package cn.dafran.server.service.impl;

import cn.dafran.server.mapper.RoleMapper;
import cn.dafran.server.pojo.Role;
import cn.dafran.server.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author 6b92d6
 * @since 2021-07-26
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

}
