# docker-ember

Docker and tooling for using ember-cli in a reproducable way.

## Why?

Our ember-cli builds have not been as reproducable as we'd have wanted
them to be.  Tooling can differ across machines because the operating
systems are different, therefore yielding different versions of
nodejs/iojs or different versions of sass bindings.  The sass bindings
are what pushed us over the edge to try out Dockers for sharing our
build environment.

With the advent of user-namespaces in Docker, mounting volumes with
the right privileges has become
transparant. (seehttp://www.jrslv.com/docker-1-10/#usernamespacesindocker
for some basic info)

The arguments you need to pass to the Docker run command for it to be
useful are too cumbersome, hence we've created scripts to help you
out.

## What?

We have 4 commands, each for a different use-case.  Run them at the
root of your project.

### ed

`ed` is your default friend.  `ed` helps you install npm & bower
dependencies, install new ember dependencies and run any other
non-interactive ember command.

    # Install a dependency
    ed ember install ember-cli-coffeescript
    # Install all current node modules
    ed npm install
    # Install bower components
    ed bower install

### eds

`eds` launches the ember server for you.

    # No nonsense ember server
    eds
    # Proxying to your localhost (note it's been renamed from localhost to host)
    eds --proxy http://host:8080

### edi

`edi` is the interactive version of `ed`.  It can ask you questions
and you can provide interactive answers.

    # Generate a route
    edi ember generate route epic-win
    # Release a new minor version
    edi ember release --minor

### edl
`edl` is your friend when developing addons. It provides a replacement for `npm link` and `npm unlink` that works in docker-ember. 

    # Create a global symlink of your addon
		cd your-ember-addon
		edl
		# Use that addon in another project
		cd your-ember-project
		edl your-ember-addon
		# Remove the global symlink of your addon
		cd your-ember-addon
		edl -u

*Note*: `edl` assumes `edi` is available on your PATH