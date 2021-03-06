package spring.john.system.service;

import spring.john.system.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author john
 * @date 2018/10/19
 */
public interface UserService extends IService<SysUser> {

    /**
     * 根据Name查询用户数据
     *
     * @param username
     * @return
     */
    SysUser findByName(String username);

    /**
     * 新增
     *
     * @param sysUser
     */
    void add(SysUser sysUser);

    /**
     * 更新
     *
     * @param sysUser
     */
    void update(SysUser sysUser);

    /**
     * 删除
     *
     * @param id
     */
    void delete(Long id);
}
