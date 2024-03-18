
# TASK 
<img width="851" alt="monitoring task" src="https://github.com/iancumatei67/spring-prometheus/assets/127155074/f2aa9214-1c0e-405f-b39e-658c495e0c0f">

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

# Running containers 
<img width="1336" alt="containers" src="https://github.com/iancumatei67/spring-prometheus/assets/127155074/2e5fe6bc-cb76-4bb5-8226-50deece3b820">

# Metrics 
![metrics](https://github.com/iancumatei67/spring-prometheus/assets/127155074/a1ef19a7-51b0-4ab7-a34b-b81cd06909b5)

# Prometheus for the spring-petclinc application
![prometheus](https://github.com/iancumatei67/spring-prometheus/assets/127155074/e68e6878-a32c-49a3-aa52-1b5f15fb6ec8)

# Grafana dashboard for the spring-petclinic application
![grafana](https://github.com/iancumatei67/spring-prometheus/assets/127155074/bbb51d15-5fb1-49c3-b502-a94b97e00037)

# Containers for the logging part of the task 
![containers for logging](https://github.com/iancumatei67/spring-prometheus/assets/127155074/2b8b16de-7ff3-44ee-a052-15164dd0cc77)

# Example to see if loki works 
![loki functionality](https://github.com/iancumatei67/spring-prometheus/assets/127155074/720c831a-a6f0-45c1-b223-6dae2614113f)
