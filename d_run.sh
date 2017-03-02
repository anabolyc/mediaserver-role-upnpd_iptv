docker run --rm -ti --net=host --name upnpd_iptv-instance --env FRONTEND_PORT=4044 --env FRONTEND_NAME=IPTV-DEV --env BACKEND_GUID=61cfd247-be43-4736-8344-bd0fa2100f8e $(cat tag)
