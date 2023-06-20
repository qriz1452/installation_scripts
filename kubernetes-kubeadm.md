## kubernetes installation on ubuntu 16.04 ( kubeadm - single master multi nodes )

Make sure docker installed in master and nodes, make sure master has 2 cpu's 

Execute below commands in both master and node 

 - sudo apt-get update && sudo apt-get install -y apt-transport-https curl
 - curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
 - cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list <br />
   deb https://apt.kubernetes.io/ kubernetes-xenial main <br />
   EOF
 - sudo apt-get update
 - sudo apt-get install -y kubelet kubeadm kubectl
 - sudo apt-mark hold kubelet kubeadm kubectl

for more details https://kubernetes.io/docs/setup/independent/install-kubeadm/

Execute below commands in master 

after executing this command you will get node's joining command, copy and paste it somewhere 
 - kubeadm init --pod-network-cidr=10.244.0.0/16 ( if you have forget to do then use kubeadm token create --print-join-command ) 
 - export KUBECONFIG=/etc/kubernetes/admin.conf
 - mkdir -p $HOME/.kube
 - sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
 - sudo chown $(id -u):$(id -g) $HOME/.kube/config;mkdir -p $HOME/.kube
 - sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
 - kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
 - kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml

Execute join command in node, which may look like as mentioned below 

       kubeadm join 10.128.0.8:6443 --token q915fe.do2ty6a8ow6qjixt \
       --discovery-token-ca-cert-hash sha256:acd137106e6b763d1ca6b5a4f7c1b1538c2ee8af81e47f9ea3f385c66cd710b3 

Then to verify use below commands
 - kubectl get nodes
 - kubectl get pods
 - Kubectl get service
