subinclude("///pleasings//docker", "///pleasings//k8s")

docker_image(
    name = "image",
    srcs = ["//hello_service"],
    dockerfile = "Dockerfile",
    base_image = "//common/docker:base",
)

k8s_config(
    name = "k8s",
    srcs = [
        "deployment.yaml",
        "service.yaml",
    ],
    containers = ["//hello_service/k8s:image"],
)

