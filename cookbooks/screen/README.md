Description
===========

Installs screen

Requirements
============

## Platform:

* Debian/Ubuntu
* RHEL/CentOS/Fedora

## Cookbooks:

* git
* build-essential

Attributes
==========

* `node['screen']['source']['revision']` - Git revision to checkout in
  the source recipe.
* ``node['screen']['source']['prefix_dir']` - Directory to use for
  `configure`'s prefix in source recipe.

Recipes
=======

## default

Installs the screen package.

## source

Installs screen from source. Use this if a newer version of screen is
desired than the one available as a package.

License and Author
==================

- Author:: Joshua Timberman <joshua@opscode.com>
- Author:: Allan Espinosa
- Copyright:: 2008-2012, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
