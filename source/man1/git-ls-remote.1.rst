.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-ls-remote(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-LS-REMOTE(1)               Git Manual               GIT-LS-REMOTE(1)

NAME
-------------------------------------------------

::

          git-ls-remote - List references in a remote repository


---------------------------------------------------------

::

          git ls-remote [--heads] [--tags] [--refs] [--upload-pack=<exec>]
                        [-q | --quiet] [--exit-code] [--get-url] [--sort=<key>]
                        [--symref] [<repository> [<refs>...]]


---------------------------------------------------------------

::

          Displays references available in a remote repository along with
          the associated commit IDs.


-------------------------------------------------------

::

          -h, --heads, -t, --tags
              Limit to only refs/heads and refs/tags, respectively. These
              options are not mutually exclusive; when given both,
              references stored in refs/heads and refs/tags are displayed.
              Note that git ls-remote -h used without anything else on the
              command line gives help, consistent with other git
              subcommands.

          --refs
              Do not show peeled tags or pseudorefs like HEAD in the
              output.

          -q, --quiet
              Do not print remote URL to stderr.

          --upload-pack=<exec>
              Specify the full path of git-upload-pack on the remote host.
              This allows listing references from repositories accessed via
              SSH and where the SSH daemon does not use the PATH configured
              by the user.

          --exit-code
              Exit with status "2" when no matching refs are found in the
              remote repository. Usually the command exits with status "0"
              to indicate it successfully talked with the remote
              repository, whether it found any matching refs.

          --get-url
              Expand the URL of the given remote repository taking into
              account any "url.<base>.insteadOf" config setting (See
              git-config(1)) and exit without talking to the remote.

          --symref
              In addition to the object pointed by it, show the underlying
              ref pointed by it when showing a symbolic ref. Currently,
              upload-pack only shows the symref HEAD, so it will be the
              only one shown by ls-remote.

          --sort=<key>
              Sort based on the key given. Prefix - to sort in descending
              order of the value. Supports "version:refname" or "v:refname"
              (tag names are treated as versions). The "version:refname"
              sort order can also be affected by the "versionsort.suffix"
              configuration variable. See git-for-each-ref(1) for more sort
              options, but be aware keys like committerdate that require
              access to the objects themselves will not work for refs whose
              objects have not yet been fetched from the remote, and will
              give a missing object error.

          -o <option>, --server-option=<option>
              Transmit the given string to the server when communicating
              using protocol version 2. The given string must not contain a
              NUL or LF character. When multiple --server-option=<option>
              are given, they are all sent to the other side in the order
              listed on the command line.

          <repository>
              The "remote" repository to query. This parameter can be
              either a URL or the name of a remote (see the GIT URLS and
              REMOTES sections of git-fetch(1)).

          <refs>...
              When unspecified, all references, after filtering done with
              --heads and --tags, are shown. When <refs>... are specified,
              only references matching the given patterns are displayed.


---------------------------------------------------------

::

              $ git ls-remote --tags ./.
              d6602ec5194c87b0fc87103ca4d67251c76f233a        refs/tags/v0.99
              f25a265a342aed6041ab0cc484224d9ca54b6f41        refs/tags/v0.99.1
              7ceca275d047c90c0c7d5afb13ab97efdf51bd6e        refs/tags/v0.99.3
              c5db5456ae3b0873fc659c19fafdde22313cc441        refs/tags/v0.99.2
              0918385dbd9656cab0d1d81ba7453d49bbc16250        refs/tags/junio-gpg-pub
              $ git ls-remote http://www.kernel.org/pub/scm/git/git.git master seen rc
              5fe978a5381f1fbad26a80e682ddd2a401966740        refs/heads/master
              c781a84b5204fb294c9ccc79f8b3baceeb32c061        refs/heads/seen
              $ git remote add korg http://www.kernel.org/pub/scm/git/git.git
              $ git ls-remote --tags korg v\*
              d6602ec5194c87b0fc87103ca4d67251c76f233a        refs/tags/v0.99
              f25a265a342aed6041ab0cc484224d9ca54b6f41        refs/tags/v0.99.1
              c5db5456ae3b0873fc659c19fafdde22313cc441        refs/tags/v0.99.2
              7ceca275d047c90c0c7d5afb13ab97efdf51bd6e        refs/tags/v0.99.3


---------------------------------------------------------

::

          git-check-ref-format(1).


-----------------------------------------------

::

          Part of the git(1) suite

COLOPHON
---------------------------------------------------------

::

          This page is part of the git (Git distributed version control
          system) project.  Information about the project can be found at
          ⟨http://git-scm.com/⟩.  If you have a bug report for this manual
          page, see ⟨http://git-scm.com/community⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/git/git.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Git 2.33.0.69.gc420321         08/27/2021               GIT-LS-REMOTE(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-bundle(1) <../man1/git-bundle.1.html>`__, 
`git-show-ref(1) <../man1/git-show-ref.1.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
