## Intrapp



## Description
Is a centralized Command and Control tool for server administration which is
built ontop of [Ammonite][1], a programmable scala interpreter.

## Quick Access Guidelines

```bash
ssh intrapp@intrapp.intramo.seitenbau.net:22222
password: intrapp
```

if an ssh key error occurs, clear your ssh_keys file.
this may occur on a server restart since keys get regenerated. To circumvent 
this, use the following alias in your ~/.bashrc:

```bash
alias intrapp="ssh-keygen -f "~/.ssh/known_hosts" -R [intrapp.intramo.seitenbau.net]:22222 &&  ssh intrapp@intrapp.intramo.seitenbau.net -p 22222"
```

## Project Structure
```
├── clearcache.sh
├── commit.sh
├── setup.sh
└── trunk
    ├── build.sbt
    ├── docs
    │   ├── init.vim
    │   └── readme.md
    ├── src
    │   ├── main
    │   │   ├── resources
    │   │   │   ├── akka
    │   │   │   │   └── application.conf
    │   │   │   ├── ammonite
    │   │   │   │   └── predef.sc
    │   │   │   └── sbt
    │   │   │       └── repositories
    │   │   ├── scala
    │   │   │   ├── CliService.scala
    │   │   │   ├── DevopsCustomer_intramo.scala
    │   │   │   ├── DevopsCustomer_template.scala
    │   │   │   ├── DevopsLogic.scala
    │   │   │   ├── motd.scala
    │   │   │   └── util
    │   │   └── svn-commit.tmp
    │   └── test
    │       └── scala
    │           └── example
    │               └── HelloSpec.scala
```

## Install

Make sure Java >= 1.8 and Scala >= 2.12.x are installed. The project is
bootstrapped using ~/.ammonite/predef.scala, which initializes the shell
and loads modules into SSH's namespace'. view the file for more details.

The project uses the following stack:
* Ammonite 0.8
* Java 1.8
* Ivy
* sbt
* Akka

## Development


* CliService.scala is the main entry point of the project, Read this file and
understand what it does.

* Adding new modules/functions to the project happens under *../trunk/src/main/scala*
using a copy of the template file *DevopsCustomer\_template.scala*. Name this
file properly, then add it to the *~/.ammonite/predef.scala* file. This should
load your new functions into the proper namespace.

* predef.sc is an Ammonite bootstrapping mechanism/file that loads and enables certain
Ammonite functionalities (adding directory modules, for example) it's used to also
bootstrap Intrapp's module files and facilitates module loading in general.
file under ~/.ammonite/ for more details.

* application.conf is a local akka configuration for intrapp-cli, it should not be changed unless
necessary, as it includes the actors list needed for data manipulation. If a new actor is created,
is should be added there. The global akka configuration is located under common/src/main/resources
and is reponsible for launching the Rest entry point on *cobbler*.

## Run

```bash
cd trunk
sbt clean compile run
```
make sure sbt is properly installed
make sure that setup.sh has been executed, so files are properly linked.
make sure the resources/akka/application.conf file includes the proper machine IP.
you will need to input SVN user and pass manually

## Setting up NeoVim as IDE

* install ctags or exuberant-ctag for searching and navigation

* make sure ~/.ctags includes the following lines:
```sbt
--langdef=scala
--langmap=scala:.scala
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private[^ ]*|protected)?[ \t]*class[ \t]+([a-zA-Z0-9_]+)/\4/c,classes/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private[^ ]*|protected)?[ \t]*object[ \t]+([a-zA-Z0-9_]+)/\4/c,objects/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private[^ ]*|protected)?[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*case class[ \t]+([a-zA-Z0-9_]+)/\6/c,case classes/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private[^ ]*|protected)?[ \t]*case object[ \t]+([a-zA-Z0-9_]+)/\4/c,case objects/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private[^ ]*|protected)?[ \t]*trait[ \t]+([a-zA-Z0-9_]+)/\4/t,traits/
--regex-scala=/^[ \t]*type[ \t]+([a-zA-Z0-9_]+)/\1/T,types/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy|private[^ ]*(\[[a-z]*\])*|protected)[ \t]*)*def[ \t]+([a-zA-Z0-9_]+)/\4/m,methods/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy|private[^ ]*|protected)[ \t]*)*val[ \t]+([a-zA-Z0-9_]+)/\3/l,constants/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy|private[^ ]*|protected)[ \t]*)*var[ \t]+([a-zA-Z0-9_]+)/\3/l,variables/
--regex-scala=/^[ \t]*package[ \t]+([a-zA-Z0-9_.]+)/\1/p,packages/
CTAGS=$(shell command-v ctags)
```

* make sure the sbt plugin for tags is installed and and that ~/.sbt/0.13/plugins/plugins.sbt includes the following line:
` addSbtPlugin("net.ceedubs" %% "sbt-ctags" % "0.2.0")`

* generate the ctags for the project inside the trunk directory
`sbt gen-ctags`

- get neoVim (vim is too slow)

```bash
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

- customize neoVim as you wish, see included init.vim for tips

- make sure these lines are included in the init.vim, ctags auto completion @ leonard.io/blog/2013/04/editing-scala-with-vim/

```vim
set tags=./tags;,tags;/
let g:scala_sort_across_groups=1
set regexpengine=1
nnoremap <C-T> <C-w>g] <C-r><C-w>
```
the binding "ctrl t" will jump to the definition under the cursor (or offer a list to choose from)
and open the file in a new horizontal tab.

the binding "ctrl p" will find any files within the project. (assuming you're using the given init.vim)

the binding "f9" will open a NerdTree fs commander for navigation

## Usage

```
https://confluence.seitenbau.net/pages/viewpage.action?pageId=78515413
```

## Learn

* Li Haoyi's own demo of Ammonite[2]
* Akka docs


## Deployment

* Setup.sh should be used for local development and it will create aswell
as link the project files to their proper places.

* Deployment on servers should be done through a puppet run using module #number

## Sources

    [1]:  http://www.lihaoyi.com/Ammonite/
    [2]: https://www.youtube.com/watch?v=dP5tkmWAhjg
