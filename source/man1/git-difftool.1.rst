.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-difftool(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIG                           |                                   |
|  VARIABLES <#CONFIG_VARIABLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-DIFFTOOL(1)                Git Manual                GIT-DIFFTOOL(1)

NAME
-------------------------------------------------

::

          git-difftool - Show changes using common diff tools


---------------------------------------------------------

::

          git difftool [<options>] [<commit> [<commit>]] [--] [<path>...]


---------------------------------------------------------------

::

          git difftool is a Git command that allows you to compare and edit
          files between revisions using common diff tools. git difftool is
          a frontend to git diff and accepts the same options and
          arguments. See git-diff(1).


-------------------------------------------------------

::

          -d, --dir-diff
              Copy the modified files to a temporary location and perform a
              directory diff on them. This mode never prompts before
              launching the diff tool.

          -y, --no-prompt
              Do not prompt before launching a diff tool.

          --prompt
              Prompt before each invocation of the diff tool. This is the
              default behaviour; the option is provided to override any
              configuration settings.

          --rotate-to=<file>
              Start showing the diff for the given path, the paths before
              it will move to end and output.

          --skip-to=<file>
              Start showing the diff for the given path, skipping all the
              paths before it.

          -t <tool>, --tool=<tool>
              Use the diff tool specified by <tool>. Valid values include
              emerge, kompare, meld, and vimdiff. Run git difftool
              --tool-help for the list of valid <tool> settings.

              If a diff tool is not specified, git difftool will use the
              configuration variable diff.tool. If the configuration
              variable diff.tool is not set, git difftool will pick a
              suitable default.

              You can explicitly provide a full path to the tool by setting
              the configuration variable difftool.<tool>.path. For example,
              you can configure the absolute path to kdiff3 by setting
              difftool.kdiff3.path. Otherwise, git difftool assumes the
              tool is available in PATH.

              Instead of running one of the known diff tools, git difftool
              can be customized to run an alternative program by specifying
              the command line to invoke in a configuration variable
              difftool.<tool>.cmd.

              When git difftool is invoked with this tool (either through
              the -t or --tool option or the diff.tool configuration
              variable) the configured command line will be invoked with
              the following variables available: $LOCAL is set to the name
              of the temporary file containing the contents of the diff
              pre-image and $REMOTE is set to the name of the temporary
              file containing the contents of the diff post-image.  $MERGED
              is the name of the file which is being compared.  $BASE is
              provided for compatibility with custom merge tool commands
              and has the same value as $MERGED.

          --tool-help
              Print a list of diff tools that may be used with --tool.

          --[no-]symlinks
              git difftool's default behavior is create symlinks to the
              working tree when run in --dir-diff mode and the right-hand
              side of the comparison yields the same content as the file in
              the working tree.

              Specifying --no-symlinks instructs git difftool to create
              copies instead.  --no-symlinks is the default on Windows.

          -x <command>, --extcmd=<command>
              Specify a custom command for viewing diffs.  git-difftool
              ignores the configured defaults and runs $command $LOCAL
              $REMOTE when this option is specified. Additionally, $BASE is
              set in the environment.

          -g, --[no-]gui
              When git-difftool is invoked with the -g or --gui option the
              default diff tool will be read from the configured
              diff.guitool variable instead of diff.tool. The --no-gui
              option can be used to override this setting. If diff.guitool
              is not set, we will fallback in the order of merge.guitool,
              diff.tool, merge.tool until a tool is found.

          --[no-]trust-exit-code
              git-difftool invokes a diff tool individually on each file.
              Errors reported by the diff tool are ignored by default. Use
              --trust-exit-code to make git-difftool exit when an invoked
              diff tool returns a non-zero exit code.

              git-difftool will forward the exit code of the invoked tool
              when --trust-exit-code is used.

          See git-diff(1) for the full list of supported options.


-------------------------------------------------------------------------

::

          git difftool falls back to git mergetool config variables when
          the difftool equivalents have not been defined.

          diff.tool
              The default diff tool to use.

          diff.guitool
              The default diff tool to use when --gui is specified.

          difftool.<tool>.path
              Override the path for the given tool. This is useful in case
              your tool is not in the PATH.

          difftool.<tool>.cmd
              Specify the command to invoke the specified diff tool.

              See the --tool=<tool> option above for more details.

          difftool.prompt
              Prompt before each invocation of the diff tool.

          difftool.trustExitCode
              Exit difftool if the invoked diff tool returns a non-zero
              exit status.

              See the --trust-exit-code option above for more details.


---------------------------------------------------------

::

          git-diff(1)
              Show changes between commits, commit and working tree, etc

          git-mergetool(1)
              Run merge conflict resolution tools to resolve merge
              conflicts

          git-config(1)
              Get and set repository or global options


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

   Git 2.33.0.69.gc420321         08/27/2021                GIT-DIFFTOOL(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-diff(1) <../man1/git-diff.1.html>`__

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
