.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libmagic(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBMAGIC(3)           BSD Library Functions Manual           LIBMAGIC(3)

NAME
-------------------------------------------------

::

        magic_open, magic_close, magic_error, magic_errno,
        magic_descriptor, magic_buffer, magic_getflags, magic_setflags,
        magic_check, magic_compile, magic_list, magic_load,
        magic_load_buffers, magic_setparam, magic_getparam, magic_version —
        Magic number recognition library


-------------------------------------------------------

::

        Magic Number Recognition Library (libmagic, -lmagic)


---------------------------------------------------------

::

        #include <magic.h>

        magic_t
        magic_open(int flags);

        void
        magic_close(magic_t cookie);

        const char *
        magic_error(magic_t cookie);

        int
        magic_errno(magic_t cookie);

        const char *
        magic_descriptor(magic_t cookie, int fd);

        const char *
        magic_file(magic_t cookie, const char *filename);

        const char *
        magic_buffer(magic_t cookie, const void *buffer, size_t length);

        int
        magic_getflags(magic_t cookie);

        int
        magic_setflags(magic_t cookie, int flags);

        int
        magic_check(magic_t cookie, const char *filename);

        int
        magic_compile(magic_t cookie, const char *filename);

        int
        magic_list(magic_t cookie, const char *filename);

        int
        magic_load(magic_t cookie, const char *filename);

        int
        magic_load_buffers(magic_t cookie, void **buffers, size_t *sizes,
            size_t nbuffers);

        int
        magic_getparam(magic_t cookie, int param, void *value);

        int
        magic_setparam(magic_t cookie, int param, const void *value);

        int
        magic_version(void);


---------------------------------------------------------------

::

        These functions operate on the magic database file which is
        described in magic(4).

        The function magic_open() creates a magic cookie pointer and
        returns it.  It returns NULL if there was an error allocating the
        magic cookie.  The flags argument specifies how the other magic
        functions should behave:

        MAGIC_NONE      No special handling.

        MAGIC_DEBUG     Print debugging messages to stderr.

        MAGIC_SYMLINK   If the file queried is a symlink, follow it.

        MAGIC_COMPRESS  If the file is compressed, unpack it and look at
                        the contents.

        MAGIC_DEVICES   If the file is a block or character special device,
                        then open the device and try to look in its
                        contents.

        MAGIC_MIME_TYPE
                        Return a MIME type string, instead of a textual
                        description.

        MAGIC_MIME_ENCODING
                        Return a MIME encoding, instead of a textual
                        description.

        MAGIC_MIME      A shorthand for MAGIC_MIME_TYPE |
                        MAGIC_MIME_ENCODING.

        MAGIC_CONTINUE  Return all matches, not just the first.

        MAGIC_CHECK     Check the magic database for consistency and print
                        warnings to stderr.

        MAGIC_PRESERVE_ATIME
                        On systems that support utime(3) or utimes(2),
                        attempt to preserve the access time of files
                        analysed.

        MAGIC_RAW       Don't translate unprintable characters to a \ooo
                        octal representation.

        MAGIC_ERROR     Treat operating system errors while trying to open
                        files and follow symlinks as real errors, instead
                        of printing them in the magic buffer.

        MAGIC_APPLE     Return the Apple creator and type.

        MAGIC_EXTENSION
                        Return a slash-separated list of extensions for
                        this file type.

        MAGIC_COMPRESS_TRANSP
                        Don't report on compression, only report about the
                        uncompressed data.

        MAGIC_NO_CHECK_APPTYPE
                        Don't check for EMX application type (only on EMX).

        MAGIC_NO_CHECK_CDF
                        Don't get extra information on MS Composite
                        Document Files.

        MAGIC_NO_CHECK_COMPRESS
                        Don't look inside compressed files.

        MAGIC_NO_CHECK_ELF
                        Don't print ELF details.

        MAGIC_NO_CHECK_ENCODING
                        Don't check text encodings.

        MAGIC_NO_CHECK_SOFT
                        Don't consult magic files.

        MAGIC_NO_CHECK_TAR
                        Don't examine tar files.

        MAGIC_NO_CHECK_TEXT
                        Don't check for various types of text files.

        MAGIC_NO_CHECK_TOKENS
                        Don't look for known tokens inside ascii files.

        MAGIC_NO_CHECK_JSON
                        Don't examine JSON files.

        MAGIC_NO_CHECK_CSV
                        Don't examine CSV files.

        The magic_close() function closes the magic(4) database and
        deallocates any resources used.

        The magic_error() function returns a textual explanation of the
        last error, or NULL if there was no error.

        The magic_errno() function returns the last operating system error
        number (errno(2)) that was encountered by a system call.

        The magic_file() function returns a textual description of the
        contents of the filename argument, or NULL if an error occurred.
        If the filename is NULL, then stdin is used.

        The magic_descriptor() function returns a textual description of
        the contents of the fd argument, or NULL if an error occurred.

        The magic_buffer() function returns a textual description of the
        contents of the buffer argument with length bytes size.

        The magic_getflags() functions returns a value representing current
        flags set.

        The magic_setflags() function sets the flags described above.  Note
        that using both MIME flags together can also return extra
        information on the charset.

        The magic_check() function can be used to check the validity of
        entries in the colon separated database files passed in as
        filename, or NULL for the default database.  It returns 0 on
        success and -1 on failure.

        The magic_compile() function can be used to compile the colon
        separated list of database files passed in as filename, or NULL for
        the default database.  It returns 0 on success and -1 on failure.
        The compiled files created are named from the basename(1) of each
        file argument with “.mgc” appended to it.

        The magic_list() function dumps all magic entries in a human
        readable format, dumping first the entries that are matched against
        binary files and then the ones that match text files.  It takes and
        optional filename argument which is a colon separated list of
        database files, or NULL for the default database.

        The magic_load() function must be used to load the colon separated
        list of database files passed in as filename, or NULL for the
        default database file before any magic queries can performed.

        The default database file is named by the MAGIC environment
        variable.  If that variable is not set, the default database file
        name is /usr/local/share/misc/magic.  magic_load() adds “.mgc” to
        the database filename as appropriate.

        The magic_load_buffers() function takes an array of size nbuffers
        of buffers with a respective size for each in the array of sizes
        loaded with the contents of the magic databases from the
        filesystem.  This function can be used in environment where the
        magic library does not have direct access to the filesystem, but
        can access the magic database via shared memory or other IPC means.

        The magic_getparam() and magic_setparam() allow getting and setting
        various limits related to the magic library.

              Parameter                    Type      Default
              MAGIC_PARAM_INDIR_MAX        size_t    15
              MAGIC_PARAM_NAME_MAX         size_t    30
              MAGIC_PARAM_ELF_NOTES_MAX    size_t    256
              MAGIC_PARAM_ELF_PHNUM_MAX    size_t    128
              MAGIC_PARAM_ELF_SHNUM_MAX    size_t    32768
              MAGIC_PARAM_REGEX_MAX        size_t    8192
              MAGIC_PARAM_BYTES_MAX        size_t    1048576

        The MAGIC_PARAM_INDIR_RECURSION parameter controls how many levels
        of recursion will be followed for indirect magic entries.

        The MAGIC_PARAM_NAME_RECURSION parameter controls how many levels
        of recursion will be followed for for name/use calls.

        The MAGIC_PARAM_NAME_MAX parameter controls the maximum number of
        calls for name/use.

        The MAGIC_PARAM_NOTES_MAX parameter controls how many ELF notes
        will be processed.

        The MAGIC_PARAM_PHNUM_MAX parameter controls how many ELF program
        sections will be processed.

        The MAGIC_PARAM_SHNUM_MAX parameter controls how many ELF sections
        will be processed.

        The magic_version() command returns the version number of this
        library which is compiled into the shared library using the
        constant MAGIC_VERSION from <magic.h>.  This can be used by client
        programs to verify that the version they compile against is the
        same as the version that they run against.


-------------------------------------------------------------------

::

        The function magic_open() returns a magic cookie on success and
        NULL on failure setting errno to an appropriate value.  It will set
        errno to EINVAL if an unsupported value for flags was given.  The
        magic_list(), magic_load(), magic_compile(), and magic_check()
        functions return 0 on success and -1 on failure.  The
        magic_buffer(), magic_getpath(), and magic_file(), functions return
        a string on success and NULL on failure.  The magic_error()
        function returns a textual description of the errors of the above
        functions, or NULL if there was no error.  The magic_version()
        always returns the version number of the library.  Finally,
        magic_setflags() returns -1 on systems that don't support utime(3),
        or utimes(2) when MAGIC_PRESERVE_ATIME is set.


---------------------------------------------------

::

        /usr/local/share/misc/magic      The non-compiled default magic
                                         database.
        /usr/local/share/misc/magic.mgc  The compiled default magic
                                         database.


---------------------------------------------------------

::

        file(1), magic(4)


-------------------------------------------------

::

        The results from magic_buffer() and magic_file() where the buffer
        and the file contain the same data can produce different results,
        because in the magic_file() case, the program can lseek(2) and
        stat(2) the file descriptor.


-------------------------------------------------------

::

        Måns Rullgård Initial libmagic implementation, and configuration.
        Christos Zoulas API cleanup, error code and allocation handling.

COLOPHON
---------------------------------------------------------

::

        This page is part of the file (a file type guesser) project.
        Information about the project can be found at
        http://www.darwinsys.com/file/.  If you have a bug report for this
        manual page, see ⟨http://bugs.gw.com/my_view_page.php⟩.  This page
        was obtained from the project's upstream Git read-only mirror of
        the CVS repository ⟨https://github.com/glensc/file⟩ on 2021-08-27.
        (At that time, the date of the most recent commit that was found in
        the repository was 2021-08-26.)  If you discover any rendering
        problems in this HTML version of the page, or you believe there is
        a better or more up-to-date source for the page, or you have
        corrections or improvements to the information in this COLOPHON
        (which is not part of the original manual page), send a mail to
        man-pages@man7.org

   BSD                           June 8, 2019                           BSD

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
