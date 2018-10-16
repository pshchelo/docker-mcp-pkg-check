# List package versionis between MCP repos

Use it as:

    docker build . -t pkglist
    docker run --rm pkglist <package-name>

Container is removed after command exits since it re-freshes
its apt cache on each start to ensure latest package versions are fetched.

List of repos is kept in `mcp-repos.list` (for untagged repos) and
`mcp-tagged.list` for tagged (release) repos. Adjust the lists as needed.

Also when new repos appear, it might be needed to add fetching new apt keys
to the container in the `Dockerfile`.

Pull requests are welcome.
