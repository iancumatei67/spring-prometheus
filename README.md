First we have to create 3 containers in docker to run prometheus, grafana and spring-petclinic app with the jmx exporter.
The spring-petclinic app can be run using the dockerfile and exposing both 12345 and 8080 ports, (jar can be found in the spring-petclinic repo, didnt add it here since i run it locally.)
The prometheus container can be run with :
##
spring-petclinic % docker run --detach \      
    --name my-prometheus \
    --publish 9090:9090 \
    --volume prometheus-volume:/prometheus \
    --volume "$(pwd)"/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
##
Grafana can be run with :
##
docker run -d -p 3000:3000 --name=grafana grafana/grafana-enterprise
##

Then all we have left to do is Adding the data source of Prometheus in Grafana and  import the dashboard 
