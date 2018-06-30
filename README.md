# Git Contribution Stats

Use these scripts to see the Github contribution stats. Currently there are two ways of seeing stats:

1. Top committers
2. Github contribution history 
3. Most changed files

## Installation

Everything to see the stats is in this repository.

```
git clone https://github.com/stanislaw/GitContributionStats
cd GitContributionStats
```

## Top committers

Example: [KLEE LLVM Execution Engine](http://klee.github.io/).

```bash
$ GIT_PROJECT_PATH=~/Projects/klee make top
   306  Daniel Dunbar <daniel@zuster.org>
   213  Cristian Cadar <cristic@cs.stanford.edu>
   199  Dan Liew <daniel.liew@imperial.ac.uk>
   145  Cristian Cadar <c.cadar@imperial.ac.uk>
    83  Martin Nowack <martin@se.inf.tu-dresden.de>
    43  Peter Collingbourne <peter@pcc.me.uk>
    39  Dan Liew <delcypher@gmail.com>
    35  MartinNowack <martin.nowack@gmail.com>
    30  Martin Nowack <martin.nowack@gmail.com>
    21  Hristina Palikareva <h.palikareva@imperial.ac.uk>
    20  Hoang M. Le <hle@informatik.uni-bremen.de>
    11  Andrea Mattavelli <andreamattavelli@gmail.com>
...
```

## Contribution History

Example: [OCLint](http://oclint.org/).

```bash
$ GIT_PROJECT_PATH=~/Projects/OCLint make history
   1 [12.11.12 - 15.07.11 => 31 months]   507 commits by Longyi Qi <lqi+git@longyiqi.com>
   2 [13.02.22 - 13.12.07 =>  9 months]    10 commits by Stephan Esch <stephan@esch.cc>
   3 [13.04.03 - 13.12.11 =>  8 months]    41 commits by Akiva Leffert <akiva@etsy.com>
   4 [13.05.29 - 13.05.29 =>  0 months]     1 commits by Martin Olsson <martin@minimum.se>
   5 [13.06.25 - 13.09.10 =>  2 months]    14 commits by Joris <joris.dauphin+git@gmail.com>
   6 [13.07.12 - 14.03.09 =>  7 months]    21 commits by Christian Taedcke <hacking@taedcke.com>
   7 [13.07.07 - 13.08.18 =>  1 months]    27 commits by Nikolaj Schumacher <git@nschum.de>
   8 [13.08.28 - 13.10.31 =>  2 months]    29 commits by Joseph Kain <joekain@gmail.com>
   9 [13.09.16 - 13.12.16 =>  3 months]    34 commits by Jarod42 <joris.dauphin@gmail.com>
  10 [13.10.13 - 14.01.14 =>  3 months]    21 commits by Janusz Chorko <jchorko@gmail.com>
  11 [13.11.25 - 13.11.27 =>  0 months]     3 commits by Lacy Rhoades <lrhoades@etsy.com>
  12 [14.01.15 - 14.01.15 =>  0 months]     4 commits by Sylvestre Ledru <sylvestre@debian.org>
  13 [14.01.16 - 14.01.16 =>  0 months]     1 commits by Fred Leboucher <fleboucher@dxo.com>
  14 [14.03.02 - 14.03.02 =>  0 months]     2 commits by Doug Warren <doug.warren@gmail.com>
  15 [14.04.08 - 14.04.08 =>  0 months]     1 commits by Brandon Evans <brandon@brandonevans.ca>
  16 [14.09.23 - 14.09.25 =>  0 months]     2 commits by Mickaël Guérin <kael@crocobox.org>
  17 [14.09.26 - 16.07.12 => 21 months]   172 commits by Ryuichi Saito <ryuichi@ryuichisaito.com>
  18 [15.07.10 - 15.07.10 =>  0 months]     2 commits by Antoine Pierlot-Garcin <antoine.pierlot-garcin@scle.fr>
  19 [15.07.22 - 15.07.22 =>  0 months]     2 commits by Lawrence D'Anna <larry@elder-gods.org>
  20 [15.10.03 - 15.10.22 =>  0 months]     6 commits by Martin Güthle <martin.guethle@bachmann-technology.com>
  21 [15.12.28 - 16.05.09 =>  4 months]     9 commits by Cédric Legrand <lefta@reload-linux.ch>
  22 [16.01.14 - 16.01.14 =>  0 months]     1 commits by Maksym Grebenets <maksym.grebenets@cba.com.au>
  23 [16.01.16 - 16.06.18 =>  5 months]    19 commits by Alexander Buddenbrock <a.buddenbrock@ish.de>
  24 [16.02.02 - 16.02.03 =>  0 months]     2 commits by Arnaud Gelas <arnaudgelas@gmail.com>
  25 [16.03.16 - 16.03.16 =>  0 months]     1 commits by Eugene Dymov <dymv@yandex-team.ru>
  26 [16.06.06 - 16.06.06 =>  0 months]     1 commits by living.Zhang <LivingcentZhang@gmail.com>
  27 [16.06.06 - 16.06.30 =>  0 months]     3 commits by Juan Pablo Civile <jpcivile@monits.com>
```

## Most changed files

```
GIT_PROJECT_PATH=/opt/mull make most_changed_files 
```

## Using Git's .mailmap to filter out unique contributors

Sometimes people contribute from different machines, using different SSH keys so the same person may appear multiple times. There is `.mailmap` file that can be created for aliases:

```
Stanislav Pankevich <s.pankevich@gmail.com>  Stanislav Pankevich <s.pankevich@someothermail.com> 
```

If you have a big project and want to simplify the task of creating a `.mailmap` file run the following command taken from [1] that will create a boilerplate for you:

```
git shortlog -se |   awk -F'\t' '{print $2,$3,$2,$3}' |   sort > .mailmap
```

It will sort contributors by the name so that you'll easily see the duplicates like:

```
Stanislav Pankevich <s.pankevich@gmail.com>  Stanislav Pankevich <s.pankevich@gmail.com> 
Stanislaw Pankevich <s.pankevich@gmail.com>  Stanislaw Pankevich <s.pankevich@gmail.com> 
```

See the good articles about `.mailmap`:

[1] [Git Shortlog and Mailmap](https://shane.io/2011/10/07/git-shortlog-and-mailmap.html)

[2] [Using mailmap to fix authors list in git](https://stacktoheap.com/blog/2013/01/06/using-mailmap-to-fix-authors-list-in-git/)

## Credits

The history stats script is based on the `git-chrono-authors` script which is a modified version of [git-authors](https://github.com/jgehrcke/git-authors/) script written by Jan-Philip Gehrcke.

