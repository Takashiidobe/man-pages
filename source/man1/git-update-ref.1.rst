.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-update-ref(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `LOGG                             |                                   |
| ING UPDATES <#LOGGING_UPDATES>`__ |                                   |
| \| `GIT <#GIT>`__ \|              |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-UPDATE-REF(1)              Git Manual              GIT-UPDATE-REF(1)

NAME
-------------------------------------------------

::

          git-update-ref - Update the object name stored in a ref safely


---------------------------------------------------------

::

          git update-ref [-m <reason>] [--no-deref] (-d <ref> [<oldvalue>] | [--create-reflog] <ref> <newvalue> [<oldvalue>] | --stdin [-z])


---------------------------------------------------------------

::

          Given two arguments, stores the <newvalue> in the <ref>, possibly
          dereferencing the symbolic refs. E.g. git update-ref HEAD
          <newvalue> updates the current branch head to the new object.

          Given three arguments, stores the <newvalue> in the <ref>,
          possibly dereferencing the symbolic refs, after verifying that
          the current value of the <ref> matches <oldvalue>. E.g. git
          update-ref refs/heads/master <newvalue> <oldvalue> updates the
          master branch head to <newvalue> only if its current value is
          <oldvalue>. You can specify 40 "0" or an empty string as
          <oldvalue> to make sure that the ref you are creating does not
          exist.

          It also allows a "ref" file to be a symbolic pointer to another
          ref file by starting with the four-byte header sequence of
          "ref:".

          More importantly, it allows the update of a ref file to follow
          these symbolic pointers, whether they are symlinks or these
          "regular file symbolic refs". It follows real symlinks only if
          they start with "refs/": otherwise it will just try to read them
          and update them as a regular file (i.e. it will allow the
          filesystem to follow them, but will overwrite such a symlink to
          somewhere else with a regular filename).

          If --no-deref is given, <ref> itself is overwritten, rather than
          the result of following the symbolic pointers.

          In general, using

              git update-ref HEAD "$head"

          should be a lot safer than doing

              echo "$head" > "$GIT_DIR/HEAD"

          both from a symlink following standpoint and an error checking
          standpoint. The "refs/" rule for symlinks means that symlinks
          that point to "outside" the tree are safe: they’ll be followed
          for reading but not for writing (so we’ll never write through a
          ref symlink to some other tree, if you have copied a whole
          archive by creating a symlink tree).

          With -d flag, it deletes the named <ref> after verifying it still
          contains <oldvalue>.

          With --stdin, update-ref reads instructions from standard input
          and performs all modifications together. Specify commands of the
          form:

              update SP <ref> SP <newvalue> [SP <oldvalue>] LF
              create SP <ref> SP <newvalue> LF
              delete SP <ref> [SP <oldvalue>] LF
              verify SP <ref> [SP <oldvalue>] LF
              option SP <opt> LF
              start LF
              prepare LF
              commit LF
              abort LF

          With --create-reflog, update-ref will create a reflog for each
          ref even if one would not ordinarily be created.

          Quote fields containing whitespace as if they were strings in C
          source code; i.e., surrounded by double-quotes and with backslash
          escapes. Use 40 "0" characters or the empty string to specify a
          zero value. To specify a missing value, omit the value and its
          preceding SP entirely.

          Alternatively, use -z to specify in NUL-terminated format,
          without quoting:

              update SP <ref> NUL <newvalue> NUL [<oldvalue>] NUL
              create SP <ref> NUL <newvalue> NUL
              delete SP <ref> NUL [<oldvalue>] NUL
              verify SP <ref> NUL [<oldvalue>] NUL
              option SP <opt> NUL
              start NUL
              prepare NUL
              commit NUL
              abort NUL

          In this format, use 40 "0" to specify a zero value, and use the
          empty string to specify a missing value.

          In either format, values can be specified in any form that Git
          recognizes as an object name. Commands in any other format or a
          repeated <ref> produce an error. Command meanings are:

          update
              Set <ref> to <newvalue> after verifying <oldvalue>, if given.
              Specify a zero <newvalue> to ensure the ref does not exist
              after the update and/or a zero <oldvalue> to make sure the
              ref does not exist before the update.

          create
              Create <ref> with <newvalue> after verifying it does not
              exist. The given <newvalue> may not be zero.

          delete
              Delete <ref> after verifying it exists with <oldvalue>, if
              given. If given, <oldvalue> may not be zero.

          verify
              Verify <ref> against <oldvalue> but do not change it. If
              <oldvalue> is zero or missing, the ref must not exist.

          option
              Modify behavior of the next command naming a <ref>. The only
              valid option is no-deref to avoid dereferencing a symbolic
              ref.

          start
              Start a transaction. In contrast to a non-transactional
              session, a transaction will automatically abort if the
              session ends without an explicit commit. This command may
              create a new empty transaction when the current one has been
              committed or aborted already.

          prepare
              Prepare to commit the transaction. This will create lock
              files for all queued reference updates. If one reference
              could not be locked, the transaction will be aborted.

          commit
              Commit all reference updates queued for the transaction,
              ending the transaction.

          abort
              Abort the transaction, releasing all locks if the transaction
              is in prepared state.

          If all <ref>s can be locked with matching <oldvalue>s
          simultaneously, all modifications are performed. Otherwise, no
          modifications are performed. Note that while each individual
          <ref> is updated or deleted atomically, a concurrent reader may
          still see a subset of the modifications.


-----------------------------------------------------------------------

::

          If config parameter "core.logAllRefUpdates" is true and the ref
          is one under "refs/heads/", "refs/remotes/", "refs/notes/", or a
          pseudoref like HEAD or ORIG_HEAD; or the file
          "$GIT_DIR/logs/<ref>" exists then git update-ref will append a
          line to the log file "$GIT_DIR/logs/<ref>" (dereferencing all
          symbolic refs before creating the log name) describing the change
          in ref value. Log lines are formatted as:

              oldsha1 SP newsha1 SP committer LF

          Where "oldsha1" is the 40 character hexadecimal value previously
          stored in <ref>, "newsha1" is the 40 character hexadecimal value
          of <newvalue> and "committer" is the committer’s name, email
          address and date in the standard Git committer ident format.

          Optionally with -m:

              oldsha1 SP newsha1 SP committer TAB message LF

          Where all fields are as described above and "message" is the
          value supplied to the -m option.

          An update will fail (without changing <ref>) if the current user
          is unable to create a new log file, append to the existing log
          file or does not have committer information available.


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

   Git 2.33.0.69.gc420321         08/27/2021              GIT-UPDATE-REF(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-show-ref(1) <../man1/git-show-ref.1.html>`__, 
`git-worktree(1) <../man1/git-worktree.1.html>`__, 
`gitrepository-layout(5) <../man5/gitrepository-layout.5.html>`__

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
