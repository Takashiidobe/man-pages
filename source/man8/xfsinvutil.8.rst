.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfsinvutil(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   xfsinvutil(8)            System Manager's Manual           xfsinvutil(8)

NAME
-------------------------------------------------

::

          xfsinvutil - xfsdump inventory database checking and pruning
          utility


---------------------------------------------------------

::

          xfsinvutil [-F|-i] [-m media_label] -M mount_point mm/dd/yyyy
          xfsinvutil [-F|-i] [-m media_label] -u UUID mm/dd/yyyy
          xfsinvutil [-F] -s SESSION_ID
          xfsinvutil -i
          xfsinvutil -C


---------------------------------------------------------------

::

          xfsdump maintains an online dump inventory in
          /var/lib/xfsdump/inventory.  The -I option of xfsdump displays
          the inventory contents hierarchically.  The levels of the
          hierarchy are: filesystem, dump session, stream, and media file.

          xfsinvutil is a utility to check this inventory database for
          consistency, to remove entries of dump sessions which may no
          longer be of relevance, and to browse the contents of the
          inventory.

          The following command line options are available:

          -F   Don't prompt the operator.  When xfsinvutil encounters a
               matching dump session, xfsinvutil will normally ask the
               operator for permission to delete the entry. With this
               option the deletion is performed, no questions asked.

          -i   Interactive mode.  Causes xfsinvutil to run in a mode that
               will allow the operator to browse and modify the contents of
               the inventory. Please refer to the Interactive Mode section
               below for more information.

          -M mount_point mm/dd/yyyy
               Prunes dump sessions identified by the given mount point
               which were created prior to the specified date. Optionally
               -m may be be specified to further limit the matching dump
               sessions by media label.  xfsinvutil will prompt the
               operator prior to pruning a dump session unless the -F or -i
               options are given.

          -u UUID mm/dd/yyyy
               Like -M, except the matching filesystem is specified using
               its universally unique identifier (UUID) instead of its
               mount point.

          -m media_label
               If specified, only sessions with at least one media file
               whose label matches this value will be eligible for pruning.
               This restriction is in addition to those imposed by the date
               and the -M or -u options.  This option allows the pruning of
               all inventory references to media which may have been
               overwritten or lost. Note that this option does not apply to
               sessions with no media files.

          -s SESSION_ID
               Prunes the dump session identified by the given session id.
               xfsinvutil will prompt the operator prior to pruning a dump
               session unless the -F option is given.

          -C   With this option, xfsinvutil performs consistency checks for
               all entries in the inventory database.  It fixes any
               problems found. If no consistent entries are found , the
               corresponding inventory database file is removed.

      Interactive Mode
          When run with -i, xfsinvutil will present the operator with a
          hierarchical representation of the xfsdump inventory.  In this
          mode, the operator can use the arrow keys (or the h j k l keys)
          to navigate the inventory and also use the following keys and
          functionality:

          +    Expand a branch of the tree.

          -    Collapse a branch of the tree.

          *    Fully expand a branch of the tree.

          %    Fully collapse a branch of the tree.

          h    Move selection to the parent entry.

          l    Move selection to the child entry.

          j    Move selection to next entry.

          k    Move selection to previous entry.

          d    Mark the current record, and all sub-records, to be deleted.

          u    Clear the current record and all parent records from being
               deleted.

          i    Import another xfsdump inventory.

          ?    Show help window.

          x    Commit any changes made to the inventory, and exit the
               program.

          q    Exit the program without committing any changes to the
               inventory.

          Inventories from other hosts can be imported to create a larger
          common inventory.  It is recommended that the contents of
          /var/lib/xfsdump/inventory on the remote host be copied to a
          temporary local directory prior to running xfsinvutil.  When
          xfsinvutil is run in interactive mode, and the operator hits i,
          they will be prompted for the path to the inventory to be
          imported.  xfsinvutil will then add the contents of the imported
          inventory to the main window, and all entries will be marked as
          imported.  The operator can then delete any of these entries that
          are not to be imported.  When the operator commits the changes,
          xfsinvutil will import any entries which were not marked as
          deleted.  Deleted entries are not actually deleted from the
          original imported inventory.


---------------------------------------------------

::

      Inventory
          Each dump session updates an inventory database in
          /var/lib/xfsdump/inventory.  xfsdump uses the inventory to
          determine the base of incremental and resumed dumps.

          This database can be displayed by invoking xfsdump with the -I
          option.  The display uses tabbed indentation to present the
          inventory hierarchically.  The first level is filesystem.  The
          second level is session.  The third level is media stream
          (currently only one stream is supported).  The fourth level lists
          the media files sequentially composing the stream.


---------------------------------------------------

::

          /var/lib/xfsdump/inventory
                 dump inventory database


---------------------------------------------------------

::

          xfsdump(8), xfsrestore(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the xfsdump (XFS dump and restore) project.
          Information about the project can be found at ⟨http://xfs.org/⟩.
          If you have a bug report for this manual page, send it to
          linux-xfs@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-01-31.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                              xfsinvutil(8)

--------------

Pages that refer to this page: `xfsdump(8) <../man8/xfsdump.8.html>`__, 
`xfsrestore(8) <../man8/xfsrestore.8.html>`__

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
