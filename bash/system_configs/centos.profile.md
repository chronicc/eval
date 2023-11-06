## L11: pathmunge

A function which is used to add a path to the `PATH` environment variable when the path is not yet contained.

The function takes two arguments:

- `$1`: The path which should be added to the environment variable.
- `$2` (optional): The word **after** which causes the path to be added at the end of `PATH`. Providing anything else causes the path to be added at the start of `PATH`.


The case block is used to check if the provided path is already contained in `PATH`. The case argument may seem confusing at the beginning using the colon signs at the start and end. However this is a neat trick to find the path even if it would be located at the start or the end of `PATH` (where no colons are existing in the original string).

- Original PATH: `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin`
- Case argument: `:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:`

As an example the function will be called with `pathmunge /bin`. The search pattern of the case block looks like this: `:/bin:` Since the `/bin` path is located at the end of the `PATH` string it would not be matched with the original PATH but with the modified case argument.

---

## L25-34: Setup user variables

---

## L36-43: Add paths to PATH

---

##
