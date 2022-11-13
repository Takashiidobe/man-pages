.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

findmnt(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FINDMNT(8)                System Administration               FINDMNT(8)

NAME
-------------------------------------------------

::

          findmnt - find a filesystem


---------------------------------------------------------

::

          findmnt [options]

          findmnt [options] device|mountpoint

          findmnt [options] [--source] device [--target path|--mountpoint
          mountpoint]


---------------------------------------------------------------

::

          findmnt will list all mounted filesystems or search for a
          filesystem. The findmnt command is able to search in /etc/fstab,
          /etc/mtab or /proc/self/mountinfo. If device or mountpoint is not
          given, all filesystems are shown.

          The device may be specified by device name, major:minor numbers,
          filesystem label or UUID, or partition label or UUID. Note that
          findmnt follows mount(8) behavior where a device name may be
          interpreted as a mountpoint (and vice versa) if the --target,
          --mountpoint or --source options are not specified.

          The command-line option --target accepts any file or directory
          and then findmnt displays the filesystem for the given path.

          The command prints all mounted filesystems in the tree-like
          format by default.


-------------------------------------------------------

::

          -A, --all
              Disable all built-in filters and print all filesystems.

          -a, --ascii
              Use ascii characters for tree formatting.

          -b, --bytes
              Print the SIZE, USED and AVAIL columns in bytes rather than
              in a human-readable format.

          -C, --nocanonicalize
              Do not canonicalize paths at all. This option affects the
              comparing of paths and the evaluation of tags (LABEL, UUID,
              etc.).

          -c, --canonicalize
              Canonicalize all printed paths.

          -D, --df
              Imitate the output of df(1). This option is equivalent to -o
              SOURCE,FSTYPE,SIZE,USED,AVAIL,USE%,TARGET but excludes all
              pseudo filesystems. Use --all to print all filesystems.

          -d, --direction word
              The search direction, either forward or backward.

          -e, --evaluate
              Convert all tags (LABEL, UUID, PARTUUID or PARTLABEL) to the
              corresponding device names.

          -F, --tab-file path
              Search in an alternative file. If used with --fstab, --mtab
              or --kernel, then it overrides the default paths. If
              specified more than once, then tree-like output is disabled
              (see the --list option).

          -f, --first-only
              Print the first matching filesystem only.

          -h, --help
              Display help text and exit.

          -i, --invert
              Invert the sense of matching.

          -J, --json
              Use JSON output format.

          -k, --kernel
              Search in /proc/self/mountinfo. The output is in the
              tree-like format. This is the default. The output contains
              only mount options maintained by kernel (see also --mtab).

          -l, --list
              Use the list output format. This output format is
              automatically enabled if the output is restricted by the -t,
              -O, -S or -T option and the option --submounts is not used or
              if more that one source file (the option -F) is specified.

          -M, --mountpoint path
              Explicitly define the mountpoint file or directory. See also
              --target.

          -m, --mtab
              Search in /etc/mtab. The output is in the list format by
              default (see --tree). The output may include user space mount
              options.

          -N, --task tid
              Use alternative namespace /proc/<tid>/mountinfo rather than
              the default /proc/self/mountinfo. If the option is specified
              more than once, then tree-like output is disabled (see the
              --list option). See also the unshare(1) command.

          -n, --noheadings
              Do not print a header line.

          -O, --options list
              Limit the set of printed filesystems. More than one option
              may be specified in a comma-separated list. The -t and -O
              options are cumulative in effect. It is different from -t in
              that each option is matched exactly; a leading no at the
              beginning does not have global meaning. The "no" can used for
              individual items in the list. The "no" prefix interpretation
              can be disabled by "+" prefix.

          -o, --output list
              Define output columns. See the --help output to get a list of
              the currently supported columns. The TARGET column contains
              tree formatting if the --list or --raw options are not
              specified.

              The default list of columns may be extended if list is
              specified in the format +list (e.g., findmnt -o
              +PROPAGATION).

          --output-all
              Output almost all available columns. The columns that require
              --poll are not included.

          -P, --pairs
              Produce output in the form of key="value" pairs. All
              potentially unsafe value characters are hex-escaped
              (\x<code>). The key (variable name) will be modified to
              contain only characters allowed for a shell variable
              identifiers, for example, FS_OPTIONS and USE_PCT instead of
              FS-OPTIONS and USE%.

          -p, --poll[=list]
              Monitor changes in the /proc/self/mountinfo file. Supported
              actions are: mount, umount, remount and move. More than one
              action may be specified in a comma-separated list. All
              actions are monitored by default.

              The time for which --poll will block can be restricted with
              the --timeout or --first-only options.

              The standard columns always use the new version of the
              information from the mountinfo file, except the umount action
              which is based on the original information cached by findmnt.
              The poll mode allows using extra columns:

              ACTION
                  mount, umount, move or remount action name; this column
                  is enabled by default

              OLD-TARGET
                  available for umount and move actions

              OLD-OPTIONS
                  available for umount and remount actions

          --pseudo
              Print only pseudo filesystems.

          --shadow
              Print only filesystems over-mounted by another filesystem.

          -R, --submounts
              Print recursively all submounts for the selected filesystems.
              The restrictions defined by options -t, -O, -S, -T and
              --direction are not applied to submounts. All submounts are
              always printed in tree-like order. The option enables the
              tree-like output format by default. This option has no effect
              for --mtab or --fstab.

          -r, --raw
              Use raw output format. All potentially unsafe characters are
              hex-escaped (\x<code>).

          --real
              Print only real filesystems.

          -S, --source spec
              Explicitly define the mount source. Supported specifications
              are device, maj:_min_, LABEL=label, UUID=uuid,
              PARTLABEL=label and PARTUUID=uuid.

          -s, --fstab
              Search in /etc/fstab. The output is in the list format (see
              --list).

          -T, --target path
              Define the mount target. If path is not a mountpoint file or
              directory, then findmnt checks the path elements in reverse
              order to get the mountpoint (this feature is supported only
              when searching in kernel files and unsupported for --fstab).
              It’s recommended to use the option --mountpoint when checks
              of path elements are unwanted and path is a strictly
              specified mountpoint.

          -t, --types list
              Limit the set of printed filesystems. More than one type may
              be specified in a comma-separated list. The list of
              filesystem types can be prefixed with no to specify the
              filesystem types on which no action should be taken. For more
              details see mount(8).

          --tree
              Enable tree-like output if possible. The options is silently
              ignored for tables where is missing child-parent relation
              (e.g., fstab).

          --shadowed
              Print only filesystems over-mounted by another filesystem.

          -U, --uniq
              Ignore filesystems with duplicate mount targets, thus
              effectively skipping over-mounted mount points.

          -u, --notruncate
              Do not truncate text in columns. The default is to not
              truncate the TARGET, SOURCE, UUID, LABEL, PARTUUID, PARTLABEL
              columns. This option disables text truncation also in all
              other columns.

          -v, --nofsroot
              Do not print a [/dir] in the SOURCE column for bind mounts or
              btrfs subvolumes.

          -w, --timeout milliseconds
              Specify an upper limit on the time for which --poll will
              block, in milliseconds.

          -x, --verify
              Check mount table content. The default is to verify
              /etc/fstab parsability and usability. It’s possible to use
              this option also with --tab-file. It’s possible to specify
              source (device) or target (mountpoint) to filter mount table.
              The option --verbose forces findmnt to print more details.

          --verbose
              Force findmnt to print more information (--verify only for
              now).

          --vfs-all
              When used with VFS-OPTIONS column, print all VFS
              (fs-independent) flags. This option is designed for auditing
              purposes to list also default VFS kernel mount options which
              are normally not listed.


---------------------------------------------------------------

::

          LIBMOUNT_FSTAB=<path>
              overrides the default location of the fstab file

          LIBMOUNT_MTAB=<path>
              overrides the default location of the mtab file

          LIBMOUNT_DEBUG=all
              enables libmount debug output

          LIBSMARTCOLS_DEBUG=all
              enables libsmartcols debug output

          LIBSMARTCOLS_DEBUG_PADDING=on
              use visible padding characters.


---------------------------------------------------------

::

          findmnt --fstab -t nfs
              Prints all NFS filesystems defined in /etc/fstab.

          findmnt --fstab /mnt/foo
              Prints all /etc/fstab filesystems where the mountpoint
              directory is /mnt/foo. It also prints bind mounts where
              /mnt/foo is a source.

          findmnt --fstab --target /mnt/foo
              Prints all /etc/fstab filesystems where the mountpoint
              directory is /mnt/foo.

          findmnt --fstab --evaluate
              Prints all /etc/fstab filesystems and converts LABEL= and
              UUID= tags to the real device names.

          findmnt -n --raw --evaluate --output=target LABEL=/boot
              Prints only the mountpoint where the filesystem with label
              "/boot" is mounted.

          findmnt --poll --mountpoint /mnt/foo
              Monitors mount, unmount, remount and move on /mnt/foo.

          findmnt --poll=umount --first-only --mountpoint /mnt/foo
              Waits for /mnt/foo unmount.

          findmnt --poll=remount -t ext3 -O ro
              Monitors remounts to read-only mode on all ext3 filesystems.


-------------------------------------------------------

::

          Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          fstab(5), mount(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The findmnt command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.294-0c7e       2021-08-19                     FINDMNT(8)

--------------

Pages that refer to this page: `eject(1) <../man1/eject.1.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`fstab(5) <../man5/fstab.5.html>`__, 
`mount_namespaces(7) <../man7/mount_namespaces.7.html>`__, 
`lsblk(8) <../man8/lsblk.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__

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
