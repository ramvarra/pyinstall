IMAGE=jupiter.ramvarra.com:5000/ramvarra/jupyter
docker run -it -p 18888:8888 -v /mnt/homefiler/PyDev:/mnt/PyDev $IMAGE jupyter notebook --notebook-dir=/mnt/PyDev
