.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-index-pack(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-INDEX-PACK(1)              Git Manual              GIT-INDEX-PACK(1)

NAME
-------------------------------------------------

::

          git-index-pack - Build pack index file for an existing packed
          archive


---------------------------------------------------------

::

          git index-pack [-v] [-o <index-file>] [--[no-]rev-index] <pack-file>
          git index-pack --stdin [--fix-thin] [--keep] [-v] [-o <index-file>]
                            [--[no-]rev-index] [<pack-file>]


---------------------------------------------------------------

::

          Reads a packed archive (.pack) from the specified file, and
          builds a pack index file (.idx) for it. Optionally writes a
          reverse-index (.rev) for the specified pack. The packed archive
          together with the pack index can then be placed in the
          objects/pack/ directory of a Git repository.


-------------------------------------------------------

::

          -v
              Be verbose about what is going on, including progress status.

          -o <index-file>
              Write the generated pack index into the specified file.
              Without this option the name of pack index file is
              constructed from the name of packed archive file by replacing
              .pack with .idx (and the program fails if the name of packed
              archive does not end with .pack).

          --[no-]rev-index
              When this flag is provided, generate a reverse index (a .rev
              file) corresponding to the given pack. If --verify is given,
              ensure that the existing reverse index is correct. Takes
              precedence over pack.writeReverseIndex.

          --stdin
              When this flag is provided, the pack is read from stdin
              instead and a copy is then written to <pack-file>. If
              <pack-file> is not specified, the pack is written to
              objects/pack/ directory of the current Git repository with a
              default name determined from the pack content. If <pack-file>
              is not specified consider using --keep to prevent a race
              condition between this process and git repack.

          --fix-thin
              Fix a "thin" pack produced by git pack-objects --thin (see
              git-pack-objects(1) for details) by adding the excluded
              objects the deltified objects are based on to the pack. This
              option only makes sense in conjunction with --stdin.

          --keep
              Before moving the index into its final destination create an
              empty .keep file for the associated pack file. This option is
              usually necessary with --stdin to prevent a simultaneous git
              repack process from deleting the newly constructed pack and
              index before refs can be updated to use objects contained in
              the pack.

          --keep=<msg>
              Like --keep create a .keep file before moving the index into
              its final destination, but rather than creating an empty file
              place <msg> followed by an LF into the .keep file. The <msg>
              message can later be searched for within all .keep files to
              locate any which have outlived their usefulness.

          --index-version=<version>[,<offset>]
              This is intended to be used by the test suite only. It allows
              to force the version for the generated pack index, and to
              force 64-bit index entries on objects located above the given
              offset.

          --strict
              Die, if the pack contains broken objects or links.

          --check-self-contained-and-connected
              Die if the pack contains broken links. For internal use only.

          --fsck-objects
              For internal use only.

              Die if the pack contains broken objects. If the pack contains
              a tree pointing to a .gitmodules blob that does not exist,
              prints the hash of that blob (for the caller to check) after
              the hash that goes into the name of the pack/idx file (see
              "Notes").

          --threads=<n>
              Specifies the number of threads to spawn when resolving
              deltas. This requires that index-pack be compiled with
              pthreads otherwise this option is ignored with a warning.
              This is meant to reduce packing time on multiprocessor
              machines. The required amount of memory for the delta search
              window is however multiplied by the number of threads.
              Specifying 0 will cause Git to auto-detect the number of
              CPU’s and use maximum 3 threads.

          --max-input-size=<size>
              Die, if the pack is larger than <size>.

          --object-format=<hash-algorithm>
              Specify the given object format (hash algorithm) for the
              pack. The valid values are sha1 and (if enabled) sha256. The
              default is the algorithm for the current repository (set by
              extensions.objectFormat), or sha1 if no value is set or
              outside a repository.

              This option cannot be used with --stdin.

              THIS OPTION IS EXPERIMENTAL! SHA-256 support is experimental
              and still in an early stage. A SHA-256 repository will in
              general not be able to share work with "regular" SHA-1
              repositories. It should be assumed that, e.g., Git internal
              file formats in relation to SHA-256 repositories may change
              in backwards-incompatible ways. Only use
              --object-format=sha256 for testing purposes.


---------------------------------------------------

::

          Once the index has been created, the hash that goes into the name
          of the pack/idx file is printed to stdout. If --stdin was also
          used then this is prefixed by either "pack\t", or "keep\t" if a
          new .keep file was successfully created. This is useful to remove
          a .keep file used as a lock to prevent the race with git repack
          mentioned above.


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

   Git 2.33.0.69.gc420321         08/27/2021              GIT-INDEX-PACK(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-bundle(1) <../man1/git-bundle.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-pack-objects(1) <../man1/git-pack-objects.1.html>`__, 
`git-show-index(1) <../man1/git-show-index.1.html>`__

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
