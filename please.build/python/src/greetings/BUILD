python_library(
    name = "greetings",
    srcs = ["greetings.py"],
    visibility = ["//src/..."],
    deps = ["//third_party/python:numpy"],
)

python_test(
    name = "greetings_test",
    srcs = ["greetings_test.py"],
    deps = [":greetings"],
)

