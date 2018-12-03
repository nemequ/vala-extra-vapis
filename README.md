This repository provides Vala bindings to various libraries which do
not provide their own bindings, and for which valac does not provide
bindings.

## Rationale

In most cases it is preferable for libraries to ship their own
bindings (some of the reasons why, as well as information on how to do
so, are at Vala Binding's
[Upstream Guide](https://wiki.gnome.org/Projects/Vala/UpstreamGuide).
Some libraries, however, are unable or unwilling to do so. Other
bindings are distributed with valac, but generally that is reserved
for relatively popular libraries with well structured VAPIs and have
a fairly strong aversion to breaking backwards compatibility.

Bindings included in this repository are meant to be copied into your
project or used as a git submodule or subtree, and are *not* intended
to be installed system-wide or packaged by distributions.  This means
that projects choose when to upgrade bindings instead of having the
bindings upgraded for them when a new version of Vala is installed,
which means backwards incompatible changes are allowed in this
repository.

Unlike valac, where submissions are carefully screened before
inclusion, the barrier to entry for this repository is quite low.
Pretty much the only thing which would preclude inclusion is a
licensing issue.  Contributors need not commit to maintaining the
bindings, preserving backwards compatibility, testing, etc.  With that
in mind, this repository provides a good stable, central location for
bindings.

## Usage

Because the bindings shipped in this repository provide no
backwards-compatibility promises, it is designed to be used as a git
submodule.  If that is not acceptable (for example, if you don't use
git), it is recommended you simply copy the bindings you need into
your source tree.

## Submitting Bindings For Inclusion

If you have bindings which you would like to see housed in this
repository, simply submit a bug to the "Bindings: Extra" component in
Vala's bugzilla product:

  https://bugzilla.gnome.org/browse.cgi?product=vala

Or, if you prefer to use GitHub, you can submit an issue or a pull
request to our GitHub mirror:

  https://github.com/nemequ/vala-extra-vapis/issues
