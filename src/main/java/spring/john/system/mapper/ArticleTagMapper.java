package spring.john.system.mapper;

import spring.john.system.entity.SysArticle;
import spring.john.system.entity.ArticleTag;
import spring.john.system.entity.SysTag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author john
 * @date 2018/10/22
 */
public interface ArticleTagMapper extends BaseMapper<ArticleTag> {

    List<SysTag> findByArticleId(long articleId);

    List<SysArticle> findByTagName(String name);
}
