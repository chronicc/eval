"""action run example"""

def _impl(ctx):
    args = []
    inputs = []
    source = ctx.file.source
    output = ctx.outputs.out

    args.append(source.path)
    args.append(output.path)
    inputs.append(source)

    ctx.actions.run(
        arguments = args,
        inputs = inputs,
        outputs = [output],
        executable = ctx.executable.tool,
        progress_message = "copying data from {} to {}".format(source.path, output.path),
    )

    return DefaultInfo(files = depset([output]))

run_example = rule(
    implementation = _impl,
    attrs = dict(
        {
            "out": attr.output(
                mandatory = True,
            ),
            "source": attr.label(
                mandatory = True,
                allow_single_file = True,
            ),
            "tool": attr.label(
                allow_files = True,
                cfg = "exec",
                default = Label("//bazel/action_run/utils/run:run_binary"),
                executable = True,
            ),
        },
    ),
)
