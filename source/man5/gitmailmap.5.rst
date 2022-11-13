.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gitmailmap(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SYNTAX <#SYNTAX>`__ \|           |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GITMAILMAP(5)                  Git Manual                  GITMAILMAP(5)

NAME
-------------------------------------------------

::

          gitmailmap - Map author/committer names and/or E-Mail addresses


---------------------------------------------------------

::

          $GIT_WORK_TREE/.mailmap


---------------------------------------------------------------

::

          If the file .mailmap exists at the toplevel of the repository, or
          at the location pointed to by the mailmap.file or mailmap.blob
          configuration options (see git-config(1)), it is used to map
          author and committer names and email addresses to canonical real
          names and email addresses.


-----------------------------------------------------

::

          The # character begins a comment to the end of line, blank lines
          are ignored.

          In the simple form, each line in the file consists of the
          canonical real name of an author, whitespace, and an email
          address used in the commit (enclosed by < and >) to map to the
          name. For example:

              Proper Name <commit@email.xx>

          The more complex forms are:

              <proper@email.xx> <commit@email.xx>

          which allows mailmap to replace only the email part of a commit,
          and:

              Proper Name <proper@email.xx> <commit@email.xx>

          which allows mailmap to replace both the name and the email of a
          commit matching the specified commit email address, and:

              Proper Name <proper@email.xx> Commit Name <commit@email.xx>

          which allows mailmap to replace both the name and the email of a
          commit matching both the specified commit name and email address.

          Both E-Mails and names are matched case-insensitively. For
          example this would also match the Commit Name <commit@email.xx>
          above:

              Proper Name <proper@email.xx> CoMmIt NaMe <CoMmIt@EmAiL.xX>


---------------------------------------------------

::

          Git does not follow symbolic links when accessing a .mailmap file
          in the working tree. This keeps behavior consistent when the file
          is accessed from the index or a tree versus from the filesystem.


---------------------------------------------------------

::

          Your history contains commits by two authors, Jane and Joe, whose
          names appear in the repository under several forms:

              Joe Developer <joe@example.com>
              Joe R. Developer <joe@example.com>
              Jane Doe <jane@example.com>
              Jane Doe <jane@laptop.(none)>
              Jane D. <jane@desktop.(none)>

          Now suppose that Joe wants his middle name initial used, and Jane
          prefers her family name fully spelled out. A .mailmap file to
          correct the names would look like:

              Joe R. Developer <joe@example.com>
              Jane Doe <jane@example.com>
              Jane Doe <jane@desktop.(none)>

          Note that there’s no need to map the name for
          <jane@laptop.(none)> to only correct the names. However, leaving
          the obviously broken <jane@laptop.(none)> and
          <jane@desktop.(none)> E-Mails as-is is usually not what you want.
          A .mailmap file which also corrects those is:

              Joe R. Developer <joe@example.com>
              Jane Doe <jane@example.com> <jane@laptop.(none)>
              Jane Doe <jane@example.com> <jane@desktop.(none)>

          Finally, let’s say that Joe and Jane shared an E-Mail address,
          but not a name, e.g. by having these two commits in the history
          generated by a bug reporting system. I.e. names appearing in
          history as:

              Joe <bugs@example.com>
              Jane <bugs@example.com>

          A full .mailmap file which also handles those cases (an addition
          of two lines to the above example) would be:

              Joe R. Developer <joe@example.com>
              Jane Doe <jane@example.com> <jane@laptop.(none)>
              Jane Doe <jane@example.com> <jane@desktop.(none)>
              Joe R. Developer <joe@example.com> Joe <bugs@example.com>
              Jane Doe <jane@example.com> Jane <bugs@example.com>


---------------------------------------------------------

::

          git-check-mailmap(1)


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

   Git 2.33.0.69.gc420321         08/27/2021                  GITMAILMAP(5)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-blame(1) <../man1/git-blame.1.html>`__, 
`git-check-mailmap(1) <../man1/git-check-mailmap.1.html>`__, 
`git-shortlog(1) <../man1/git-shortlog.1.html>`__

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
