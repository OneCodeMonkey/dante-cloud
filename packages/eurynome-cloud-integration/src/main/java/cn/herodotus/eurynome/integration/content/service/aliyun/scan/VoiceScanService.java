package cn.herodotus.eurynome.integration.content.service.aliyun.scan;

import cn.herodotus.eurynome.integration.content.domain.aliyun.base.Response;
import cn.herodotus.eurynome.integration.content.domain.aliyun.video.VideoQueryResponse;
import cn.herodotus.eurynome.integration.content.domain.aliyun.voice.VoiceAsyncRequest;
import cn.herodotus.eurynome.integration.content.domain.aliyun.voice.VoiceAsyncResponse;
import cn.herodotus.eurynome.integration.content.domain.aliyun.voice.VoiceSyncRequest;
import cn.herodotus.eurynome.integration.content.domain.aliyun.voice.VoiceSyncResponse;
import com.aliyuncs.green.model.v20180509.VoiceAsyncScanRequest;
import com.aliyuncs.green.model.v20180509.VoiceAsyncScanResultsRequest;
import com.aliyuncs.green.model.v20180509.VoiceSyncScanRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>Description: 阿里声音审核服务类 </p>
 *
 * @author : gengwei.zheng
 * @date : 2021/4/14 15:03
 */
@Slf4j
@Service
public class VoiceScanService extends AbstractScanService {

    @Autowired
    private VoiceSyncScanRequest voiceSyncScanRequest;
    @Autowired
    private VoiceAsyncScanRequest voiceAsyncScanRequest;
    @Autowired
    private VoiceAsyncScanResultsRequest videoAsyncScanResultsRequest;

    public Response<List<VoiceSyncResponse>> syncScan(VoiceSyncRequest voiceSyncRequest) {
        String jsonString = this.scan(voiceSyncRequest, voiceSyncScanRequest);
        Response<List<VoiceSyncResponse>> entity = this.parseListResult(jsonString, VoiceSyncResponse.class);
        log.debug("[Eurynome] |- Aliyun Voice Sync Scan result is: {}", entity.toString());
        return entity;
    }

    public Response<List<VoiceAsyncResponse>> asyncScan(VoiceAsyncRequest voiceAsyncRequest) {
        String jsonString = this.scan(voiceAsyncRequest, voiceAsyncScanRequest);
        Response<List<VoiceAsyncResponse>> entity = this.parseListResult(jsonString, VoiceAsyncResponse.class);
        log.debug("[Eurynome] |- Aliyun Voice Async Scan result is: {}", entity.toString());
        return entity;
    }

    public Response<List<VideoQueryResponse>> queryResult(List<String> taskIds) {
        String jsonString = this.query(taskIds, videoAsyncScanResultsRequest);
        Response<List<VideoQueryResponse>> entity = this.parseListResult(jsonString, VideoQueryResponse.class);
        log.debug("[Eurynome] |- Aliyun Video Async Scan Query Result is: {}", entity.toString());
        return entity;
    }
}