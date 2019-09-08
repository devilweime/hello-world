#定义变量
IMAGE_NAME=hello-world
CONTAINER_NAME=$IMAGE_NAME
DOCKER_REGISTRY=registry.cn-hangzhou.aliyuncs.com/wgw-repository/my-repository
#宿主机端口
APP_PORT=28080
#容器端口
IMAGE_EXPOSE_PORT=28080

#构建镜像
docker build -t $IMAGE_NAME .

#推送到远程仓库
docker push $DOCKER_REGISTRY:$IMAGE_NAME

#删除同名docker容器
cid=$(docker ps -a| grep "$CONTAINER_NAME" | awk '{print $1}')
if [ "$cid" != "" ]; then
   docker rm -f $cid
fi

#启动运行
docker run -d -p $APP_PORT:$IMAGE_EXPOSE_PORT  $IMAGE_NAME $CONTAINER_NAME
