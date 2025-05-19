docker_image(
    name = "prometheus_oci",
    dependencies = [
        ":prometheus_files",
    ],
    repository = "chronicc/prometheus",
)

shell_command(
    name = "prometheus_files",
    execution_dependencies = [
        ":prometheus_tar",
    ],
    tools = [
        "clamscan",
        "gzip",
        "tar",
    ],
    command = "tar xzf prometheus.tar.gz --strip-components=1 -C container_fs",
    output_files = [
        "container_fs/prometheus",
        "container_fs/promtool",
    ],
    output_directories = [
        "docker/container_fs",
    ],
    log_output = True,
)

file(
    name = "prometheus_tar",
    source = http_source(
        # use curl -L $URL | tee >(wc -c) >(shasum -a 256) >/dev/null to get len and sha256
        url = "https://github.com/prometheus/prometheus/releases/download/v3.4.0/prometheus-3.4.0.linux-amd64.tar.gz",
        len = 117280295,
        sha256 = "e9d80c21f9c4aeefebcc1ab909b1a0cbaaa0950c22ae34cdeda9143ac2392a46",
        filename = "prometheus.tar.gz",
    ),
)
