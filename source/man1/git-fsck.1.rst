.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-fsck(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `DISCUSSION <#DISCUSSION>`__   |                                   |
| \|                                |                                   |
| `EXTRACTED DIAGNO                 |                                   |
| STICS <#EXTRACTED_DIAGNOSTICS>`__ |                                   |
| \|                                |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `GIT <#GIT>`__ \|              |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-FSCK(1)                    Git Manual                    GIT-FSCK(1)

NAME
-------------------------------------------------

::

          git-fsck - Verifies the connectivity and validity of the objects
          in the database


---------------------------------------------------------

::

          git fsck [--tags] [--root] [--unreachable] [--cache] [--no-reflogs]
                   [--[no-]full] [--strict] [--verbose] [--lost-found]
                   [--[no-]dangling] [--[no-]progress] [--connectivity-only]
                   [--[no-]name-objects] [<object>*]


---------------------------------------------------------------

::

          Verifies the connectivity and validity of the objects in the
          database.


-------------------------------------------------------

::

          <object>
              An object to treat as the head of an unreachability trace.

              If no objects are given, git fsck defaults to using the index
              file, all SHA-1 references in refs namespace, and all reflogs
              (unless --no-reflogs is given) as heads.

          --unreachable
              Print out objects that exist but that aren’t reachable from
              any of the reference nodes.

          --[no-]dangling
              Print objects that exist but that are never directly used
              (default).  --no-dangling can be used to omit this
              information from the output.

          --root
              Report root nodes.

          --tags
              Report tags.

          --cache
              Consider any object recorded in the index also as a head node
              for an unreachability trace.

          --no-reflogs
              Do not consider commits that are referenced only by an entry
              in a reflog to be reachable. This option is meant only to
              search for commits that used to be in a ref, but now aren’t,
              but are still in that corresponding reflog.

          --full
              Check not just objects in GIT_OBJECT_DIRECTORY
              ($GIT_DIR/objects), but also the ones found in alternate
              object pools listed in GIT_ALTERNATE_OBJECT_DIRECTORIES or
              $GIT_DIR/objects/info/alternates, and in packed Git archives
              found in $GIT_DIR/objects/pack and corresponding pack
              subdirectories in alternate object pools. This is now
              default; you can turn it off with --no-full.

          --connectivity-only
              Check only the connectivity of reachable objects, making sure
              that any objects referenced by a reachable tag, commit, or
              tree is present. This speeds up the operation by avoiding
              reading blobs entirely (though it does still check that
              referenced blobs exist). This will detect corruption in
              commits and trees, but not do any semantic checks (e.g., for
              format errors). Corruption in blob objects will not be
              detected at all.

              Unreachable tags, commits, and trees will also be accessed to
              find the tips of dangling segments of history. Use
              --no-dangling if you don’t care about this output and want to
              speed it up further.

          --strict
              Enable more strict checking, namely to catch a file mode
              recorded with g+w bit set, which was created by older
              versions of Git. Existing repositories, including the Linux
              kernel, Git itself, and sparse repository have old objects
              that triggers this check, but it is recommended to check new
              projects with this flag.

          --verbose
              Be chatty.

          --lost-found
              Write dangling objects into .git/lost-found/commit/ or
              .git/lost-found/other/, depending on type. If the object is a
              blob, the contents are written into the file, rather than its
              object name.

          --name-objects
              When displaying names of reachable objects, in addition to
              the SHA-1 also display a name that describes how they are
              reachable, compatible with git-rev-parse(1), e.g.
              HEAD@{1234567890}~25^2:src/.

          --[no-]progress
              Progress status is reported on the standard error stream by
              default when it is attached to a terminal, unless
              --no-progress or --verbose is specified. --progress forces
              progress status even if the standard error stream is not
              directed to a terminal.


-------------------------------------------------------------------

::

          fsck.<msg-id>
              During fsck git may find issues with legacy data which
              wouldn’t be generated by current versions of git, and which
              wouldn’t be sent over the wire if transfer.fsckObjects was
              set. This feature is intended to support working with legacy
              repositories containing such data.

              Setting fsck.<msg-id> will be picked up by git-fsck(1), but
              to accept pushes of such data set receive.fsck.<msg-id>
              instead, or to clone or fetch it set fetch.fsck.<msg-id>.

              The rest of the documentation discusses fsck.*  for brevity,
              but the same applies for the corresponding receive.fsck.*
              and fetch.<msg-id>.*. variables.

              Unlike variables like color.ui and core.editor the
              receive.fsck.<msg-id> and fetch.fsck.<msg-id> variables will
              not fall back on the fsck.<msg-id> configuration if they
              aren’t set. To uniformly configure the same fsck settings in
              different circumstances all three of them they must all set
              to the same values.

              When fsck.<msg-id> is set, errors can be switched to warnings
              and vice versa by configuring the fsck.<msg-id> setting where
              the <msg-id> is the fsck message ID and the value is one of
              error, warn or ignore. For convenience, fsck prefixes the
              error/warning with the message ID, e.g. "missingEmail:
              invalid author/committer line - missing email" means that
              setting fsck.missingEmail = ignore will hide that issue.

              In general, it is better to enumerate existing objects with
              problems with fsck.skipList, instead of listing the kind of
              breakages these problematic objects share to be ignored, as
              doing the latter will allow new instances of the same
              breakages go unnoticed.

              Setting an unknown fsck.<msg-id> value will cause fsck to
              die, but doing the same for receive.fsck.<msg-id> and
              fetch.fsck.<msg-id> will only cause git to warn.

          fsck.skipList
              The path to a list of object names (i.e. one unabbreviated
              SHA-1 per line) that are known to be broken in a non-fatal
              way and should be ignored. On versions of Git 2.20 and later
              comments (#), empty lines, and any leading and trailing
              whitespace is ignored. Everything but a SHA-1 per line will
              error out on older versions.

              This feature is useful when an established project should be
              accepted despite early commits containing errors that can be
              safely ignored such as invalid committer email addresses.
              Note: corrupt objects cannot be skipped with this setting.

              Like fsck.<msg-id> this variable has corresponding
              receive.fsck.skipList and fetch.fsck.skipList variants.

              Unlike variables like color.ui and core.editor the
              receive.fsck.skipList and fetch.fsck.skipList variables will
              not fall back on the fsck.skipList configuration if they
              aren’t set. To uniformly configure the same fsck settings in
              different circumstances all three of them they must all set
              to the same values.

              Older versions of Git (before 2.20) documented that the
              object names list should be sorted. This was never a
              requirement, the object names could appear in any order, but
              when reading the list we tracked whether the list was sorted
              for the purposes of an internal binary search implementation,
              which could save itself some work with an already sorted
              list. Unless you had a humongous list there was no reason to
              go out of your way to pre-sort the list. After Git version
              2.20 a hash implementation is used instead, so there’s now no
              reason to pre-sort the list.


-------------------------------------------------------------

::

          git-fsck tests SHA-1 and general object sanity, and it does full
          tracking of the resulting reachability and everything else. It
          prints out any corruption it finds (missing or bad objects), and
          if you use the --unreachable flag it will also print out objects
          that exist but that aren’t reachable from any of the specified
          head nodes (or the default set, as mentioned above).

          Any corrupt objects you will have to find in backups or other
          archives (i.e., you can just remove them and do an rsync with
          some other site in the hopes that somebody else has the object
          you have corrupted).

          If core.commitGraph is true, the commit-graph file will also be
          inspected using git commit-graph verify. See git-commit-graph(1).


-----------------------------------------------------------------------------------

::

          unreachable <type> <object>
              The <type> object <object>, isn’t actually referred to
              directly or indirectly in any of the trees or commits seen.
              This can mean that there’s another root node that you’re not
              specifying or that the tree is corrupt. If you haven’t missed
              a root node then you might as well delete unreachable nodes
              since they can’t be used.

          missing <type> <object>
              The <type> object <object>, is referred to but isn’t present
              in the database.

          dangling <type> <object>
              The <type> object <object>, is present in the database but
              never directly used. A dangling commit could be a root node.

          hash mismatch <object>
              The database has an object whose hash doesn’t match the
              object database value. This indicates a serious data
              integrity problem.


-----------------------------------------------------------------------------------

::

          GIT_OBJECT_DIRECTORY
              used to specify the object database root (usually
              $GIT_DIR/objects)

          GIT_INDEX_FILE
              used to specify the index file of the index

          GIT_ALTERNATE_OBJECT_DIRECTORIES
              used to specify additional object database roots (usually
              unset)


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

   Git 2.33.0.69.gc420321         08/27/2021                    GIT-FSCK(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-fsck(1) <../man1/git-fsck.1.html>`__, 
`git-fsck-objects(1) <../man1/git-fsck-objects.1.html>`__, 
`git-mktag(1) <../man1/git-mktag.1.html>`__, 
`git-prune(1) <../man1/git-prune.1.html>`__

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
