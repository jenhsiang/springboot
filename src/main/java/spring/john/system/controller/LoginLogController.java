package spring.john.system.controller;

import spring.john.common.annotation.Log;
import spring.john.common.controller.BaseController;
import spring.john.common.exception.GlobalException;
import spring.john.common.utils.QueryPage;
import spring.john.common.utils.R;
import spring.john.system.entity.SysLoginLog;
import spring.john.system.service.LoginLogService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author john
 * @date 2019-03-13
 */
@RestController
@RequestMapping("/api/loginlog")
@Api(value = "LoginLogController", tags = {"登录日志管理接口"})
public class LoginLogController extends BaseController {

    @Autowired
    private LoginLogService loginLogService;

    @GetMapping("/list")
    public R findByPage(SysLoginLog sysLoginLog, QueryPage queryPage) {
        return new R<>(super.getData(loginLogService.list(sysLoginLog, queryPage)));
    }

    @Log("删除登录日志")
    @DeleteMapping("/{id}")
    public R delete(@PathVariable Long id) {
        try {
            loginLogService.delete(id);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }
}
