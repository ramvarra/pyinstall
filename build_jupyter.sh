NAME=jupyter
IMAGE=ramvarra/$NAME
VERSIONS="3.10.5 latest"
REGISTRY=jupiter.ramvarra.com:5000


tags=""
for ver in $VERSIONS; do
    tags+=" $IMAGE:$ver $REGISTRY/$IMAGE:$ver"
done
tag_opts="-t $(echo $tags | sed -e 's/ / -t /g')"

echo "Building $tags"
docker build $tag_opts ${NAME}-image

echo "Pushing image versions $VERSIONS to registry $REGISTRY"
for ver in $VERSIONS; do
    docker push $REGISTRY/$IMAGE:$ver
done
