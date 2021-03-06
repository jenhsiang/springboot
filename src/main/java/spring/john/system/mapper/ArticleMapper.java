package spring.john.system.mapper;

import spring.john.system.entity.SysArticle;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author john
 * @date 2018/10/16
 */
public interface ArticleMapper extends BaseMapper<SysArticle> {

    List<String> findArchivesDates();

    List<SysArticle> findArchivesByDate(String date);
}
