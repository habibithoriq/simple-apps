pipeline {
   agent {
  label 'server-1'
}

tools {
  nodejs 'node js'
}

//nama agent harus server nanti sesuai yang ada di jenkinsfile 
//penambahan tool hasil dari generate jenkinfile


//copy url git based on github
    stages {
        stage('Pull SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/habibithoriq/simple-apps.git'
            }
        }
        
        stage('Build') {
            steps {
                sh'''
                cd app
                npm install
                '''
            }
        }
        
        stage('Testing') {
            steps {
                sh'''
                cd app
                APP_PORT=3001 npm test
                APP_PORT=3001 npm run test:coverage
                '''
            }
        }
        
        stage('Code Review') {
            steps {
                sh""
                cd app
               
                sonar-scanner \
  sonar-scanner \
  -Dsonar.projectKey=sonar_jenkis \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://172.23.10.10:9000 \
  -Dsonar.login=sqp_9242526f46b5781a3bbf41ce8bbef0702565f25b
            }
        }
        
        stage('Deploy') {
            steps {
                sh'''
                docker compose build
                docker compose down --volumes
                docker compose up -d
                '''
            }
        }
        
        stage('Backup') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerAmar', passwordVariable: 'dockerAmarPassword', usernameVariable: 'dockerAmarUser')]) {
                    sh "docker login -u ${env.dockerAmarUser} -p ${env.dockerAmarPassword}"
                    sh 'docker compose push'
                }
            }
        }
        
        
    }
}


//file jenkisn input parameter result from generate jenkisn dashboard 
