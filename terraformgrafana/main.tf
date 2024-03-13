terraform {
    required_providers {
        grafana = {
            source = "grafana/grafana"
            version = "~> 1.13.0"
        }
    }
}


provider "grafana" {
    url = "http://172.20.103.62:3000"
    auth = "glsa_lZUK7O3ZsDuUBEffU84id8frhH7xGnAK_06ec5fda"
}

resource "grafana_data_source" "prometheus" {
  name        = "Prometheus"
  type        = "prometheus"
  url         = "http://172.17.0.3:9090"  
  is_default  = true
}

resource "grafana_dashboard" "example_dashboard" {
  depends_on = [grafana_data_source.prometheus]
  config_json = jsonencode({
    "title" : "Dashboard from Terraform",
    "uid" : "terraformdashboard"

  })

}
