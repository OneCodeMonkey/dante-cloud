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
 * Module Name: eurynome-cloud-oauth
 * File Name: FormLoginWebAuthenticationDetails.java
 * Author: gengwei.zheng
 * Date: 2021/1/17 上午10:39
 * LastModified: 2021/1/17 上午9:22
 */

package cn.herodotus.eurynome.oauth.authentication;

import cn.herodotus.eurynome.security.properties.SecurityProperties;
import cn.herodotus.eurynome.oauth.utils.SymmetricUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p> Description : 自定义WebAuthenticationDetails，用于提供Login额外参数检测 </p>
 *
 * @author : gengwei.zheng
 * @date : 2019/11/29 14:29
 */
public class FormLoginWebAuthenticationDetails extends WebAuthenticationDetails {

    private boolean codeRight = true;
    private boolean codeEmpty = false;
    private boolean codeNotExist = false;

    private SecurityProperties securityProperties;

    /**
     * Records the remote address and will also set the session Id if a session already
     * exists (it won't create one).
     *
     * @param request that the authentication request was received from
     */
    public FormLoginWebAuthenticationDetails(HttpServletRequest request, SecurityProperties securityProperties) {
        super(request);
        this.securityProperties = securityProperties;
        checkVerificationCode(request);
    }

    private void checkVerificationCode(HttpServletRequest request) {
        String encryptedCode = request.getParameter(securityProperties.getVerificationCode().getVerificationCodeParameter());

        String key = request.getParameter("symmetric");

        HttpSession session = request.getSession();
        String savedCode = (String) session.getAttribute(securityProperties.getVerificationCode().getSessionAttribute());

        if (!checkCodeExist(savedCode) && !checkCodeEmpty(encryptedCode)) {
            checkCodeRight(encryptedCode, savedCode, key);
        }
    }

    private boolean checkCodeExist(String savedCode) {
        codeNotExist = StringUtils.isEmpty(savedCode);
        return codeNotExist;
    }

    private boolean checkCodeEmpty(String code) {
        codeEmpty = StringUtils.isEmpty(code);
        return codeEmpty;
    }

    private boolean checkCodeRight(String encryptedCode, String savedCode, String key) {
        byte[] byteKey = SymmetricUtils.getDecryptedSymmetricKey(key);
        String code = SymmetricUtils.decrypt(encryptedCode, byteKey);
        codeRight = StringUtils.equals(code, savedCode);
        return codeRight;
    }

    public boolean isCodeRight() {
        return codeRight;
    }

    public boolean isCodeEmpty() {
        return codeEmpty;
    }

    public boolean isCodeNotExist() {
        return codeNotExist;
    }

    public boolean isClose() {
        return securityProperties.getVerificationCode().isClosed();
    }
}