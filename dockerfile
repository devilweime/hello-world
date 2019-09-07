#配置依赖layer
FROM openjdk:8-jre

#开发者信息
MAINTAINER wgw <1665382553@qq.com>


#属性
ARG JAR_FILE=hello-world-0.0.1-SNAPSHOT.jar
ARG EXPOSE_PORT=28080/tcp

#配置需要打包的文件
ADD target/lib           /usr/opt/hello-word/lib

ADD target/${JAR_FILE} /usr/opt/hello-word/myservice.jar

ARG JAR_FILE

#暴露的端口
EXPOSE ${EXPOSE_PORT}

#入口
ENTRYPOINT ["/usr/bin/java", "-Dserver.port=${EXPOSE_PORT} -jar", "/usr/share/myservice/myservice.jar"]