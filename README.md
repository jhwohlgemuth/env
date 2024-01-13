env &nbsp;
[![CodeFactor](https://www.codefactor.io/repository/github/jhwohlgemuth/env/badge)](https://www.codefactor.io/repository/github/jhwohlgemuth/env)
===

> Create development **env**ironments like a pro with Docker, Vagrant, & Packer

What?
-----
- [Docker](https://www.docker.com/) is to [LXC](https://stackoverflow.com/questions/16047306/how-is-docker-different-from-a-normal-virtual-machine)
 as Vagrant is to [KVM](https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine)

- [Vagrant](https://www.vagrantup.com/) is a high-level wrapper API for kernel-based virtual machines (KVM).
Vagrant uses packaged environments called [boxes](https://docs.vagrantup.com/v2/boxes.html)
and allows one to manage, configure, and control virtual environments with code and automation.

- [Packer](https://packer.io/) enables one to _create Vagrant boxes_
(and [other things](https://packer.io/docs/builders/docker.html))
via an automated and repeatable process driven by a single [JSON-formatted template file](./packer.json).

> Vagrant, Packer, and Docker are tools that facilitate applying
[SOLID](https://scotch.io/bar-talk/s-o-l-i-d-the-first-five-principles-of-object-oriented-design),
[WORA](https://en.wikipedia.org/wiki/Write_once,_run_anywhere),
[PoLA](https://en.wikipedia.org/wiki/Principle_of_least_astonishment),
[YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it),
[DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
practices to the code that you write,
_and the environments in which the code is written and used_ (spoken:  _" infrastructure and stuff "_).


Quickstarts
-----------
- [Development within virtual machines using Vagrant (and make your own with Packer)](dev-with-virtual-machines/)

Future
------
- See [env Trello board](https://trello.com/b/WEMB9CEL/env)
