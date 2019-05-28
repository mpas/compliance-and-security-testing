# General

## Prerequisites

* Docker installed
* Docker Compose installed
* DGoss installed
* Inspec installed

### Build the required Docker images

* Execute `./build-docker-images`

This will build the following images:

* **sample-app-image**: Docker image containing a Micronaut app to demonstrate Goss/Inspec Testing and can be used for Clair container scan.

## Step 1: Run SonarQube [demo is optional]

* Start SonarQube by using docker-compose > dc up
* Navigate to [http://localhost:9000](http://localhost:9000)
* Demonstrate the use of SonarQube (if required)

## Step 2: Run SonarQube analysis

* Make sure SonarQube is running on 
* Execute `$ ./run.sh` this compiles and sends data to SonarQube
* Navigate to [http://localhost:9000](http://localhost:9000) and show the results

## Step 3: License Management and Security Incidents

* Execute `$ ./run.sh` and show the reports that are generated in the build directory

## Step 4: Goss Testing

* Show the simple test noted in goss.yaml
* Run the test using `$ ./run-test.sh`
* Modify the test by adding test usinng goss `$ ./edit-test.sh`

    ```
    goss add file /app/application.jar
    goss add service sshd
    goss add service ftp
    ```

## Step 5: Inspec Testing

* Start Inspec `$ inspec shell`
* Create a simple test
    
    ```
    file('/tmp').directory?
    
    describe file('/tmp') do
        it { should exist }
        it { should be_directory }
    end

    describe service('ssh') do
        it { should be_installed }
    end

    describe port('80') do
        it { should_not be_listening }
    end
    ```
    - `$ inspec exec simpletest.rb`
* Run docker test using `inspec exec`
    * start the docker-container using 
        * `$ start-docker.sh`
    * run test 
        * `$ inspec exec container-test-external.rb`
    * run test 
        * `$ inspec exec container-test-internal.rb -t docker://sample-app-container`
* Run docker test using profile
    * `$ ./run-test-with-profile`

## Step 6: Clair Scan

* Start clair using: 
    * `$ ./start-clair.sh`
* Run ok-scan using: 
    * `$ ./run-ok-scan.sh`
* Run bad-scan using: 
    * `$ ./run-bad-scan.sh` (can take long)
* Run sample image scan: 
    * `$ ./run-sample-app-image-scan.sh`
* Run sample image scan with whitelist: 
    * `$ ./run-sample-app-image-scan-with-whitelist.sh`
* Stop clair using: 
    * `$ ./stop-clair.sh`

## Step 7: ScoutSuite

* Make sure to set **AWS\_ACCESS\_KEY\_ID** and **AWS\_SECRET\_ACCESS\_KEY** as environment variables, these will be given to ScoutSuite
* Run the scan using `dc up`
* Results will be in the `reports` directory
    * `reports/scoutsuite-report/report-aws-default.html`

---

## Demo Links

* The Programmer's Oath - [https://blog.cleancoder.com/uncle-bob/2015/11/18/TheProgrammersOath.html](https://blog.cleancoder.com/uncle-bob/2015/11/18/TheProgrammersOath.html)
* SonarQube - [https://www.sonarqube.org/](https://www.sonarqube.org/)
* CodeScene - [https://codescene.io/](https://codescene.io/)
* Goss - Quick and Easy server testing/validation - [https://github.com/aelsabbahy/goss](https://github.com/aelsabbahy/goss)
* Inspec - Compliance as Code - [https://www.inspec.io/](https://www.inspec.io/)
* DevSec.io - [https://dev-sec.io](https://dev-sec.io)
* Clair Container Scan - [https://github.com/coreos/clair](https://github.com/coreos/clair)
* Bad Dockerfile - [https://www.stindustries.net/docker/bad-dockerfile/](https://www.stindustries.net/docker/bad-dockerfile/)
* ScoutSuite - [https://github.com/nccgroup/ScoutSuite](https://github.com/nccgroup/ScoutSuite)
