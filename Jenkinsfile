pipeline {
    agent any
    environment{
        // DOCKERHUB_CREDENTIALS = credentials ('dockerhub')
        DOCKERHUB_REPO = 'alexlpda1420'
        DOCKER_IMAGE_WEB = 'web'
        DOCKER_IMAGE_PROM ='prometheus'
        DOCKER_IMAGE_GRAF = 'grafana'
        TAG_JENKINS = 'D15'
    }

    stages{
        stage('Creacion de Imagenes'){
            steps{
                    sh "docker build -t ${env.DOCKER_IMAGE_WEB} -f Dockerfile.Web ."
                    sh "docker build -t ${env.DOCKER_IMAGE_PROM} -f Dockerfile.prometheus ."
                    sh "docker build -t ${env.DOCKER_IMAGE_GRAF} -f Dockerfile.grafana ."         
            }
        }

        stage('Login a DockerHub'){
            steps{
                script {
                    def dockerHubCredentials = credentials('dockerhub')
                    withCredentials([usernamePassword(credentialsId: dockerHubCredentials, usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    }
                }
            }
        }

  
      

        /* stage('Verificacion con Docker Dive'){
            steps{
                sh "docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest ${env.DOCKER_IMAGE_WEB}:latest"
                sh "docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest ${env.DOCKER_IMAGE_PROM}:latest"
                sh "docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest ${env.DOCKER_IMAGE_GRAF}:latest"
             } */
        

    }
}