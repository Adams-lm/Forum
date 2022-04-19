package com.hznu.forum.infrastructure;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hznu.forum.common.enums.AuditStateEn;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;
import com.hznu.forum.common.model.PageRequest;
import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Posts;
import com.hznu.forum.domain.entity.UserFood;
import com.hznu.forum.domain.repository.UserFoodRepository;
import com.hznu.forum.infrastructure.dal.dao.UserFoodDAO;
import com.hznu.forum.infrastructure.dal.dataobject.UserFoodDO;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author LIN
 * @create 2021/12/3
 * @desc
 **/
@Repository
public class UserFoodRepositoryImpl extends AbstractPostsRepository implements UserFoodRepository {

    @Resource
    private UserFoodDAO userFoodDAO;

    @Override
    public void batchSave(List<UserFood> userFoods) {
        if (ObjectUtils.isEmpty(userFoods)) {
            return;
        }

        userFoods.forEach(userFood -> {
            try {
                UserFoodDO userFoodDO = UserFoodDO.builder()
                        .userId(userFood.getUserId())
                        .postsId(userFood.getPostsId())
                        .build();
                userFoodDO.initBase();

                userFoodDAO.insert(userFoodDO);
            } catch (Exception e) {
                // 唯一健冲突忽略
            }
        });
    }

    @Override
    public PageResult<Posts> pagePosts(PageRequest<Long> pageRequest) {
        PageHelper.startPage(pageRequest.getPageNo(), pageRequest.getPageSize());

        List<UserFoodDO> userFoodDOS = userFoodDAO.query(pageRequest.getFilter());
        PageInfo<UserFoodDO> pageInfo = new PageInfo<>(userFoodDOS);

        if (ObjectUtils.isEmpty(userFoodDOS)) {
            return PageResult.build(pageInfo.getTotal(), pageInfo.getSize(), new ArrayList<>());
        }

        List<Long> postsIds = new ArrayList<>();
        userFoodDOS.forEach(userFoodDO -> postsIds.add(userFoodDO.getPostsId()));

        return basePagePosts(postsIds, pageInfo, AuditStateEn.PASS);
    }

    @Override
    public void deleteByPostsId(Long postsId) {
        userFoodDAO.deleteByPostsId(postsId);
    }
}
