.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-credential-store(1) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `ST                               |                                   |
| ORAGE FORMAT <#STORAGE_FORMAT>`__ |                                   |
| \| `GIT <#GIT>`__ \|              |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-CREDENTIAL-STO(1)          Git Manual          GIT-CREDENTIAL-STO(1)

NAME
-------------------------------------------------

::

          git-credential-store - Helper to store credentials on disk


---------------------------------------------------------

::

          git config credential.helper 'store [<options>]'


---------------------------------------------------------------

::

              Note
              Using this helper will store your passwords unencrypted on
              disk, protected only by filesystem permissions. If this is
              not an acceptable security tradeoff, try
              git-credential-cache(1), or find a helper that integrates
              with secure storage provided by your operating system.

          This command stores credentials indefinitely on disk for use by
          future Git programs.

          You probably don’t want to invoke this command directly; it is
          meant to be used as a credential helper by other parts of git.
          See gitcredentials(7) or EXAMPLES below.


-------------------------------------------------------

::

          --file=<path>
              Use <path> to lookup and store credentials. The file will
              have its filesystem permissions set to prevent other users on
              the system from reading it, but will not be encrypted or
              otherwise protected. If not specified, credentials will be
              searched for from ~/.git-credentials and
              $XDG_CONFIG_HOME/git/credentials, and credentials will be
              written to ~/.git-credentials if it exists, or
              $XDG_CONFIG_HOME/git/credentials if it exists and the former
              does not. See also the section called “FILES”.


---------------------------------------------------

::

          If not set explicitly with --file, there are two files where
          git-credential-store will search for credentials in order of
          precedence:

          ~/.git-credentials
              User-specific credentials file.

          $XDG_CONFIG_HOME/git/credentials
              Second user-specific credentials file. If $XDG_CONFIG_HOME is
              not set or empty, $HOME/.config/git/credentials will be used.
              Any credentials stored in this file will not be used if
              ~/.git-credentials has a matching credential as well. It is a
              good idea not to create this file if you sometimes use older
              versions of Git that do not support it.

          For credential lookups, the files are read in the order given
          above, with the first matching credential found taking precedence
          over credentials found in files further down the list.

          Credential storage will by default write to the first existing
          file in the list. If none of these files exist,
          ~/.git-credentials will be created and written to.

          When erasing credentials, matching credentials will be erased
          from all files.


---------------------------------------------------------

::

          The point of this helper is to reduce the number of times you
          must type your username or password. For example:

              $ git config credential.helper store
              $ git push http://example.com/repo.git
              Username: <type your username>
              Password: <type your password>

              [several days later]
              $ git push http://example.com/repo.git
              [your credentials are used automatically]


---------------------------------------------------------------------

::

          The .git-credentials file is stored in plaintext. Each credential
          is stored on its own line as a URL like:

              https://user:pass@example.com

          No other kinds of lines (e.g. empty lines or comment lines) are
          allowed in the file, even though some may be silently ignored. Do
          not view or edit the file with editors.

          When Git needs authentication for a particular URL context,
          credential-store will consider that context a pattern to match
          against each entry in the credentials file. If the protocol,
          hostname, and username (if we already have one) match, then the
          password is returned to Git. See the discussion of configuration
          in gitcredentials(7) for more information.


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

   Git 2.33.0.69.gc420321         08/27/2021          GIT-CREDENTIAL-STO(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`gitcredentials(7) <../man7/gitcredentials.7.html>`__

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
