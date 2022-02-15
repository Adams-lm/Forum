package com.hznu.forum.domain.repository;

import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Faq;
import com.hznu.forum.domain.entity.value.PostsPageQueryValue;

import java.util.List;

/**
 * @author LIN
 * @create 2021/11/1
 * @desc
 **/
public interface FaqRepository {

    void save(Faq faq);

    void update(Faq faq);

    void updateEntity(Faq faq);

    Faq get(Long id);

    PageResult<Faq> page(Integer pageNo, Integer pageSize, PostsPageQueryValue pageQueryValue);

    List<Faq> hots(int size);

}
