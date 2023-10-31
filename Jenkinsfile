pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS = credentials ('dockerhub')
        DOCKERHUB_REPO = 'alexlpda1420'
        DOCKER_IMAGE_WEB = 'web'
        DOCKER_IMAGE_PROM ='prometheus'
        DOCKER_IMAGE_GRAF = 'grafana'
        TAG_JENKINS = 'D15'
    }

    stages{
        stage('Creacion de Imagenes'){
            steps{
                    sh "sudo docker build -t ${env.DOCKER_IMAGE_WEB} -f Dockerfile.Web ."
                    sh "sudo docker build -t ${env.DOCKER_IMAGE_PROM} -f Dockerfile.prometheus ."
                    sh "sudo docker build -t ${env.DOCKER_IMAGE_GRAF} -f Dockerfile.grafana ."         
            }
        }



    }

}