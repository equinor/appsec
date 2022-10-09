# Guideline - Containers

### 1. Securing Images:
- `Include your application in a container image`: A container image holds a subset of the OS along with the application. Each library/tool you pull into the image poses a potential threat. To mitigate these threats, you need to include the application within the container image.
- `Include as little as possible`: Remove all components that aren't required by the application. This can help you reduce the attack surface.
- `Use trustworthy images`: If you are not creating the image from scratch, you should choose images that are trusted official images hosted on sites like **Docker Hub**.

### 2. Securing Registries
- `Use access control`: If you have your own private registry, you need to establish access controls that define exactly who can access and publish images and who cannot perform these actions; which prevents unauthorized parties from changing these images.
- `Sign your images`: Signatures help track images to the people who signed them. This makes it difficult to substitute the signed image for a compromised one. The **Docker Content Trust** mechanism provides information about signing images. You can also use **Notary**, an open-source tool that helps you sign and verify images.
- `Scan your images`: Use vulnerability scanners like **Snyk** to check if the image is having any known vulnerability. You can know more about container scanning with **Snyk**, [here](../../snyk/guidelines/4-snyk_container_security.md).

### 3. Securing Deployment
- `Secure the target environment`: You can do this by hardening the underlying host operating system. You can also establish firewall and VPC rules or create special accounts that limit access.
- `Use an orchestration platform`: These systems usually provide secure API endpoints as well as role-based access control, which can help minimize the risk of unauthorized access.
- `Use immutable deployments`: This involves creating an instance image during your build steps. Your deployment can then use this image to create new instances.

### 4. Securing Container Runtime
- Create separate virtual networks for your containers.
- `Apply the principle of least privilege`: Allow connectivity only between containers that truly need it.
- `Expose only the ports that serve the application`: Do not expose any other ports, except for those serving the application. Apply this principle to containers as well as the underlying machines.
- `Use TLS to secure communication between services`: This process encrypts traffic and ensures only authorized endpoints are allowed.
- `Use the Docker Image policy plugin`: This plugin is designed to prevent any process from pulling images that were not previously allow-listed.

### 5. Securing Kubernetes
- `Use a service mesh architecture`: They provide traffic monitoring, management, and policy enforcement without affecting microservices.
- `Use OPA`: Open Policy Agent enforces custom policies on a Kubernetes object without reconfiguring or recompiling the Kubernetes API server.
- `Keep the etcd cluster separate`: Use a firewall to protect the etcd cluster, which stores state and secret information and requires special protection compared to other Kubernetes components.
- `Ensure the regular rotation of encryption keys`: Regularly rotating encryption keys and certificates helps minimize the blast radius of an attack that compromises keys.
- `Use static analysis for YAML`: Statically analyze where pod security policies deny access to API servers. This should be part of the development workflow because it helps identify the organization’s risk tolerance and compliance requirements.
- `Manage secrets`: Integrate clusters using a secret management system to ensure application pods automatically receive all secrets and passwords needed at runtime.
- `Use third-party authorization for API servers`: You can manage and secure Kubernetes API access by creating detailed auth policies and applying advanced, full-featured verification technologies.

### 6. Using Thin, Short-Lived Containers to Reduce Your Attack Surface
You should strive to minimize the number of components in each container and keep all containers as thin as possible. This approach can help reduce the attack surface. Additionally, when identifying vulnerabilities in standard images, you should quickly resolve the issue and then deploy a new, clean container.

### 7. Using Container Security Tools
Container orchestration platforms, like Kubernetes, provide native security capabilities. However, these controls are not enough to ensure the security and health of containerized applications. A particular challenge is ensuring that none of the third-party software components included in the workload contain critical vulnerabilities or any misconfigured permissions. You can mitigate security risks by using container security tools, which can help you manage access, test security, and protect your infrastructure.

### 8. Monitoring Container Activity
Containerized workloads are highly dynamic. One container image often has multiple running instances. Additionally, new images and new versions are deployed at a high-paced speed. Issues can, therefore, quickly propagate across multiple containers and applications. This is why it is highly critical to identify these issues quickly and remediate each issue at the source.
To maintain security, you should implement security practices and tools that can help you achieve observability for the following components:
- Master nodes (when using a container orchestration platform like Kubernetes)
- Container engines
- Workloads running in containers
- Containerized middleware and networking