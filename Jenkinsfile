pipeline{
    agent any
    stages{
        stage('clone the project'){
            steps{
                git branch: 'main', url: 'https://github.com/Pradeep2812/nodejs-project-test.git'
            }
        }
        stage('build and push'){
            steps{
                script{
                 withDockerRegistry(credentialsId: 'dockerhub'){
                    sh ''' docker build -t pradeep1228/nodejs:latest .
                    docker push pradeep1228/nodejs:latest 
                    docker run --name con3 -p 3002:3000 -d pradeep1228/nodejs:latest '''
                 }
                 }
            }
        }
    }
}
