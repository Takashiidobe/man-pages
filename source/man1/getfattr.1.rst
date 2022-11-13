.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getfattr(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETFATTR(1)                  File Utilities                  GETFATTR(1)

NAME
-------------------------------------------------

::

          getfattr - get extended attributes of filesystem objects


---------------------------------------------------------

::

          getfattr [-hRLP] -n name [-e en] pathname...
          getfattr [-hRLP] -d [-e en] [-m pattern] pathname...


---------------------------------------------------------------

::

          For each file, getfattr displays the file name, and the set of
          extended attribute names (and optionally values) which are
          associated with that file. Per default only attributes in the
          user namespace are displayed, see -m.

          The output format of getfattr -d is as follows:
                  1:  # file: somedir/
                  2:  user.name0="value0"
                  3:  user.name1="value1"
                  4:  user.name2="value2"
                  5:  ...

          Line 1 identifies the file name for which the following lines are
          being reported.  The remaining lines (lines 2 to 4 above) show
          the name and value pairs associated with the specified file.


-------------------------------------------------------

::

          -n name, --name=name
              Dump the value of the named extended attribute.

          -d, --dump
              Dump the values of all matched extended attributes.

          -e en, --encoding=en
              Encode values after retrieving them.  Valid values of en are
              "text", "hex", and "base64".  Values encoded as text strings
              are enclosed in double quotes ("), while strings encoded as
              hexadecimal and base64 are prefixed with 0x and 0s,
              respectively.

          -h, --no-dereference
              Do not dereference symlinks. Instead of the file a symlink
              refers to, the symlink itself is examined.  Unless doing a
              logical (-L) traversal, do not traverse symlinks to
              directories.

          -m pattern, --match=pattern
              Only include attributes with names matching the regular
              expression pattern.  The default value for pattern is
              "^user\\.", which includes all the attributes in the user
              namespace. Specify "-" for including all attributes.  Refer
              to attr(5) for a more detailed discussion of namespaces.

          --absolute-names
              Do not strip leading slash characters ('/').  The default
              behaviour is to strip leading slash characters.

          --only-values
              Dump out the raw extended attribute value(s) without encoding
              them.

          -R, --recursive
              List the attributes of all files and directories recursively.

          -L, --logical
              Logical walk, follow symbolic links to directories.  The
              default behaviour is to follow symbolic link arguments unless
              --no-dereference is given, and to skip symbolic links
              encountered in subdirectories.  Only effective in combination
              with -R.

          -P, --physical
              Physical walk, do not follow symbolic links to directories.
              This also skips symbolic link arguments.  Only effective in
              combination with -R.

          --version
              Print the version of getfattr and exit.

          --help
              Print help explaining the command line options.

          --  End of command line options.  All remaining parameters are
              interpreted as file names, even if they start with a dash
              character.


-----------------------------------------------------

::

          Andreas Gruenbacher, <andreas.gruenbacher@gmail.com> and the SGI
          XFS development team, <linux-xfs@oss.sgi.com>.

          Please send your bug reports or comments to
          <https://savannah.nongnu.org/bugs/?group=attr > or <acl-
          devel@nongnu.org>.


---------------------------------------------------------

::

          setfattr(1), attr(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of the attr (manipulating filesystem extended
          attributes) project.  Information about the project can be found
          at ⟨http://savannah.nongnu.org/projects/attr⟩.  If you have a bug
          report for this manual page, see
          ⟨http://savannah.nongnu.org/bugs/?group=attr⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨git://git.savannah.nongnu.org/attr.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-04-19.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Dec 2001                   Extended Attributes               GETFATTR(1)

--------------

Pages that refer to this page: `attr(1) <../man1/attr.1.html>`__, 
`setfattr(1) <../man1/setfattr.1.html>`__, 
`getxattr(2) <../man2/getxattr.2.html>`__, 
`listxattr(2) <../man2/listxattr.2.html>`__, 
`removexattr(2) <../man2/removexattr.2.html>`__, 
`setxattr(2) <../man2/setxattr.2.html>`__, 
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`tmpfiles.d(5) <../man5/tmpfiles.d.5.html>`__, 
`xattr(7) <../man7/xattr.7.html>`__, 
`systemd-coredump(8) <../man8/systemd-coredump.8.html>`__

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
