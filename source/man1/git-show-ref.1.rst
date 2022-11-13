.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-show-ref(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-SHOW-REF(1)                Git Manual                GIT-SHOW-REF(1)

NAME
-------------------------------------------------

::

          git-show-ref - List references in a local repository


---------------------------------------------------------

::

          git show-ref [-q|--quiet] [--verify] [--head] [-d|--dereference]
                       [-s|--hash[=<n>]] [--abbrev[=<n>]] [--tags]
                       [--heads] [--] [<pattern>...]
          git show-ref --exclude-existing[=<pattern>]


---------------------------------------------------------------

::

          Displays references available in a local repository along with
          the associated commit IDs. Results can be filtered using a
          pattern and tags can be dereferenced into object IDs.
          Additionally, it can be used to test whether a particular ref
          exists.

          By default, shows the tags, heads, and remote refs.

          The --exclude-existing form is a filter that does the inverse. It
          reads refs from stdin, one ref per line, and shows those that
          don’t exist in the local repository.

          Use of this utility is encouraged in favor of directly accessing
          files under the .git directory.


-------------------------------------------------------

::

          --head
              Show the HEAD reference, even if it would normally be
              filtered out.

          --heads, --tags
              Limit to "refs/heads" and "refs/tags", respectively. These
              options are not mutually exclusive; when given both,
              references stored in "refs/heads" and "refs/tags" are
              displayed.

          -d, --dereference
              Dereference tags into object IDs as well. They will be shown
              with "^{}" appended.

          -s, --hash[=<n>]
              Only show the SHA-1 hash, not the reference name. When
              combined with --dereference the dereferenced tag will still
              be shown after the SHA-1.

          --verify
              Enable stricter reference checking by requiring an exact ref
              path. Aside from returning an error code of 1, it will also
              print an error message if --quiet was not specified.

          --abbrev[=<n>]
              Abbreviate the object name. When using --hash, you do not
              have to say --hash --abbrev; --hash=n would do.

          -q, --quiet
              Do not print any results to stdout. When combined with
              --verify this can be used to silently check if a reference
              exists.

          --exclude-existing[=<pattern>]
              Make git show-ref act as a filter that reads refs from stdin
              of the form "^(?:<anything>\s)?<refname>(?:\^{})?$" and
              performs the following actions on each: (1) strip "^{}" at
              the end of line if any; (2) ignore if pattern is provided and
              does not head-match refname; (3) warn if refname is not a
              well-formed refname and skip; (4) ignore if refname is a ref
              that exists in the local repository; (5) otherwise output the
              line.

          <pattern>...
              Show references matching one or more patterns. Patterns are
              matched from the end of the full name, and only complete
              parts are matched, e.g.  master matches refs/heads/master,
              refs/remotes/origin/master, refs/tags/jedi/master but not
              refs/heads/mymaster or refs/remotes/master/jedi.


-----------------------------------------------------

::

          The output is in the format: <SHA-1 ID> <space> <reference name>.

              $ git show-ref --head --dereference
              832e76a9899f560a90ffd62ae2ce83bbeff58f54 HEAD
              832e76a9899f560a90ffd62ae2ce83bbeff58f54 refs/heads/master
              832e76a9899f560a90ffd62ae2ce83bbeff58f54 refs/heads/origin
              3521017556c5de4159da4615a39fa4d5d2c279b5 refs/tags/v0.99.9c
              6ddc0964034342519a87fe013781abf31c6db6ad refs/tags/v0.99.9c^{}
              055e4ae3ae6eb344cbabf2a5256a49ea66040131 refs/tags/v1.0rc4
              423325a2d24638ddcc82ce47be5e40be550f4507 refs/tags/v1.0rc4^{}
              ...

          When using --hash (and not --dereference) the output format is:
          <SHA-1 ID>

              $ git show-ref --heads --hash
              2e3ba0114a1f52b47df29743d6915d056be13278
              185008ae97960c8d551adcd9e23565194651b5d1
              03adf42c988195b50e1a1935ba5fcbc39b2b029b
              ...


---------------------------------------------------------

::

          To show all references called "master", whether tags or heads or
          anything else, and regardless of how deep in the reference naming
          hierarchy they are, use:

                      git show-ref master

          This will show "refs/heads/master" but also
          "refs/remote/other-repo/master", if such references exists.

          When using the --verify flag, the command requires an exact path:

                      git show-ref --verify refs/heads/master

          will only match the exact branch called "master".

          If nothing matches, git show-ref will return an error code of 1,
          and in the case of verification, it will show an error message.

          For scripting, you can ask it to be quiet with the "--quiet"
          flag, which allows you to do things like

                      git show-ref --quiet --verify -- "refs/heads/$headname" ||
                              echo "$headname is not a valid branch"

          to check whether a particular branch exists or not (notice how we
          don’t actually want to show any results, and we want to use the
          full refname for it in order to not trigger the problem with
          ambiguous partial matches).

          To show only tags, or only proper branch heads, use "--tags"
          and/or "--heads" respectively (using both means that it shows
          tags and heads, but not other random references under the refs/
          subdirectory).

          To do automatic tag object dereferencing, use the "-d" or
          "--dereference" flag, so you can do

                      git show-ref --tags --dereference

          to get a listing of all tags together with what they dereference.


---------------------------------------------------

::

          .git/refs/*, .git/packed-refs


---------------------------------------------------------

::

          git-for-each-ref(1), git-ls-remote(1), git-update-ref(1),
          gitrepository-layout(5)


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

   Git 2.33.0.69.gc420321         08/27/2021                GIT-SHOW-REF(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-for-each-ref(1) <../man1/git-for-each-ref.1.html>`__

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
