/*
 * Copyright 1999-2022 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.nacos.plugin.datasource.impl.highgo;

import com.alibaba.nacos.plugin.datasource.constants.DatabaseTypeConstant;
import com.alibaba.nacos.plugin.datasource.impl.base.BaseTenantCapacityMapper;

/**
 * The postgresql implementation of TenantCapacityMapper.
 *
 * @author Long Yu
 **/
public class TenantCapacityMapperByHighgo extends BaseTenantCapacityMapper {
    
    @Override
    public String incrementUsageWithDefaultQuotaLimit() {
        return super.incrementUsageWithDefaultQuotaLimit().replace('`', '"');
    }

    @Override
    public String incrementUsageWithQuotaLimit() {
        return super.incrementUsageWithQuotaLimit().replace('`', '"');
    }

    @Override
    public String incrementUsage() {
        return super.incrementUsage().replace('`', '"');
    }

    @Override
    public String decrementUsage() {
        return super.decrementUsage().replace('`', '"');
    }

    @Override
    public String correctUsage() {
        return super.correctUsage().replace('`', '"');
    }

    @Override
    public String insertTenantCapacity() {
        return super.insertTenantCapacity().replace('`', '"');
    }

    @Override
    public String getDataSource() {
        return DatabaseTypeConstant.HIGHGO;
    }
    
    
}
