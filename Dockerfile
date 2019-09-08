#配置依赖layer
FROM openjdk:8-jre

#开发者信息
MAINTAINER wgw <1665382553@qq.com>

#属性
ARG JAR_FILE=hello-world-0.0.1-SNAPSHOT.jar
ARG EXPOSE_PORT=28080

#配置需要打包的文件
ADD target/hello-world-0.0.1-SNAPSHOT.jar hello-world-0.0.1-SNAPSHOT.jar

#暴露的端口
EXPOSE 28080

#入口
ENTRYPOINT ["java", "-Dserver.port=28080","-jar", "hello-world-0.0.1-SNAPSHOT.jar","&"]

##警告：由于没有设置路径，ADD、COPY可能会有文件找不到问题，查看docker build -f 路径
