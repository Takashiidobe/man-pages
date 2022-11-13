.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-archive(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BACKEND EXTRA OP                 |                                   |
| TIONS <#BACKEND_EXTRA_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-ARCHIVE(1)                 Git Manual                 GIT-ARCHIVE(1)

NAME
-------------------------------------------------

::

          git-archive - Create an archive of files from a named tree


---------------------------------------------------------

::

          git archive [--format=<fmt>] [--list] [--prefix=<prefix>/] [<extra>]
                        [-o <file> | --output=<file>] [--worktree-attributes]
                        [--remote=<repo> [--exec=<git-upload-archive>]] <tree-ish>
                        [<path>...]


---------------------------------------------------------------

::

          Creates an archive of the specified format containing the tree
          structure for the named tree, and writes it out to the standard
          output. If <prefix> is specified it is prepended to the filenames
          in the archive.

          git archive behaves differently when given a tree ID versus when
          given a commit ID or tag ID. In the first case the current time
          is used as the modification time of each file in the archive. In
          the latter case the commit time as recorded in the referenced
          commit object is used instead. Additionally the commit ID is
          stored in a global extended pax header if the tar format is used;
          it can be extracted using git get-tar-commit-id. In ZIP files it
          is stored as a file comment.


-------------------------------------------------------

::

          --format=<fmt>
              Format of the resulting archive: tar or zip. If this option
              is not given, and the output file is specified, the format is
              inferred from the filename if possible (e.g. writing to
              "foo.zip" makes the output to be in the zip format).
              Otherwise the output format is tar.

          -l, --list
              Show all available formats.

          -v, --verbose
              Report progress to stderr.

          --prefix=<prefix>/
              Prepend <prefix>/ to each filename in the archive.

          -o <file>, --output=<file>
              Write the archive to <file> instead of stdout.

          --add-file=<file>
              Add a non-tracked file to the archive. Can be repeated to add
              multiple files. The path of the file in the archive is built
              by concatenating the value for --prefix (if any) and the
              basename of <file>.

          --worktree-attributes
              Look for attributes in .gitattributes files in the working
              tree as well (see the section called “ATTRIBUTES”).

          <extra>
              This can be any options that the archiver backend
              understands. See next section.

          --remote=<repo>
              Instead of making a tar archive from the local repository,
              retrieve a tar archive from a remote repository. Note that
              the remote repository may place restrictions on which sha1
              expressions may be allowed in <tree-ish>. See
              git-upload-archive(1) for details.

          --exec=<git-upload-archive>
              Used with --remote to specify the path to the
              git-upload-archive on the remote side.

          <tree-ish>
              The tree or commit to produce an archive for.

          <path>
              Without an optional path parameter, all files and
              subdirectories of the current working directory are included
              in the archive. If one or more paths are specified, only
              these are included.


-----------------------------------------------------------------------------------

::

      zip
          -0
              Store the files instead of deflating them.

          -9
              Highest and slowest compression level. You can specify any
              number from 1 to 9 to adjust compression speed and ratio.


-------------------------------------------------------------------

::

          tar.umask
              This variable can be used to restrict the permission bits of
              tar archive entries. The default is 0002, which turns off the
              world write bit. The special value "user" indicates that the
              archiving user’s umask will be used instead. See umask(2) for
              details. If --remote is used then only the configuration of
              the remote repository takes effect.

          tar.<format>.command
              This variable specifies a shell command through which the tar
              output generated by git archive should be piped. The command
              is executed using the shell with the generated tar file on
              its standard input, and should produce the final output on
              its standard output. Any compression-level options will be
              passed to the command (e.g., "-9"). An output file with the
              same extension as <format> will be use this format if no
              other format is given.

              The "tar.gz" and "tgz" formats are defined automatically and
              default to gzip -cn. You may override them with custom
              commands.

          tar.<format>.remote
              If true, enable <format> for use by remote clients via
              git-upload-archive(1). Defaults to false for user-defined
              formats, but true for the "tar.gz" and "tgz" formats.


-------------------------------------------------------------

::

          export-ignore
              Files and directories with the attribute export-ignore won’t
              be added to archive files. See gitattributes(5) for details.

          export-subst
              If the attribute export-subst is set for a file then Git will
              expand several placeholders when adding this file to an
              archive. See gitattributes(5) for details.

          Note that attributes are by default taken from the .gitattributes
          files in the tree that is being archived. If you want to tweak
          the way the output is generated after the fact (e.g. you
          committed without adding an appropriate export-ignore in its
          .gitattributes), adjust the checked out .gitattributes file as
          necessary and use --worktree-attributes option. Alternatively you
          can keep necessary attributes that should apply while archiving
          any tree in your $GIT_DIR/info/attributes file.


---------------------------------------------------------

::

          git archive --format=tar --prefix=junk/ HEAD | (cd /var/tmp/ &&
          tar xf -)
              Create a tar archive that contains the contents of the latest
              commit on the current branch, and extract it in the
              /var/tmp/junk directory.

          git archive --format=tar --prefix=git-1.4.0/ v1.4.0 | gzip
          >git-1.4.0.tar.gz
              Create a compressed tarball for v1.4.0 release.

          git archive --format=tar.gz --prefix=git-1.4.0/ v1.4.0
          >git-1.4.0.tar.gz
              Same as above, but using the builtin tar.gz handling.

          git archive --prefix=git-1.4.0/ -o git-1.4.0.tar.gz v1.4.0
              Same as above, but the format is inferred from the output
              file.

          git archive --format=tar --prefix=git-1.4.0/ v1.4.0^{tree} | gzip
          >git-1.4.0.tar.gz
              Create a compressed tarball for v1.4.0 release, but without a
              global extended pax header.

          git archive --format=zip --prefix=git-docs/ HEAD:Documentation/ >
          git-1.4.0-docs.zip
              Put everything in the current head’s Documentation/ directory
              into git-1.4.0-docs.zip, with the prefix git-docs/.

          git archive -o latest.zip HEAD
              Create a Zip archive that contains the contents of the latest
              commit on the current branch. Note that the output format is
              inferred by the extension of the output file.

          git config tar.tar.xz.command "xz -c"
              Configure a "tar.xz" format for making LZMA-compressed
              tarfiles. You can use it specifying --format=tar.xz, or by
              creating an output file like -o foo.tar.xz.


---------------------------------------------------------

::

          gitattributes(5)


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

   Git 2.33.0.69.gc420321         08/27/2021                 GIT-ARCHIVE(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`gitattributes(5) <../man5/gitattributes.5.html>`__, 
`gitweb.conf(5) <../man5/gitweb.conf.5.html>`__

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
