# Dev-Ops

![Preview](https://drive.google.com/uc?export=view&id=1CGqjbikBeO108i3hoF02PE7qcLFkLzOi)

## What is it?

It is a project that is part of lazy-stock-screener which is a full-stack micro-service prototype product. This repository is also called umbrella project. Leveraging gitlab.ci, I build various kind of image for building image, which later is pushed to gitlab container registry.

## Why did I share this project in public?

The full product is still under constructing and the full product is committed to gitlab. I only share part of the use-case in order to demonstrate how I built up the stock-server.

## What features do this project have?

- Leverage docker-compose for building databases and services
- Leverage gitlab runner to deploy container from gitlab container registry to GKE.
- Build auto-deploy script image that contains istioctl and helm for other CI pipeline.
- Subchart pattern in Helm
- Instead of constructing project with submodule, setting .gitignore to ignore nest project folder.

## How did I build this project?

### Structure Overview

![Structure Overview](https://drive.google.com/uc?export=view&id=1P5eH-9PlpX9ouwS5M376NXaSntN7m_RY)

### CICD

- References

  [Even the Smallest Side Project Deserves Its K8s Cluster](https://betterprogramming.pub/even-the-smallest-side-project-deserves-its-k8s-cluster-3fc6f8a65e13)

  ![DevOps](https://drive.google.com/uc?export=view&id=1eZ7d4jNvJG_SLf9NrGal3RVvZ6jLGjqu)

### File Structure

- Helm
  - charts
    - customerweb
      - template
      - Chart.yaml
      - value.yaml
    - stockserver
  - templates
  - Chart.yaml
  - value.prod.yaml
  - value.stage.yaml
- docker-compose
  - scripts
  - unit-db
  - unit-microservice
- gitlab-runner
  - auto-deploy
    - src
      - auto-deploy.sh
    - Dockerfile
- .gitlab-ci.yaml

## TechStacks

- Dev
  - docker-compose
- Kubernetes
- Helm
- ISTIO
- Gitlab
- GKE

## References

- Gitlab CI pipeline setting
  - [https://about.gitlab.com/blog/2017/09/21/how-to-create-ci-cd-pipeline-with-autodeploy-to-kubernetes-using-gitlab-and-helm/](https://about.gitlab.com/blog/2017/09/21/how-to-create-ci-cd-pipeline-with-autodeploy-to-kubernetes-using-gitlab-and-helm/)
  - [https://github.com/lwolf/gitlab-ci-example](https://github.com/lwolf/gitlab-ci-example)
- Kubernetes with iSTIO on GKE
  - [https://github.com/GoogleCloudPlatform/microservices-demo](https://github.com/GoogleCloudPlatform/microservices-demo)
  - [https://github.com/GoogleCloudPlatform/istio-samples](https://github.com/GoogleCloudPlatform/istio-samples)
- Paceman-nginx-app with PVC/SC/Sts
  - [https://github.com/font/k8s-example-apps/tree/master/pacman-nginx-app](https://github.com/font/k8s-example-apps/tree/master/pacman-nginx-app)
- Kubernets offical example
  - [https://github.com/kubernetes/examples](https://github.com/kubernetes/examples)
- Stateful action
  - [https://www.openshift.com/blog/kubernetes-statefulset-in-action](https://www.openshift.com/blog/kubernetes-statefulset-in-action)
- Headless
  - [https://dev.to/kaoskater08/building-a-headless-service-in-kubernetes-3bk8](https://dev.to/kaoskater08/building-a-headless-service-in-kubernetes-3bk8)
