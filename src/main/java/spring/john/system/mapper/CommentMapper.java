package spring.john.system.mapper;

import spring.john.common.utils.QueryPage;
import spring.john.system.entity.SysComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author john
 * @date 2018/10/17
 */
public interface CommentMapper extends BaseMapper<SysComment> {

    List<SysComment> findAll(@Param("state") String state, @Param("queryPage") QueryPage queryPage);
}
