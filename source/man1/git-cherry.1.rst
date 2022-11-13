.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-cherry(1) — Linux manual page
=================================

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

   GIT-CHERRY(1)                  Git Manual                  GIT-CHERRY(1)

NAME
-------------------------------------------------

::

          git-cherry - Find commits yet to be applied to upstream


---------------------------------------------------------

::

          git cherry [-v] [<upstream> [<head> [<limit>]]]


---------------------------------------------------------------

::

          Determine whether there are commits in <head>..<upstream> that
          are equivalent to those in the range <limit>..<head>.

          The equivalence test is based on the diff, after removing
          whitespace and line numbers. git-cherry therefore detects when
          commits have been "copied" by means of git-cherry-pick(1),
          git-am(1) or git-rebase(1).

          Outputs the SHA1 of every commit in <limit>..<head>, prefixed
          with - for commits that have an equivalent in <upstream>, and +
          for commits that do not.


-------------------------------------------------------

::

          -v
              Show the commit subjects next to the SHA1s.

          <upstream>
              Upstream branch to search for equivalent commits. Defaults to
              the upstream branch of HEAD.

          <head>
              Working branch; defaults to HEAD.

          <limit>
              Do not report commits up to (and including) limit.


---------------------------------------------------------

::

      Patch workflows
          git-cherry is frequently used in patch-based workflows (see
          gitworkflows(7)) to determine if a series of patches has been
          applied by the upstream maintainer. In such a workflow you might
          create and send a topic branch like this:

              $ git checkout -b topic origin/master
              # work and create some commits
              $ git format-patch origin/master
              $ git send-email ... 00*

          Later, you can see whether your changes have been applied by
          saying (still on topic):

              $ git fetch  # update your notion of origin/master
              $ git cherry -v

      Concrete example
          In a situation where topic consisted of three commits, and the
          maintainer applied two of them, the situation might look like:

              $ git log --graph --oneline --decorate --boundary origin/master...topic
              * 7654321 (origin/master) upstream tip commit
              [... snip some other commits ...]
              * cccc111 cherry-pick of C
              * aaaa111 cherry-pick of A
              [... snip a lot more that has happened ...]
              | * cccc000 (topic) commit C
              | * bbbb000 commit B
              | * aaaa000 commit A
              |/
              o 1234567 branch point

          In such cases, git-cherry shows a concise summary of what has yet
          to be applied:

              $ git cherry origin/master topic
              - cccc000... commit C
              + bbbb000... commit B
              - aaaa000... commit A

          Here, we see that the commits A and C (marked with -) can be
          dropped from your topic branch when you rebase it on top of
          origin/master, while the commit B (marked with +) still needs to
          be kept so that it will be sent to be applied to origin/master.

      Using a limit
          The optional <limit> is useful in cases where your topic is based
          on other work that is not in upstream. Expanding on the previous
          example, this might look like:

              $ git log --graph --oneline --decorate --boundary origin/master...topic
              * 7654321 (origin/master) upstream tip commit
              [... snip some other commits ...]
              * cccc111 cherry-pick of C
              * aaaa111 cherry-pick of A
              [... snip a lot more that has happened ...]
              | * cccc000 (topic) commit C
              | * bbbb000 commit B
              | * aaaa000 commit A
              | * 0000fff (base) unpublished stuff F
              [... snip ...]
              | * 0000aaa unpublished stuff A
              |/
              o 1234567 merge-base between upstream and topic

          By specifying base as the limit, you can avoid listing commits
          between base and topic:

              $ git cherry origin/master topic base
              - cccc000... commit C
              + bbbb000... commit B
              - aaaa000... commit A


---------------------------------------------------------

::

          git-patch-id(1)


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

   Git 2.33.0.69.gc420321         08/27/2021                  GIT-CHERRY(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__

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
