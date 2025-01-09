package ynu.elm.controller.mall;

import org.springframework.stereotype.Controller;
import ynu.elm.common.Constants;
import ynu.elm.controller.vo.GoodsDetailVO;
import ynu.elm.controller.vo.SearchPageCategoryVO;
import ynu.elm.entity.Goods;
import ynu.elm.service.CategoryService;
import ynu.elm.service.GoodsService;
import ynu.elm.util.BeanUtil;
import ynu.elm.util.PageQueryUtil;
import ynu.elm.util.Result;
import ynu.elm.util.ResultGenerator;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@CrossOrigin
@Controller("mallGoodsController")
@RestController
public class GoodsController {

    @Resource
    private GoodsService goodsService;
    @Resource
    private CategoryService categoryService;

    @GetMapping({"/search", "/search.html"})
    public String searchPage(@RequestParam Map<String, Object> params, HttpServletRequest request) {
        if (StringUtils.isEmpty(params.get("page"))) {
            params.put("page", 1);
        }
        params.put("limit", Constants.GOODS_SEARCH_PAGE_LIMIT);
        //封装分类数据
        if (params.containsKey("goodsCategoryId") && !StringUtils.isEmpty(params.get("goodsCategoryId") + "")) {
            Long categoryId = Long.valueOf(params.get("goodsCategoryId") + "");
            SearchPageCategoryVO searchPageCategoryVO = categoryService.getCategoriesForSearch(categoryId);
            if (searchPageCategoryVO != null) {
                request.setAttribute("goodsCategoryId", categoryId);
                request.setAttribute("searchPageCategoryVO", searchPageCategoryVO);
            }
        }
        //封装参数供前端回显
        if (params.containsKey("orderBy") && !StringUtils.isEmpty(params.get("orderBy") + "")) {
            request.setAttribute("orderBy", params.get("orderBy") + "");
        }
        String keyword = "";
        //对keyword做过滤 去掉空格
        if (params.containsKey("keyword") && !StringUtils.isEmpty((params.get("keyword") + "").trim())) {
            keyword = params.get("keyword") + "";
        }
        request.setAttribute("keyword", keyword);
        params.put("keyword", keyword);
        //封装商品数据
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        request.setAttribute("pageResult", goodsService.searchNewBeeMallGoods(pageUtil));
        return "mall/search";
    }

    @GetMapping("/goods/getinfo/{goodsId}")
    public  Result detailPage(@PathVariable("goodsId") Long goodsId) {
        System.out.print(goodsId);
        Goods goods = goodsService.getNewBeeMallGoodsById(goodsId);
        GoodsDetailVO goodsDetailVO = new GoodsDetailVO();
        BeanUtil.copyProperties(goods, goodsDetailVO);
        ArrayList<Object> list = new ArrayList<>();
        list.add(goods);
        return  ResultGenerator.genSuccessResult(list);
    }

    @GetMapping("/goods/list")
    public Result detailPage() {
        List<Goods> list= goodsService.getAll();
        System.out.println(list);
        return  ResultGenerator.genSuccessResult(list);
    }



}
