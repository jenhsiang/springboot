package spring.john.admin.dto;

import spring.john.system.entity.SysUser;
import spring.john.common.utils.PasswordHelper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


/**
 * @author john
 * @date 2018/10/23
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class PasswordHelperTest {

    @Autowired
    private PasswordHelper passwordHelper;

    @Test
    public void encryptPassword() {
        SysUser sysUser = new SysUser();
        sysUser.setId(1L);
        sysUser.setUsername("tycoding");
        sysUser.setPassword("123456");
        sysUser.setSalt("536a51359841754df6bbab57d24d2128");
        passwordHelper.encryptPassword(sysUser);
        System.out.println(sysUser.getPassword()); // c0daa18ce0c74153ce060325cb4d1a04
    }
}
