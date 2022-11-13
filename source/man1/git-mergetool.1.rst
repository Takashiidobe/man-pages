.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-mergetool(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `TEMP                             |                                   |
| ORARY FILES <#TEMPORARY_FILES>`__ |                                   |
| \| `GIT <#GIT>`__ \|              |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-MERGETOOL(1)               Git Manual               GIT-MERGETOOL(1)

NAME
-------------------------------------------------

::

          git-mergetool - Run merge conflict resolution tools to resolve
          merge conflicts


---------------------------------------------------------

::

          git mergetool [--tool=<tool>] [-y | --[no-]prompt] [<file>...]


---------------------------------------------------------------

::

          Use git mergetool to run one of several merge utilities to
          resolve merge conflicts. It is typically run after git merge.

          If one or more <file> parameters are given, the merge tool
          program will be run to resolve differences on each file (skipping
          those without conflicts). Specifying a directory will include all
          unresolved files in that path. If no <file> names are specified,
          git mergetool will run the merge tool program on every file with
          merge conflicts.


-------------------------------------------------------

::

          -t <tool>, --tool=<tool>
              Use the merge resolution program specified by <tool>. Valid
              values include emerge, gvimdiff, kdiff3, meld, vimdiff, and
              tortoisemerge. Run git mergetool --tool-help for the list of
              valid <tool> settings.

              If a merge resolution program is not specified, git mergetool
              will use the configuration variable merge.tool. If the
              configuration variable merge.tool is not set, git mergetool
              will pick a suitable default.

              You can explicitly provide a full path to the tool by setting
              the configuration variable mergetool.<tool>.path. For
              example, you can configure the absolute path to kdiff3 by
              setting mergetool.kdiff3.path. Otherwise, git mergetool
              assumes the tool is available in PATH.

              Instead of running one of the known merge tool programs, git
              mergetool can be customized to run an alternative program by
              specifying the command line to invoke in a configuration
              variable mergetool.<tool>.cmd.

              When git mergetool is invoked with this tool (either through
              the -t or --tool option or the merge.tool configuration
              variable) the configured command line will be invoked with
              $BASE set to the name of a temporary file containing the
              common base for the merge, if available; $LOCAL set to the
              name of a temporary file containing the contents of the file
              on the current branch; $REMOTE set to the name of a temporary
              file containing the contents of the file to be merged, and
              $MERGED set to the name of the file to which the merge tool
              should write the result of the merge resolution.

              If the custom merge tool correctly indicates the success of a
              merge resolution with its exit code, then the configuration
              variable mergetool.<tool>.trustExitCode can be set to true.
              Otherwise, git mergetool will prompt the user to indicate the
              success of the resolution after the custom tool has exited.

          --tool-help
              Print a list of merge tools that may be used with --tool.

          -y, --no-prompt
              Don’t prompt before each invocation of the merge resolution
              program. This is the default if the merge resolution program
              is explicitly specified with the --tool option or with the
              merge.tool configuration variable.

          --prompt
              Prompt before each invocation of the merge resolution program
              to give the user a chance to skip the path.

          -g, --gui
              When git-mergetool is invoked with the -g or --gui option the
              default merge tool will be read from the configured
              merge.guitool variable instead of merge.tool. If
              merge.guitool is not set, we will fallback to the tool
              configured under merge.tool.

          --no-gui
              This overrides a previous -g or --gui setting and reads the
              default merge tool will be read from the configured
              merge.tool variable.

          -O<orderfile>
              Process files in the order specified in the <orderfile>,
              which has one shell glob pattern per line. This overrides the
              diff.orderFile configuration variable (see git-config(1)). To
              cancel diff.orderFile, use -O/dev/null.


-------------------------------------------------------------------

::

          mergetool.<tool>.path
              Override the path for the given tool. This is useful in case
              your tool is not in the PATH.

          mergetool.<tool>.cmd
              Specify the command to invoke the specified merge tool. The
              specified command is evaluated in shell with the following
              variables available: BASE is the name of a temporary file
              containing the common base of the files to be merged, if
              available; LOCAL is the name of a temporary file containing
              the contents of the file on the current branch; REMOTE is the
              name of a temporary file containing the contents of the file
              from the branch being merged; MERGED contains the name of the
              file to which the merge tool should write the results of a
              successful merge.

          mergetool.<tool>.hideResolved
              Allows the user to override the global mergetool.hideResolved
              value for a specific tool. See mergetool.hideResolved for the
              full description.

          mergetool.<tool>.trustExitCode
              For a custom merge command, specify whether the exit code of
              the merge command can be used to determine whether the merge
              was successful. If this is not set to true then the merge
              target file timestamp is checked and the merge assumed to
              have been successful if the file has been updated, otherwise
              the user is prompted to indicate the success of the merge.

          mergetool.meld.hasOutput
              Older versions of meld do not support the --output option.
              Git will attempt to detect whether meld supports --output by
              inspecting the output of meld --help. Configuring
              mergetool.meld.hasOutput will make Git skip these checks and
              use the configured value instead. Setting
              mergetool.meld.hasOutput to true tells Git to unconditionally
              use the --output option, and false avoids using --output.

          mergetool.meld.useAutoMerge
              When the --auto-merge is given, meld will merge all
              non-conflicting parts automatically, highlight the
              conflicting parts and wait for user decision. Setting
              mergetool.meld.useAutoMerge to true tells Git to
              unconditionally use the --auto-merge option with meld.
              Setting this value to auto makes git detect whether
              --auto-merge is supported and will only use --auto-merge when
              available. A value of false avoids using --auto-merge
              altogether, and is the default value.

          mergetool.hideResolved
              During a merge Git will automatically resolve as many
              conflicts as possible and write the MERGED file containing
              conflict markers around any conflicts that it cannot resolve;
              LOCAL and REMOTE normally represent the versions of the file
              from before Git’s conflict resolution. This flag causes LOCAL
              and REMOTE to be overwriten so that only the unresolved
              conflicts are presented to the merge tool. Can be configured
              per-tool via the mergetool.<tool>.hideResolved configuration
              variable. Defaults to false.

          mergetool.keepBackup
              After performing a merge, the original file with conflict
              markers can be saved as a file with a .orig extension. If
              this variable is set to false then this file is not
              preserved. Defaults to true (i.e. keep the backup files).

          mergetool.keepTemporaries
              When invoking a custom merge tool, Git uses a set of
              temporary files to pass to the tool. If the tool returns an
              error and this variable is set to true, then these temporary
              files will be preserved, otherwise they will be removed after
              the tool has exited. Defaults to false.

          mergetool.writeToTemp
              Git writes temporary BASE, LOCAL, and REMOTE versions of
              conflicting files in the worktree by default. Git will
              attempt to use a temporary directory for these files when set
              true. Defaults to false.

          mergetool.prompt
              Prompt before each invocation of the merge resolution
              program.


-----------------------------------------------------------------------

::

          git mergetool creates *.orig backup files while resolving merges.
          These are safe to remove once a file has been merged and its git
          mergetool session has completed.

          Setting the mergetool.keepBackup configuration variable to false
          causes git mergetool to automatically remove the backup as files
          are successfully merged.


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

   Git 2.33.0.69.gc420321         08/27/2021               GIT-MERGETOOL(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-difftool(1) <../man1/git-difftool.1.html>`__, 
`git-gui(1) <../man1/git-gui.1.html>`__, 
`git-merge(1) <../man1/git-merge.1.html>`__

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
