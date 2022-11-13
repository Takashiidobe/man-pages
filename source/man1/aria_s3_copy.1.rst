.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aria_s3_copy(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ARIA_S3_COPY(1)               User Commands              ARIA_S3_COPY(1)

NAME
-------------------------------------------------

::

          aria_s3_copy - Copy an Aria table to and from s3


---------------------------------------------------------------

::

          Usage: aria_s3_copy --aws-access-key=# --aws-secret-access-key=#
          --aws-region=# --op=(from_s3 | to_s3 | delete_from_s3) [OPTIONS]
          tables[.MAI]

          -?, -h, --help
                 Display help and exit.

          -k, --s3-access-key=name
                 AWS access key ID

          -r, -s3-region=name
                 AWS region

          -K, -s3-secret-key=name
                 AWS secret access key ID

          -b, -s3-bucket=name
                 AWS prefix for tables

          -h, -s3-host-name=name
                 Host name to S3 provider

          -c, -compress
                 Use compression

          -o, -op=name
                 Operation to execute. One of 'from_s3', 'to_s3' or
                 'delete_from_s3'

          -d, -database=name
                 Database for copied table (second prefix). If not given,
                 the directory of the table file is used

          -B, -s3-block-size=#
                 Block size for data/index blocks in s3

          -L, -s3-protocol-version=name
                 Protocol used to communication with S3. One of "Auto",
                 "Amazon" or "Original".

          -f, -force
                 Force copy even if target exists

          -V, -version
                 Print version and exit.

          --s3-debug
                 Output debug log from marias3 to stdout

          -v, --verbose
                 Be verbose.

          For more information, please refer to the MariaDB Knowledge Base
          page https://mariadb.com/kb/en/aria_s3_copy/

COLOPHON
---------------------------------------------------------

::

          This page is part of the MariaDB (MariaDB database server)
          project.  Information about the project can be found at 
          ⟨http://mariadb.org/⟩.  If you have a bug report for this manual
          page, see ⟨https://mariadb.com/kb/en/mariadb/reporting-bugs/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/MariaDB/server⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   aria_s3_copy Ver 1.0            June 2020                ARIA_S3_COPY(1)

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
