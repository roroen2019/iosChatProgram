package com.leanly.mobile.chat.service;

import com.leanly.mobile.chat.model.entity.SnsInfo;

public interface SnsInfoService {

    SnsInfo getSnsInfo(Long id);

    void saveEntity(SnsInfo snsInfo);

    void updateEntity(SnsInfo snsInfo);

    void deleteEntity(SnsInfo snsInfo);
}
