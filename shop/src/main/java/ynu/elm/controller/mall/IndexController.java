package ynu.elm.controller.mall;

import ynu.elm.common.Constants;
import ynu.elm.common.IndexConfigTypeEnum;
import ynu.elm.controller.vo.IndexCarouselVO;
import ynu.elm.controller.vo.IndexCategoryVO;
import ynu.elm.controller.vo.IndexConfigGoodsVO;
import ynu.elm.service.CarouselService;
import ynu.elm.service.CategoryService;
import ynu.elm.service.IndexConfigService;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    private CarouselService carouselService;

    @Resource
    private IndexConfigService indexConfigService;

    @Resource
    private CategoryService categoryService;

    @GetMapping({"/index", "/", "/index.html"})
    public String indexPage(HttpServletRequest request) {
        List<IndexCategoryVO> categories = categoryService.getCategoriesForIndex();
        if (CollectionUtils.isEmpty(categories)) {
            return "error/error_5xx";
        }
        List<IndexCarouselVO> carousels = carouselService.getCarouselsForIndex(Constants.INDEX_CAROUSEL_NUMBER);
        List<IndexConfigGoodsVO> hotGoodses = indexConfigService.getConfigGoodsesForIndex(IndexConfigTypeEnum.INDEX_GOODS_HOT.getType(), Constants.INDEX_GOODS_HOT_NUMBER);
        List<IndexConfigGoodsVO> newGoodses = indexConfigService.getConfigGoodsesForIndex(IndexConfigTypeEnum.INDEX_GOODS_NEW.getType(), Constants.INDEX_GOODS_NEW_NUMBER);
        List<IndexConfigGoodsVO> recommendGoodses = indexConfigService.getConfigGoodsesForIndex(IndexConfigTypeEnum.INDEX_GOODS_RECOMMOND.getType(), Constants.INDEX_GOODS_RECOMMOND_NUMBER);
        request.setAttribute("categories", categories);//分类数据
        request.setAttribute("carousels", carousels);//轮播图
        request.setAttribute("hotGoodses", hotGoodses);//热销商品
        request.setAttribute("newGoodses", newGoodses);//新品
        request.setAttribute("recommendGoodses", recommendGoodses);//推荐商品
        System.out.println(hotGoodses.size());
        System.out.println(newGoodses.size());
        return "mall/index";
    }
}
