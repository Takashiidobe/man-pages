.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-escape(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-ESCAPE(1)            systemd-escape            SYSTEMD-ESCAPE(1)

NAME
-------------------------------------------------

::

          systemd-escape - Escape strings for usage in systemd unit names


---------------------------------------------------------

::

          systemd-escape [OPTIONS...] [STRING...]


---------------------------------------------------------------

::

          systemd-escape may be used to escape strings for inclusion in
          systemd unit names. The command may be used to escape and to undo
          escaping of strings.

          The command takes any number of strings on the command line, and
          will process them individually, one after another. It will output
          them separated by spaces to stdout.

          By default, this command will escape the strings passed, unless
          --unescape is passed which results in the inverse operation being
          applied. If --mangle is given, a special mode of escaping is
          applied instead, which assumes the string is already escaped but
          will escape everything that appears obviously non-escaped.

          For details on the escaping and unescaping algorithms see the
          relevant section in systemd.unit(5).


-------------------------------------------------------

::

          The following options are understood:

          --suffix=
              Appends the specified unit type suffix to the escaped string.
              Takes one of the unit types supported by systemd, such as
              "service" or "mount". May not be used in conjunction with
              --template=, --unescape or --mangle.

          --template=
              Inserts the escaped strings in a unit name template. Takes a
              unit name template such as foobar@.service. With --unescape,
              expects instantiated unit names for this template and
              extracts and unescapes just the instance part. May not be
              used in conjunction with --suffix=, --instance or --mangle.

          --path, -p
              When escaping or unescaping a string, assume it refers to a
              file system path. This eliminates leading, trailing or
              duplicate "/" characters and rejects "."  and ".."  path
              components. This is particularly useful for generating
              strings suitable for unescaping with the "%f" specifier in
              unit files, see systemd.unit(5).

          --unescape, -u
              Instead of escaping the specified strings, undo the escaping,
              reversing the operation. May not be used in conjunction with
              --suffix= or --mangle.

          --mangle, -m
              Like --escape, but only escape characters that are obviously
              not escaped yet, and possibly automatically append an
              appropriate unit type suffix to the string. May not be used
              in conjunction with --suffix=, --template= or --unescape.

          --instance
              With --unescape, unescape and print only the instance part of
              an instantiated unit name template. Results in an error for
              an uninstantiated template like ssh@.service or a
              non-template name like ssh.service. Must be used in
              conjunction with --unescape and may not be used in
              conjunction with --template.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------

::

          To escape a single string:

              $ systemd-escape 'Hallöchen, Meister'
              Hall\xc3\xb6chen\x2c\x20Meister

          To undo escaping on a single string:

              $ systemd-escape -u 'Hall\xc3\xb6chen\x2c\x20Meister'
              Hallöchen, Meister

          To generate the mount unit for a path:

              $ systemd-escape -p --suffix=mount "/tmp//waldi/foobar/"
              tmp-waldi-foobar.mount

          To generate instance names of three strings:

              $ systemd-escape --template=systemd-nspawn@.service 'My Container 1' 'containerb' 'container/III'
              systemd-nspawn@My\x20Container\x201.service systemd-nspawn@containerb.service systemd-nspawn@container-III.service

          To extract the instance part of an instantiated unit:

              $ systemd-escape -u --instance 'systemd-nspawn@My\x20Container\x201.service'
              My Container 1

          To extract the instance part of an instance of a particular
          template:

              $ systemd-escape -u --template=systemd-nspawn@.service 'systemd-nspawn@My\x20Container\x201.service'
              My Container 1


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd(1), systemd.unit(5), systemctl(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                            SYSTEMD-ESCAPE(1)

--------------

Pages that refer to this page:
`systemd.unit(5) <../man5/systemd.unit.5.html>`__

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
