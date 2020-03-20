package spring.john.system.controller;

import spring.john.common.annotation.Log;
import spring.john.common.controller.BaseController;
import spring.john.common.exception.GlobalException;
import spring.john.common.utils.QueryPage;
import spring.john.common.utils.R;
import spring.john.system.entity.SysArticle;
import spring.john.system.entity.SysCategory;
import spring.john.system.service.ArticleService;
import spring.john.system.service.CategoryService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author john
 * @date 2018/10/18
 */
@RestController
@RequestMapping("/api/category")
@Api(value = "CategoryController", tags = {"分类管理接口"})
public class CategoryController extends BaseController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ArticleService articleService;

    @GetMapping("/findAll")
    public R<List<SysCategory>> findAll() {
        return new R<>(categoryService.list(new QueryWrapper<>()));
    }

    /**
     * 查询所有的分类（包含对应的文章数量），结构：
     * [{分类名称，数量},{},....]
     *
     * @return
     */
    @GetMapping("/findArticleCountForCategory")
    public R<Map<String, Object>> findArticleCountForCategory() {
        Map<String, Object> map = new HashMap<>();
        List<SysCategory> sysCategoryList = categoryService.list(new QueryWrapper<>());
        for (SysCategory sysCategory : sysCategoryList) {
            List<SysArticle> sysArticleList = articleService.findByCategory(sysCategory.getName());
            map.put(sysCategory.getName(), sysArticleList.size());
        }
        return new R<>(map);
    }

    @GetMapping("/list")
    public R<Map<String, Object>> list(SysCategory sysCategory, QueryPage queryPage) {
        return new R<>(super.getData(categoryService.list(sysCategory, queryPage)));
    }

    @GetMapping("/{id}")
    public R<SysCategory> findById(@PathVariable("id") Long id) {
        return new R<>(categoryService.getById(id));
    }

    @PostMapping
    @Log("新增分类")
    public R save(@RequestBody SysCategory sysCategory) {
        try {
            categoryService.add(sysCategory);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping
    @Log("更新分类")
    public R update(@RequestBody SysCategory sysCategory) {
        try {
            categoryService.update(sysCategory);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @Log("删除分类")
    public R delete(@PathVariable Long id) {
        try {
            categoryService.delete(id);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }
}
