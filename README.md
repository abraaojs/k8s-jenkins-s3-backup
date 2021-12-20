# K8S Jenkins Backup on S3

Container that backs up Jenkins home directory (Docker version) to S3. The container overwrites the same S3 object every time it is run, it is recommended you turn versioning on to retain access to previous copies.

### Build the Jenkins Docker image
You can build the image yourself
```bash

# Build the image
$ docker build -t abraaojs/k8s-jenkins-s3-backup:tagname .

# Push the image
$ docker push abraaojs/k8s-jenkins-s3-backup:v1
```

```bash
## Running export aws variable

export AWS_ACCESS_KEY_ID=***
export AWS_SECRET_ACCESS_KEY=***
export S3_BUCKET=s3://bucket-name
export AWS_DEFAULT_REGION=us-east-1

kubectl create secret generic aws --from-literal=AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
kubectl create secret generic aws --from-literal=AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
kubectl create secret generic aws --from-literal=BUCKET_URI=$BUCKET_URI

## Running deploy the cronjob backup
$ kubectl apply -f k8s-cronjob-s3-backup.yaml
```
## Configuration

Name                    |   Default Value   |   Description
---                     |   ---             |   ---
JENKINS_HOME_VOLUME     | /var/jenkins_home | Volume where jenkins store the home files
JENKINS_BACKUP_FILENAME | jenkins_backup    | Backup filename
S3_BUCKET               | `blank`           | Your S3 Bucket
S3_PATH                 | `blank`           | Your S3 path
COMPRESSION_FORMAT      | tar.gz            | Compression format (tar)
AWS_ACCESS_KEY_ID       | `blank`           | Your AWS secret key
AWS_SECRET_ACCESS_KEY   | `blank`           | Your AWS access access
