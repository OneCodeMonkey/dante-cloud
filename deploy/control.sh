java -server -Xmx100m -Xms100m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar platform/dante-cloud-gateway/target/dante-cloud-gateway-3.2.5.0.jar

1.  nohup java -server -Xmx300m -Xms300m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar platform/dante-cloud-upms/target/dante-cloud-upms-3.2.5.0.jar > dante-cloud-upms.out &

2. nohup java -server -Xmx300m -Xms300m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar platform/dante-cloud-message/target/dante-cloud-message-3.2.5.0.jar > dante-cloud-message.out &

3. nohup java -server -Xmx300m -Xms300m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar platform/dante-cloud-uaa/target/dante-cloud-uaa-3.2.5.0.jar > dante-cloud-uaa.out &

4. nohup java -server -Xmx300m -Xms300m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar services/dante-cloud-oss-ability/target/dante-cloud-oss-ability-3.2.5.0.jar > dante-cloud-oss-ability.out &

5. nohup java -server -Xmx300m -Xms300m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar platform/dante-cloud-gateway/target/dante-cloud-gateway-3.2.5.0.jar > dante-cloud-gateway.out &

# 可选启动服务
6. nohup java -server -Xmx300m -Xms300m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar platform/dante-cloud-gateway/target/dante-cloud-monitor-3.2.5.0.jar > dante-cloud-monitor.out &

7. nohup java -server -Xmx300m -Xms300m -XX:+UseG1GC -Dfile.encoding=utf-8 -jar platform/dante-cloud-gateway/target/dante-cloud-bpmn-ability-3.2.5.0.jar > dante-cloud-bpmn.out &