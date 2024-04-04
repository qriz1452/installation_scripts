Here's the provided installation guide in Markdown format:

```markdown
## Install containerd and Kubernetes on All Servers

Once we have logged in, we need to elevate privileges using sudo:

```bash
sudo su
```

Create the configuration file for containerd:

```bash
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
```

Load the modules:

```bash
sudo modprobe overlay
sudo modprobe br_netfilter
```

Set the system configurations for Kubernetes networking:

```bash
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
```

Apply the new settings:

```bash
sudo sysctl --system
```

Add the stable Docker Community Edition repository to yum:

```bash
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

Install containerd:

```bash
sudo yum install -y containerd.io
```

If above not working :
```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl start docker
```

Create the default configuration folder for containerd:

```bash
sudo mkdir -p /etc/containerd
```

Generate the default containerd configuration, and save it to the newly created default file:

```bash
sudo containerd config default | sudo tee /etc/containerd/config.toml
```

Restart containerd to ensure the new configuration file is used:

```bash
sudo systemctl restart containerd
```

Verify that containerd is running:

```bash
sudo systemctl status containerd
```

Disable swap:

```bash
sudo swapoff -a
```

Set SELinux in permissive mode (effectively disabling it):

```bash
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
```

Add the Kubernetes repository:

```bash
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
```

Install kubelet, kubeadm and kubectl:

```bash
sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
```

Enable the kubelet service:

```bash
sudo systemctl enable --now kubelet
```

### Note: Complete the following section on the MASTER ONLY!

Initialize the cluster using the IP range for Flannel:

```bash
kubeadm init --pod-network-cidr=10.244.0.0/16
```

Copy the kubeadmn join command that is in the output. We will need this later.

Exit sudo, copy the admin.conf to your home directory, and take ownership:

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Deploy Flannel:

```bash
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
```

Check the cluster state:

```bash
kubectl get pods --all-namespaces
```

### Note: Complete the following steps on the NODES ONLY!

Run the join command that you copied earlier, this requires running the command prefaced with sudo on the nodes. Then we'll check the nodes from the master.

```bash
kubectl get nodes
```

## Create and Scale a Deployment Using kubectl
Note: These commands will only be run on the master node.

Create a simple deployment:

```bash
kubectl create deployment nginx --image=nginx
```

Inspect the pod:

```bash
kubectl get pods
```

Scale the deployment:

```bash
kubectl scale deployment nginx --replicas=4
```

Inspect the pods. We should have four now:

```bash
kubectl get pods
```
```
