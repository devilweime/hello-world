#定义变量
IMAGE_TAG=2019
IMAGE_NAME=hello-world
CONTAINER_NAME=$IMAGE_NAME
DOCKER_REGISTRY=registry.cn-hangzhou.aliyuncs.com/wgw-repository/hello-world
#宿主机端口
APP_PORT=28080
#容器端口
IMAGE_EXPOSE_PORT=28080


#删除同名docker镜像
image_id=$(docker images | grep "$IMAGE_NAME" | awk '{print $3}')
if [ "$image_id" != "" ]; then
   docker rmi -f $image_id
fi

#构建镜像
docker build -t $IMAGE_NAME .

#推送到远程仓库
new_image_id=$(docker images | grep "$IMAGE_NAME" | awk '{print $3}')
#目前发现一定要登录
docker login --username=18154759057 -p aq865375 registry.cn-hangzhou.aliyuncs.com
docker tag $new_image_id $DOCKER_REGISTRY:$IMAGE_TAG
docker push $DOCKER_REGISTRY:$IMAGE_TAG


#删除同名docker容器
cid=$(docker ps -a| grep "$CONTAINER_NAME" | awk '{print $1}')
if [ "$cid" != "" ]; then
   docker rm -f $cid
fi


#启动运行
docker run -d -p $APP_PORT:$IMAGE_EXPOSE_PORT  $IMAGE_NAME $CONTAINER_NAME
