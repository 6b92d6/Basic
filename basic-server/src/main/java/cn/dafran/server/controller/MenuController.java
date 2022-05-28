package cn.dafran.server.controller;


import cn.dafran.server.pojo.Menu;
import cn.dafran.server.service.IMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author 6b92d6
 */
@Api(tags = "菜单")
@RestController
@RequestMapping("/system/cfg")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @ApiOperation(value = "通过用户id查询菜单列表")
    @RequestMapping(value = "/menu",method = RequestMethod.GET)
    public List<Menu> getMenuByAdminId(){
        return menuService.getMenusByAdminId();
    }

}
