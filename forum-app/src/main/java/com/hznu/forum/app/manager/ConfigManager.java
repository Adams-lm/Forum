package com.hznu.forum.app.manager;

import org.springframework.stereotype.Component;
import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.request.AdminBooleanRequest;
import com.hznu.forum.api.request.config.ConfigAddRequest;
import com.hznu.forum.api.request.config.ConfigPageRequest;
import com.hznu.forum.api.request.config.ConfigUpdateRequest;
import com.hznu.forum.api.response.config.ConfigResponse;
import com.hznu.forum.app.support.IsLogin;
import com.hznu.forum.app.support.LoginUserContext;
import com.hznu.forum.app.support.PageUtil;
import com.hznu.forum.app.transfer.ConfigTransfer;
import com.hznu.forum.common.enums.AuditStateEn;
import com.hznu.forum.common.enums.ErrorCodeEn;
import com.hznu.forum.common.enums.UserRoleEn;
import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.common.support.CheckUtil;
import com.hznu.forum.domain.entity.Config;
import com.hznu.forum.domain.repository.ConfigRepository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * @author LIN
 * @create 2021/12/26
 * @desc
 **/
@Component
public class ConfigManager {

    @Resource
    private ConfigRepository configRepository;

    @IsLogin(role = UserRoleEn.ADMIN)
    public void add(ConfigAddRequest request) {
        Config config = ConfigTransfer.toConfig(request);
        config.setCreator(LoginUserContext.getUser().getId());

        configRepository.save(config);
    }

    @IsLogin(role = UserRoleEn.ADMIN)
    public void update(ConfigUpdateRequest request) {
        Config config = configRepository.get(request.getId());
        CheckUtil.isEmpty(config, ErrorCodeEn.CONFIG_NOT_EXIST);

        ConfigTransfer.update(config, request);
        configRepository.update(config);
    }

    @IsLogin(role = UserRoleEn.ADMIN)
    public void state(AdminBooleanRequest request) {
        Config config = configRepository.get(request.getId());
        CheckUtil.isEmpty(config, ErrorCodeEn.CONFIG_NOT_EXIST);

        config.setState(request.getIs() ? AuditStateEn.PASS : AuditStateEn.REJECT);
        configRepository.update(config);
    }

    @IsLogin(role = UserRoleEn.ADMIN)
    public PageResponseModel<ConfigResponse> page(PageRequestModel<ConfigPageRequest> pageRequestModel) {
        ConfigPageRequest request = pageRequestModel.getFilter();

        PageResult<Config> pageResult = configRepository.page(PageUtil.buildPageRequest(pageRequestModel, ConfigTransfer.toConfig(request)));

        return PageResponseModel.build(pageResult.getTotal(), pageResult.getSize(), ConfigTransfer.toConfigResponses(pageResult.getList()));
    }

    public List<ConfigResponse> queryAvailable(Set<String> types) {
        return ConfigTransfer.toConfigResponses(configRepository.queryAvailable(types));
    }
}
