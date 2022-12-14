.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sshfs(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SSHFS(1)                      User Commands                     SSHFS(1)

NAME
-------------------------------------------------

::

          SSHFS - filesystem client based on ssh


---------------------------------------------------------

::

      mounting
          sshfs [user@]host:[dir] mountpoint [options]

      unmounting
          @UNMOUNT_COMMAND@ mountpoint


---------------------------------------------------------------

::

          SSHFS (Secure SHell FileSystem) is a file system for Linux (and
          other operating systems with a FUSE implementation, such as Mac
          OS X or FreeBSD) capable of operating on files on a remote
          computer using just a secure shell login on the remote computer.
          On the local computer where the SSHFS is mounted, the
          implementation makes use of the FUSE (Filesystem in Userspace)
          kernel module. The practical effect of this is that the end user
          can seamlessly interact with remote files being securely served
          over SSH just as if they were local files on his/her computer. On
          the remote computer the SFTP subsystem of SSH is used.

          If host is a numeric IPv6 address, it needs to be enclosed in
          square brackets.


-------------------------------------------------------

::

      general options:
          -o opt,[opt...]
                 mount options

          -h   --help
                 print help

          -V   --version
                 print version

      SSHFS options:
          -p PORT
                 equivalent to '-o port=PORT'

          -C     equivalent to '-o compression=yes'

          -F ssh_configfile
                 specifies alternative ssh configuration file

          -1     equivalent to '-o ssh_protocol=1'

          -o reconnect
                 reconnect to server

          -o delay_connect
                 delay connection to server

          -o sshfs_sync
                 synchronous writes

          -o no_readahead
                 synchronous reads (no speculative readahead)

          -o sync_readdir
                 synchronous readdir

          -o sshfs_debug
                 print some debugging information

          -o cache=BOOL
                 enable caching {yes,no} (default: yes)

          -o cache_timeout=N
                 sets timeout for caches in seconds (default: 20)

          -o cache_X_timeout=N
                 sets timeout for {stat,dir,link} cache

          -o workaround=LIST
                 colon separated list of workarounds

                  none   no workarounds enabled

                  all    all workarounds enabled

                  [no]rename
                         fix renaming to existing file (default: off)

                  [no]nodelaysrv
                         set nodelay tcp flag in ssh (default: off)

                  [no]truncate
                         fix truncate for old servers (default: off)

                  [no]buflimit
                         fix buffer fillup bug in server (default: on)

          -o idmap=TYPE
                 user/group ID mapping (default: @IDMAP_DEFAULT@)

                  none   no translation of the ID space

                  user   only translate UID/GID of connecting user

                  file   translate UIDs/GIDs based upon the contents of
                         uidfile  and gidfile

          -o uidfile=FILE
                 file containing username:uid mappings for idmap=file

          -o gidfile=FILE
                 file containing groupname:gid mappings for idmap=file

          -o nomap=TYPE
                 with idmap=file, how to handle missing mappings

                  ignore don't do any re-mapping

                  error  return an error (default)

          -o ssh_command=CMD
                 execute CMD instead of 'ssh'

          -o ssh_protocol=N
                 ssh protocol to use (default: 2)

          -o sftp_server=SERV
                 path to sftp server or subsystem (default: sftp)

          -o directport=PORT
                 directly connect to PORT bypassing ssh

          -o slave
                 communicate over stdin and stdout bypassing network

          -o disable_hardlink
                 link(2) will return with errno set to ENOSYS.  Hard links
                 don't currently work perfectly on sshfs, and this confuses
                 some programs.  If that happens try disabling hard links
                 with this option.

          -o transform_symlinks
                 transform absolute symlinks to relative

          -o follow_symlinks
                 follow symlinks on the server

          -o no_check_root
                 don't check for existence of 'dir' on server

          -o password_stdin
                 read password from stdin (only for pam_mount!)

          -o SSHOPT=VAL
                 ssh options (see man ssh_config)

      FUSE options:
          -d   -o debug
                 enable debug output (implies -f)

          -f     foreground operation

          -s     disable multi-threaded operation

          -o allow_other
                 allow access to other users

          -o allow_root
                 allow access to root

          -o nonempty
                 allow mounts over non-empty file/dir

          -o default_permissions enable permission checking by kernel

          -o fsname=NAME
                 set filesystem name

          -o subtype=NAME
                 set filesystem type

          -o large_read
                 issue large read requests (2.4 only)

          -o max_read=N
                 set maximum size of read requests

          -o hard_remove
                 immediate removal (don't hide files)

          -o use_ino
                 let filesystem set inode numbers

          -o readdir_ino
                 try to fill in d_ino in readdir

          -o direct_io
                 use direct I/O

          -o kernel_cache
                 cache files in kernel

          -o [no]auto_cache
                 enable caching based on modification times

          -o umask=M
                 set file permissions (octal)

          -o uid=N
                 set file owner

          -o gid=N
                 set file group

          -o entry_timeout=T
                 cache timeout for names (1.0s)

          -o negative_timeout=T
                 cache timeout for deleted names (0.0s)

          -o attr_timeout=T
                 cache timeout for attributes (1.0s)

          -o ac_attr_timeout=T
                 auto cache timeout for attributes (attr_timeout)

          -o intr
                 allow requests to be interrupted

          -o intr_signal=NUM
                 signal to send on interrupt (10)

          -o modules=M1[:M2...]
                 names of modules to push onto filesystem stack

          -o max_write=N
                 set maximum size of write requests

          -o max_readahead=N
                 set maximum readahead

          -o async_read
                 perform reads asynchronously (default)

          -o sync_read
                 perform reads synchronously

      Module options:
          [subdir]

          -o subdir=DIR
                 prepend this directory to all paths (mandatory)

          -o [no]rellinks
                 transform absolute symlinks to relative

          [iconv]

          -o from_code=CHARSET
                 original encoding of file names (default: UTF-8)

          -o to_code=CHARSET
                 new encoding of the file names (default: ISO-8859-2)


-------------------------------------------------------

::

          SSHFS has been written by Miklos Szeredi <miklos@szeredi.hu>.

          This man page was written by Bartosz Fenski <fenio@debian.org>
          for the Debian GNU/Linux distribution (but it may be used by
          others).

COLOPHON
---------------------------------------------------------

::

          This page is part of the sshfs (SSH Filesystem) project.
          Information about the project can be found at 
          ⟨https://github.com/libfuse/sshfs⟩.  If you have a bug report for
          this manual page, see ⟨https://github.com/libfuse/sshfs/issues⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/libfuse/sshfs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   SSHFS version 2.0              April 2008                       SSHFS(1)

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
