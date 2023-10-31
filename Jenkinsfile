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
                    sh "docker build -t ${env.DOCKER_IMAGE_WEB} -f Dockerfile.Web ."
                    sh "docker build -t ${env.DOCKER_IMAGE_PROM} -f Dockerfile.prometheus ."
                    sh "docker build -t ${env.DOCKER_IMAGE_GRAF} -f Dockerfile.grafana ."         
            }
        }

        stage('Login a Dockerhub'){
            steps{
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }

        }

        stage('Definir tags'){
            steps{
                sh "docker tag ${env.DOCKER_IMAGE_WEB} ${env.DOCKERHUB_REPO}/${env.DOCKER_IMAGE_WEB}:${env.TAG_JENKINS}-${BUILD_ID}"
                sh "docker tag ${env.DOCKER_IMAGE_PROM} ${env.DOCKERHUB_REPO}/${env.DOCKER_IMAGE_PROM}:${env.TAG_JENKINS}-${BUILD_ID}"
                sh "docker tag ${env.DOCKER_IMAGE_GRAF} ${env.DOCKERHUB_REPO}/${env.DOCKER_IMAGE_GRAF}:${env.TAG_JENKINS}-${BUILD_ID}"
            }
        }

        stage('Subir imagenes a DockerHub'){
            steps{
                sh "docker push ${env.DOCKERHUB_REPO}/${env.DOCKER_IMAGE_WEB}:${env.TAG_JENKINS}-${BUILD_ID}"
                sh "docker push ${env.DOCKERHUB_REPO}/${env.DOCKER_IMAGE_PROM}:${env.TAG_JENKINS}-${BUILD_ID}"
                sh "docker push ${env.DOCKERHUB_REPO}/${env.DOCKER_IMAGE_GRAF}:${env.TAG_JENKINS}-${BUILD_ID}"
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