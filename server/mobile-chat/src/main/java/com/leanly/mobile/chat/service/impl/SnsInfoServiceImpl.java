package com.leanly.mobile.chat.service.impl;

import com.leanly.mobile.chat.model.entity.SnsInfo;
import com.leanly.mobile.chat.repository.SnsInfoRepository;
import com.leanly.mobile.chat.service.SnsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SnsInfoServiceImpl implements SnsInfoService {

    private SnsInfoRepository snsInfoRepository;

    @Autowired
    public SnsInfoServiceImpl(SnsInfoRepository snsInfoRepository) {
        this.snsInfoRepository = snsInfoRepository;
    }

    @Override
    public SnsInfo getSnsInfo(Long id) {
        return snsInfoRepository.findById(id).get();
    }

    @Override
    public void saveEntity(SnsInfo snsInfo) {
        snsInfoRepository.save(snsInfo);
    }

    @Override
    public void updateEntity(SnsInfo snsInfo) {
        SnsInfo findSnsInfo = snsInfoRepository.findById(snsInfo.getId()).get();

        SnsInfo updateSnsInfo = new SnsInfo(findSnsInfo.getToken(), findSnsInfo.getType());

        snsInfoRepository.save(updateSnsInfo);
    }

    @Override
    public void deleteEntity(SnsInfo snsInfo) {
        snsInfoRepository.delete(snsInfo);
    }
}
