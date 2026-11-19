# Kubernetes Basic Commands

  ------------------------------------------------------------------------------------
  Command                                          Purpose
  ------------------------------------------------ -----------------------------------
  `kubectl get nodes`                              To check how many nodes are present
                                                   in the cluster.

  `kubectl get pods`                               To check how many Pods are present.

  `kubectl get pods -o wide`                       To check Pod details and which node
                                                   the Pod is running on.

  `kubectl get deployments`                        To check how many Deployments are
                                                   present.

  `kubectl get services`                           To check how many Services are
                                                   present.

  `kubectl get namespaces`                         To check how many namespaces are
                                                   present.

  `kubectl get all`                                To check common Kubernetes
                                                   resources in the current namespace.

  `kubectl describe pod <pod-name>`                To check detailed information about
                                                   a Pod.

  `kubectl describe node <node-name>`              To check detailed information about
                                                   a node.

  `kubectl logs <pod-name>`                        To check application logs inside a
                                                   Pod.

  `kubectl exec -it <pod-name> -- /bin/sh`         To enter inside a running
                                                   container.

  `kubectl apply -f deployment.yaml`               To create or update resources using
                                                   a YAML file.

  `kubectl delete -f deployment.yaml`              To delete resources created using a
                                                   YAML file.

  `kubectl delete pod <pod-name>`                  To delete a Pod.

  `kubectl scale deployment <name> --replicas=3`   To increase or decrease the number
                                                   of Pods.

  `kubectl rollout status deployment <name>`       To check Deployment update status.

  `kubectl rollout undo deployment <name>`         To roll back a Deployment to its
                                                   previous version.

  `kubectl get events`                             To check Kubernetes cluster events.

  `kubectl get pods -A`                            To check Pods in all namespaces.

  `kubectl top nodes`                              To check CPU and memory usage of
                                                   nodes (requires metrics support).

  `kubectl top pods`                               To check CPU and memory usage of
                                                   Pods (requires metrics support).
  ------------------------------------------------------------------------------------

**Note:** Replace `<pod-name>`, `<node-name>`, and `<name>` with actual
resource names.
