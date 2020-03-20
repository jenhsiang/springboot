package spring.john.system.controller;

import spring.john.common.annotation.Log;
import spring.john.common.controller.BaseController;
import spring.john.common.exception.GlobalException;
import spring.john.common.utils.QueryPage;
import spring.john.common.utils.R;
import spring.john.system.entity.SysLog;
import spring.john.system.service.LogService;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author john
 * @date 2019-03-13
 */
@RestController
@RequestMapping("/api/log")
@Api(value = "LogController", tags = {"日志管理接口"})
public class LogController extends BaseController {

    @Autowired
    private LogService logService;

    @GetMapping("/list")
    public R findByPage(SysLog log, QueryPage queryPage) {
        return new R<>(super.getData(logService.list(log, queryPage)));
    }

    @Log("删除系统日志")
    @DeleteMapping("/{id}")
    @RequiresPermissions("log:delete")
    public R delete(@PathVariable Long id) {
        try {
            logService.delete(id);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }
}
