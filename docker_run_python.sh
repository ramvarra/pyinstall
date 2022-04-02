PYTHON_IMAGE=jupiter.ramvarra.com:5000/ramvarra/python
AF_API_KEY=AKCp8k8sxbSxCDvSubFBjF1bg5LD8wYQzpwhrmqC4nXh3tN3jNFa7Nh5jQKxTGzVBggTb6oNA
docker run -it -v /mnt/homefiler/PyDev:/mnt/PyDev -e RV_HOME_API_KEY=$AF_API_KEY $PYTHON_IMAGE 
