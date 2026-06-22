pipeline {
  agent any

  environment {
    IMAGE_NAME = 'drivenova-motors'
    IMAGE_TAG = "${env.BUILD_NUMBER}"
    REGISTRY = 'docker.io/your-dockerhub-username'
    KUBE_NAMESPACE = 'carwebsite'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $REGISTRY/$IMAGE_NAME:$IMAGE_TAG .'
      }
    }

    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
          sh 'docker push $REGISTRY/$IMAGE_NAME:$IMAGE_TAG'
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh "sed -i 's|image: .*|image: $REGISTRY/$IMAGE_NAME:$IMAGE_TAG|' deployment.yaml"
        sh 'kubectl create namespace $KUBE_NAMESPACE --dry-run=client -o yaml | kubectl apply -f -'
        sh 'kubectl apply -f service.yaml -n $KUBE_NAMESPACE'
        sh 'kubectl apply -f deployment.yaml -n $KUBE_NAMESPACE'
        sh 'kubectl apply -f alb-controller.yaml -n $KUBE_NAMESPACE'
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
