package com.itheima.reggie.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.reggie.common.R;
import com.itheima.reggie.dto.DishDto;
import com.itheima.reggie.entity.Category;
import com.itheima.reggie.entity.DishFlavor;
import com.itheima.reggie.entity.HouseServe;
import com.itheima.reggie.service.CategoryService;
import com.itheima.reggie.service.DishFlavorService;
import com.itheima.reggie.service.HouseServeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/dish")
@Slf4j
public class DishController {
    @Autowired
    private HouseServeService houseServeService;

    @Autowired
    private DishFlavorService dishFlavorService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 新增服务
     * @param dishDto
     * @return
     */
    @PostMapping
    public R<String> save(@RequestBody DishDto dishDto){
        log.info(dishDto.toString());

        houseServeService.saveWithFlavor(dishDto);

        return R.success("新增服务成功");
    }

    /**
     * 根据id查询服务信息和对应的时间信息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public R<DishDto> get(@PathVariable Long id){

        DishDto dishDto = houseServeService.getByIdWithFlavor(id);

        return R.success(dishDto);
    }
    /**
     * 修改服务
     * @param dishDto
     * @return
     */
    @PutMapping
    public R<String> update(@RequestBody DishDto dishDto){
        log.info(dishDto.toString());

        houseServeService.updateWithFlavor(dishDto);

        return R.success("修改服务成功");
    }

    /**
     * 服务删除
     *
     * @param ids
     * @return
     */
    @DeleteMapping
    public R delete(@RequestParam List<Long> ids) {
        LambdaQueryWrapper<HouseServe> dishLambdaQueryWrapper = new LambdaQueryWrapper<>();
            dishLambdaQueryWrapper.in(HouseServe::getId, ids);
       // List<HouseServe> list = houseServeService.list(dishLambdaQueryWrapper);
        LambdaUpdateWrapper<DishFlavor> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        lambdaUpdateWrapper.in(DishFlavor::getDishId, ids);
        dishFlavorService.remove(lambdaUpdateWrapper);
        houseServeService.deleteByIds(ids);
        return R.success(null);
    }

    /**
     * 服务状态修改
     *
     * @param status
     * @param ids
     * @return
     */
    @PostMapping("/status/{status}")
    public R updateStatus(@PathVariable Integer status, Long[] ids) {
        HouseServe dish = new HouseServe();
        dish.setStatus(status);
        LambdaUpdateWrapper<HouseServe> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.in(HouseServe::getId, ids);
        //List<HouseServe> list = houseServeService.list(updateWrapper);
        houseServeService.update(dish, updateWrapper);
        return R.success(null);
    }

    /**
     * 服务信息分页查询
     * @param page
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("/page")
    public R<Page>page(int page, int pageSize, String name){
            //构造分页查询构造器对象
        Page<HouseServe> pageInfo = new Page<>(page, pageSize);
        Page<DishDto> dishDtoPage = new Page<>();
        //条件构造器
        LambdaQueryWrapper<HouseServe> queryWrapper = new LambdaQueryWrapper<>();
        //添加过滤条件
        queryWrapper.like(name!=null,HouseServe::getName,name);
        //添加排序条件
        queryWrapper.orderByDesc(HouseServe::getUpdateTime);
        //执行分页查询
        houseServeService.page(pageInfo,queryWrapper);

        //对象拷贝
        BeanUtils.copyProperties(pageInfo,dishDtoPage,"records");

        List<HouseServe> records = pageInfo.getRecords();

        List<DishDto> list = records.stream().map((item) -> {
            DishDto dishDto = new DishDto();

            BeanUtils.copyProperties(item,dishDto);

            Long categoryId = item.getCategoryId();//分类id
            //根据id查询分类对象
            Category category = categoryService.getById(categoryId);

            if(category != null){
                String categoryName = category.getName();
                dishDto.setCategoryName(categoryName);
            }
            return dishDto;
        }).collect(Collectors.toList());

        dishDtoPage.setRecords(list);
        return R.success(dishDtoPage);
    }

    /**
     *根据条件查询对应的服务数据
     * @param houseServe
     * @return
     */
    /*@GetMapping("/list")
    public R<List<Dish>> list(Dish dish){
        //构造查询条件
        LambdaQueryWrapper<Dish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(dish.getCategoryId() != null ,Dish::getCategoryId,dish.getCategoryId());
        //添加条件，查询状态为1（起售状态）的服务
        queryWrapper.eq(Dish::getStatus,1);

        //添加排序条件
        queryWrapper.orderByAsc(Dish::getSort).orderByDesc(Dish::getUpdateTime);

        List<Dish> list = dishService.list(queryWrapper);

        return R.success(list);
    }*/

    @GetMapping("/list")
    public R<List<DishDto>> list(HouseServe houseServe){
        //构造查询条件
        LambdaQueryWrapper<HouseServe> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(houseServe.getCategoryId() != null ,HouseServe::getCategoryId,houseServe.getCategoryId());
        //添加条件，查询状态为1（起售状态）的服务
        queryWrapper.eq(HouseServe::getStatus,1);

        //添加排序条件
        queryWrapper.orderByAsc(HouseServe::getSort).orderByDesc(HouseServe::getUpdateTime);

        List<HouseServe> list = houseServeService.list(queryWrapper);

        List<DishDto> dishDtoList = list.stream().map((item) -> {
            DishDto dishDto = new DishDto();

            BeanUtils.copyProperties(item,dishDto);

            Long categoryId = item.getCategoryId();//分类id
            //根据id查询分类对象
            Category category = categoryService.getById(categoryId);

            if(category != null){
                String categoryName = category.getName();
                dishDto.setCategoryName(categoryName);
            }

            //当前服务的id
            Long dishId = item.getId();
            LambdaQueryWrapper<DishFlavor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(DishFlavor::getDishId,dishId);
            //SQL:select * from dish_flavor where dish_id = ?
            List<DishFlavor> dishFlavorList = dishFlavorService.list(lambdaQueryWrapper);
            dishDto.setFlavors(dishFlavorList);
            return dishDto;
        }).collect(Collectors.toList());

        return R.success(dishDtoList);
    }

}
