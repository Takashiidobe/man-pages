.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsconf(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   nfsconf(8)               System Manager's Manual              nfsconf(8)

NAME
-------------------------------------------------

::

          nfsconf - Query various NFS configuration settings


---------------------------------------------------------

::

          nfsconf --dump [-v|--verbose] [-f|--file infile.conf] [outfile]

          nfsconf --entry [--arg subsection] section tag

          nfsconf --get [-v|--verbose] [-f|--file infile.conf] [-a|--arg
          subsection] section tag

          nfsconf --isset [-v|--verbose] [-f|--file infile.conf] [-a|--arg
          subsection] section tag

          nfsconf --set [-v|--verbose] [-m|--modified Modified by text]
          [-f|--file infile.conf] [-a|--arg subsection] section tag value

          nfsconf --unset [-v|--verbose] [-f|--file infile.conf] [-a|--arg
          subsection] section tag


---------------------------------------------------------------

::

          The nfsconf command can be used to test for and retrieve
          configuration settings from a range of nfs-utils configuration
          files.

      Modes
          The following modes are available:

          -d, --dump
                 Output an alphabetically sorted dump of the current
                 configuration in conf file format. Accepts an optional
                 filename in which to write the output.

          -e, --entry
                 retrieve the config entry rather than its current expanded
                 value

          -i, --isset
                 Test if a specific tag has a value set.

          -g, --get
                 Output the current value of the specified tag.

          -s, --set
                 Update or Add a tag and value to the config file in a
                 specified section, creating the tag, section, and file if
                 necessary. If the section is defined as '#' then a comment
                 is appended to the file. If a comment is set with a tag
                 name then any exiting tagged comment with a matching name
                 is replaced.

          -u, --unset
                 Remove the specified tag and its value from the config
                 file.


-------------------------------------------------------

::

      Options valid in all modes
          -v, --verbose
                 Increase verbosity and print debugging information.

          -f, --file infile
                 Select a different config file to operate upon, default is
                 /etc/nfs.conf

      Options only valid in --entry and --get and --isset modes.
          -a, --arg subsection
                 Select a specific sub-section

      Options only valid in --set mode.
          -m, --modified "Modified by nfsconf" Set the text on the Modified
          date comment in the file. Set to empty to remove.


---------------------------------------------------------------

::

      --isset mode
          In this mode the command will return success (0) if the selected
          tag has a value, any other exit code indicates the value is not
          set, or some other error has occurred.

      all other modes
          Success is indicated by an exit status of zero, any other status
          indicates an error. Error messages are output on stderr, and
          increasing verbosity will give more detailed explanations if any
          are available.


---------------------------------------------------------

::

          nfsconf -v --dump --file /tmp/testconf.conf sorted.conf
                 Check a new config file for syntax errors and output a
                 sorted version for ease of comparison with existing
                 settings.

          if ! nfsconf --isset gssd preferred-realm ; then echo 'No
          preferred realm configured for gss'; fi
                 The tool allows for easy testing of configuration values
                 from shell scripts, here we test if a specific value has
                 been set.

          nfsconf --file /etc/nfsmount.conf --get --arg /home MountPoint
          background
                 Show default value for background option for NFS mounts of
                 the /home path.

          nfsconf --file /etc/nfs.conf --set nfsd debug 1
                 Enable debugging in nfsd


---------------------------------------------------

::

          /etc/nfs.conf


---------------------------------------------------------

::

          nfsd(8), exportfs(8), idmapd(8), statd(8)


-----------------------------------------------------

::

          Justin Mitchell <jumitche@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  2 May 2018                     nfsconf(8)

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
