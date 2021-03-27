/*
 * Copyright (c) 2019-2021 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *
 * Project Name: eurynome-cloud
 * Module Name: eurynome-cloud-upms-ability
 * File Name: UpmsApplication.java
 * Author: gengwei.zheng
 * Date: 2021/1/17 下午6:01
 * LastModified: 2021/1/5 下午12:02
 */

package cn.herodotus.eurynome.upms.ability;

import cn.herodotus.eurynome.operation.annotation.EnableHerodotusManagement;
import cn.herodotus.eurynome.upms.ability.configuration.UpmsAbilityConfiguration;
import cn.herodotus.eurynome.upms.api.annotation.EnableUpmsInterface;
import cn.herodotus.eurynome.upms.logic.annotation.EnableUpmsLogic;
import cn.herodotus.eurynome.upms.rest.annotation.EnableUpmsRest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Import;

@EnableDiscoveryClient
@SpringBootApplication
@EnableHerodotusManagement
@EnableUpmsInterface
@EnableUpmsLogic
@EnableUpmsRest
@Import(UpmsAbilityConfiguration.class)
public class UpmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(UpmsApplication.class, args);
    }

}