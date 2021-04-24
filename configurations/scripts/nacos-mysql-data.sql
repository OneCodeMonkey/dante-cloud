INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (1, 'eurynome-cloud-cache.yaml', 'common', 'jetcache:\r\n  statIntervalMinutes: 15\r\n  areaInCacheName: false\r\n  local:\r\n    default:\r\n      type: caffeine\r\n      keyConvertor: fastjson\r\n      limit: 1000\r\n  remote:\r\n    default:\r\n      type: redis.lettuce\r\n      keyConvertor: fastjson\r\n      valueEncoder: java\r\n      valueDecoder: java\r\n      poolConfig:\r\n        minIdle: ${spring.redis.lettuce.pool.min-idle}\r\n        maxIdle: ${spring.redis.lettuce.pool.max-idle}\r\n        maxTotal: ${spring.redis.lettuce.pool.max-active}\r\n        maxWait: ${spring.redis.lettuce.pool.max-wait}\r\n      uri:\r\n        - redis://${spring.redis.host}:${spring.redis.port}/${spring.redis.database}', '95d173b565b7dd73e996e2e2e0f75c7d', '2020-05-18 13:49:26', '2020-05-18 13:49:26', NULL, '172.18.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (2, 'eurynome-cloud-database-postgresql.yaml', 'common', 'spring:\r\n  jpa:\r\n    database: ${herodotus.environment.database}\r\n    # spring boot2.+后默认使用的是MyISAM引擎,增加如下配置修改为InnoDB模式，\r\n    # 这样不会出现：Specified key was too long; max key length is 1000 bytes 问题\r\n    database-platform: ${herodotus.environment.database-platform}\r\n    open-in-view: true\r\n    show-sql: ${herodotus.environment.show-sql}\r\n    hibernate:\r\n      ddl-auto: ${herodotus.initialization.hibernate-ddl-auto}\r\n      #create 启动时删数据库中的表，然后创建，退出时不删除数据表\r\n      #create-drop 启动时删数据库中的表，然后创建，退出时删除数据表 如果表不存在报错\r\n      #update 如果启动时表格式不一致则更新表，原有数据保留\r\n      #validate 项目启动表结构进行校验 如果不一致则报错\r\n      naming:\r\n        physical-strategy: org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl\r\n    properties:\r\n      hibernate:\r\n        temp:\r\n          use_jdbc_metadata_defaults: false\r\n  datasource:\r\n    continue-on-error: true\r\n    driver-class-name: ${herodotus.environment.driver-class-name}\r\n    url: ${herodotus.environment.url}\r\n    username: ${herodotus.environment.username}\r\n    password: ${herodotus.environment.password}\r\n    initialization-mode: always\r\n    data-username: ${herodotus.environment.username}\r\n    data-password: ${herodotus.environment.password}\r\n    schema-username: ${herodotus.environment.username}\r\n    schema-password: ${herodotus.environment.password}\r\n\r\n    # 第一种方式启动的时候 Jpa 会自动创建表，import.sql 只负责创建表单后的初始化数据。第二种方式启动的时候不会创建表，需要在初始化脚本中判断表是否存在，再初始化脚本的步骤\r\n    # refer: https://www.cnblogs.com/ityouknow/p/7089170.html\r\n    #    schema:\r\n    #      - classpath:sql/auth-mysql.sql\r\n    #    data: classpath:sql/data-mysql.sql\r\n    sql-script-encoding: UTF-8\r\n    type: com.zaxxer.hikari.HikariDataSource\r\n    hikari:\r\n      # Lowest acceptable connection timeout is 250 ms. Default: 30000 (30 seconds)\r\n      connection-timeout: 5000\r\n      connection-test-query: SELECT 1\r\n      # The minimum allowed value is 10000ms (10 seconds). Default: 600000 (10 minutes)\r\n      idle-timeout: 600000\r\n      minimum-idle: 5\r\n      maximum-pool-size: 50\r\n      # We strongly recommend setting this value, and it should be at least 30 seconds less than any database or infrastructure imposed connection time limit.\r\n      # Default: 1800000 (30 minutes)\r\n      max-lifetime: 1800000\r\n      pool-name: Hikari\r\n      # Lowest acceptable validation timeout is 250 ms. Default: 5000\r\n      validation-timeout: 5000\r\n      data-source-properties:\r\n        prepStmtCacheSize: 250\r\n        prepStmtCacheSqlLimit: 2048\r\n        cachePrepStmts: true\r\n\r\n\r\nherodotus:\r\n  datasource:\r\n    dynamic:\r\n      primary: postgresql\r\n      p6spy: true\r\n      metadata:\r\n        postgresql:\r\n          continue-on-error: true\r\n          driver-class-name: ${herodotus.environment.driver-class-name}\r\n          url: ${herodotus.environment.url}\r\n          username: ${herodotus.environment.username}\r\n          password: ${herodotus.environment.password}\r\n          initialization-mode: always\r\n          data-username: ${herodotus.environment.username}\r\n          data-password: ${herodotus.environment.password}\r\n          schema-username: ${herodotus.environment.username}\r\n          schema-password: ${herodotus.environment.password}\r\n    hikari:\r\n      # Lowest acceptable connection timeout is 250 ms. Default: 30000 (30 seconds)\r\n      connection-timeout: 5000\r\n      connection-test-query: SELECT 1\r\n      # The minimum allowed value is 10000ms (10 seconds). Default: 600000 (10 minutes)\r\n      idle-timeout: 600000\r\n      minimum-idle: 5\r\n      maximum-pool-size: 50\r\n      # We strongly recommend setting this value, and it should be at least 30 seconds less than any database or infrastructure imposed connection time limit.\r\n      # Default: 1800000 (30 minutes)\r\n      max-lifetime: 1800000\r\n      pool-name: Hikari\r\n      # Lowest acceptable validation timeout is 250 ms. Default: 5000\r\n      validation-timeout: 5000\r\n      data-source-properties:\r\n        prepStmtCacheSize: 250\r\n        prepStmtCacheSqlLimit: 2048\r\n        cachePrepStmts: true\r\n        cacheResultSetMetadata: true\r\n        cacheServerConfiguration: true\r\n        useServerPrepStmts: true\r\n        useLocalSessionState: true\r\n        rewriteBatchedStatement: true\r\n        elideSetAutoCommits: true\r\n        maintainTimeStats: false', '1ad9b4be7c3368ec731bfb7dff388499', '2020-05-18 13:49:26', '2020-05-29 18:33:50', NULL, '172.18.0.1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (3, 'eurynome-cloud-kafka.yaml', 'common', 'spring:\r\n  cloud:\r\n    bus:\r\n      enabled: true\r\n      destination: event-bus\r\n      id: ${spring.application.name}\r\n    stream:\r\n      default-binder: kafka\r\n      kafka:\r\n        binder:\r\n          auto-add-partitions: true\r\n          auto-create-topics: true\r\n          configuration:\r\n            commit.interval.ms: 1000\r\n            default.key.serde: org.apache.kafka.common.serialization.Serdes$StringSerde\r\n            default.value.serde: org.apache.kafka.common.serialization.Serdes$StringSerde\r\n  kafka:\r\n    bootstrap-servers: ${herodotus.environment.kafka-bootstrap-servers}\r\n    listener:\r\n      missing-topics-fatal: false\r\n    producer:\r\n      retries: 0\r\n      batch-size: 16384\r\n      buffer-memory: 33554432\r\n      key-serializer: org.apache.kafka.common.serialization.StringSerializer\r\n      value-serializer: org.apache.kafka.common.serialization.StringSerializer\r\n      properties:\r\n        linger.ms: 1\r\n    consumer:\r\n      enable-auto-commit: false\r\n      auto-commit-interval: 100ms\r\n      key-deserializer: org.apache.kafka.common.serialization.StringDeserializer\r\n      value-deserializer: org.apache.kafka.common.serialization.StringDeserializer\r\n      properties:\r\n        session.timeout.ms: 15000\r\n        max.poll.interval.ms: 500000\r\n        max.poll.records: 50', 'e03b544829b6572aa1b32fa50c2827da', '2020-05-18 13:49:26', '2020-06-04 07:13:25', NULL, '172.18.0.1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (4, 'eurynome-cloud-platform.yaml', 'common', 'herodotus:\r\n  platform:\r\n    gateway-server-addr: ${herodotus.environment.gateway-server-addr}\r\n    uaa-server-addr: ${herodotus.platform.gateway-server-addr}/eurynome-cloud-uaa\r\n    upms-server-addr: ${herodotus.platform.gateway-server-addr}/eurynome-cloud-upms-ability\r\n    access-token-uri: ${herodotus.platform.uaa-server-addr}/oauth/token\r\n    user-authorization-uri: ${herodotus.platform.uaa-server-addr}/oauth/authorize\r\n    token-info-uri: ${herodotus.platform.uaa-server-addr}/oauth/check_token\r\n    user-info-uri: ${herodotus.platform.uaa-server-addr}/identity/profile\r\n', '9f4c28fe91aca55065ce0e8c9cfc4059', '2020-05-18 13:49:26', '2020-05-23 11:25:19', NULL, '172.18.0.1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (5, 'eurynome-cloud-redis.yaml', 'common', 'spring:\r\n  redis:\r\n    database: 0\r\n    host: ${herodotus.environment.redis-host}\r\n#    password: ${herodotus.environment.redis-password}\r\n    port: ${herodotus.environment.redis-port}\r\n    timeout: 10000\r\n    # 如果使用的jedis 则将lettuce改成jedis即可\r\n    lettuce:\r\n      pool:\r\n        # 最大活跃链接数 默认8\r\n        max-active: 10\r\n        max-wait: 10000\r\n        # 最大空闲连接数 默认8\r\n        max-idle: 10\r\n        # 最小空闲连接数 默认0\r\n        min-idle: 5', '3be4de8090f0da8662c28d4b37a22eb2', '2020-05-18 13:49:26', '2020-05-18 13:49:26', NULL, '172.18.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (6, 'eurynome-cloud-rest.yaml', 'common', 'management:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\nfeign:\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 5000\r\n        readTimeout: 5000\r\n  sentinel:\r\n    enabled: true\r\n  hystrix:\r\n    enabled: false\r\n\r\nribbon:\r\n  ##请求处理的超时时间\r\n  ReadTimeout: 5000\r\n  ##请求连接的超时时间\r\n  ConnectTimeout: 2000\r\n  ##对当前实例的重试次数\r\n  MaxAutoRetries: 1\r\n  ##对所有操作请求都进行重试\r\n  OkToRetryOnAllOperations: true\r\n  ##切换实例的重试次数\r\n  MaxAutoRetriesNextServer: 1\r\n  http:\r\n    client:\r\n      enabled: false\r\n  okhttp:\r\n    enabled: true # 用OkHttp代替HttpClient\r\n  eager-load:\r\n    enabled: true\r\n    clients: eurynome-cloud-upms-ability', '8ab2dfc07e70ebf17617a1f603f98639', '2020-05-18 13:49:26', '2020-06-08 16:58:39', NULL, '172.18.0.1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (7, 'eurynome-cloud-environment.yaml', 'development', 'herodotus:\r\n  environment:\r\n    redis-host: 127.0.0.1\r\n    redis-port: 6379\r\n    redis-password:\r\n    kafka-bootstrap-servers: 127.0.0.1:9092\r\n    database: postgresql\r\n    database-platform: org.hibernate.dialect.PostgreSQL9Dialect\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:postgresql://localhost:15432/herodotus\r\n    username: herodotus\r\n    password: herodotus\r\n    show-sql: false\r\n    logstash-server-addr: 127.0.0.1:5044\r\n    gateway-server-addr: http://localhost:8847\r\n  initialization:\r\n    hibernate-ddl-auto: update\r\n\r\n  platform:\r\n    management:\r\n      log-center:\r\n        server-addr: ${herodotus.environment.logstash-server-addr}\r\n        loggers:\r\n          cn.herodotus.eurynome: debug\r\n          org.springframework.security: debug\r\n          com.alibaba.nacos.client.naming: off\r\n          com.alibaba: debug', '756c66dbed7b268b0c070f7b8f7b1f94', '2020-05-18 13:49:26', '2020-05-18 13:49:26', NULL, '172.18.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (8, 'eurynome-cloud-environment.yaml', 'docker', 'herodotus:\r\n  environment:\r\n    redis-host: 192.168.101.10\r\n    redis-port: 6379\r\n    redis-password:\r\n    kafka-bootstrap-servers: 192.168.101.10:9092\r\n    database: postgresql\r\n    database-platform: org.hibernate.dialect.PostgreSQL9Dialect\r\n    driver-class-name: org.postgresql.Driver\r\n    url: jdbc:postgresql://192.168.101.10:15432/herodotus\r\n    username: ENC(VQOHWBUv8CXJE50zyMEhCozzElZhNbJ8suinU7Ph651G1xl4QPweElrhtXP4V0T8)\r\n    password: ENC(VQOHWBUv8CXJE50zyMEhCozzElZhNbJ8suinU7Ph651G1xl4QPweElrhtXP4V0T8)\r\n    show-sql: false\r\n    logstash-server-addr: 192.168.101.10:5044\r\n    gateway-server-addr: http://192.168.101.10:8847\r\n  initialization:\r\n    hibernate-ddl-auto: update\r\n\r\n  platform:\r\n    management:\r\n      log-center:\r\n        server-addr: ${herodotus.environment.logstash-server-addr}\r\n        loggers:\r\n          cn.herodotus.eurynome: debug\r\n          org.springframework.security: debug\r\n          com.alibaba.nacos.client.naming: off\r\n          com.alibaba: debug\r\n\r\njasypt:\r\n  encryptor:\r\n    password: ${JASPYT_HOME:2bda7d3a-dba1-45a4-b08e-cbd731a0418e}', '5bc46c55de604aafe8b0df7881f819d8', '2020-05-18 13:49:26', '2020-06-10 14:37:53', NULL, '172.18.0.1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (10, 'eurynome-cloud-upms-ability.yaml', 'herodotus', '---\nsecurity:\n  oauth2:\n    client:\n      clientId: 004b87d8-0a18-4e62-a35c-f2f123713349\n      clientSecret: 2bda7d3a-dba1-45a4-b08e-cbd731a0418e\n    resource:\n      tokenInfoUri: ${herodotus.platform.token-info-uri}\n      userInfoUri: ${herodotus.platform.user-info-uri}\n', '490e5df406525e68523e4ad0dde42cac', '2020-05-18 13:49:26', '2020-06-19 17:00:49', NULL, '172.18.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (11, 'eurynome-cloud-environment.yaml', 'production', 'herodotus:\r\n  environment:\r\n    redis-host: 127.0.0.1\r\n    redis-port: 6379\r\n    redis-password:\r\n    kafka-bootstrap-servers: 127.0.0.1:9092\r\n    database: postgresql\r\n    database-platform: org.hibernate.dialect.PostgreSQL9Dialect\r\n    driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n    url: jdbc:p6spy:postgresql://localhost:5432/herodotus\r\n    username: herodotus\r\n    password: herodotus\r\n    show-sql: false\r\n    logstash-server-addr: 127.0.0.1:5044\r\n    gateway-server-addr: http://localhost:8847\r\n  initialization:\r\n    hibernate-ddl-auto: update\r\n\r\n  platform:\r\n    management:\r\n      log-center:\r\n        server-addr: ${herodotus.environment.logstash-server-addr}\r\n        loggers:\r\n          cn.herodotus.eurynome: debug\r\n          org.springframework.security: debug\r\n          com.alibaba.nacos.client.naming: off\r\n          com.alibaba: debug\r\n', '8ba5eb69c4a861d07dc25d1233e2c30b', '2020-05-18 13:49:26', '2020-05-18 13:49:26', NULL, '172.18.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (12, 'eurynome-cloud-uaa.yaml', 'herodotus', 'security:\r\n  oauth2:\r\n    client:\r\n      client-id: 004b87d8-0a18-4e62-a35c-f2f123713349\r\n      client-secret: 2bda7d3a-dba1-45a4-b08e-cbd731a0418e\r\n      access-token-uri: ${herodotus.platform.uaa-server-addr}/oauth/token\r\n      grant-type: client_credentials\r\n      scope:\r\n        - read_client_detail\r\n        - read_user_detail\r\n    resource:\r\n      token-info-uri: ${herodotus.platform.token-info-uri}\r\n      user-info-uri: ${herodotus.platform.user-info-uri}', 'de1822ad9f8bf92572ab1a74c177d289', '2020-05-23 10:40:31', '2020-06-07 17:24:57', NULL, '172.18.0.1', '', '', 'null', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (16, 'eurynome-cloud-bpmn-ability.yaml', 'herodotus', '---\nsecurity:\n  oauth2:\n    client:\n      clientId: e2a746fc-cb1a-49c3-9436-67004117b039\n      clientSecret: 25c9a32b-45a9-447a-a7e3-3a28d6a6834e\n    resource:\n      tokenInfoUri: ${herodotus.platform.token-info-uri}\n      userInfoUri: ${herodotus.platform.user-info-uri}\n', 'ae5e821acaadf8d4b3d729630cab33c4', '2020-06-19 17:01:00', '2020-06-19 17:01:00', NULL, '172.18.0.1', '', '', NULL, NULL, NULL, NULL, NULL);