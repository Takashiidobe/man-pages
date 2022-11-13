.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sparse(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `WARN                             |                                   |
| ING OPTIONS <#WARNING_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `MISC OPTIONS <#MISC_OPTIONS>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| DEBUG OPTIONS <#DEBUG_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| OTHER OPTIONS <#OTHER_OPTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `HOMEPAGE <#HOMEPAGE>`__ \|       |                                   |
| `MAILING LIST <#MAILING_LIST>`__  |                                   |
| \|                                |                                   |
| `CON                              |                                   |
| TRIBUTING AND REPORTING BUGS <#CO |                                   |
| NTRIBUTING_AND_REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| DOCUMENTATION <#DOCUMENTATION>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   sparse(1)                General Commands Manual               sparse(1)

NAME
-------------------------------------------------

::

          sparse - Semantic Parser for C


---------------------------------------------------------

::

          sparse [WARNING OPTIONS]... file.c


---------------------------------------------------------------

::

          Sparse parses C source and looks for errors, producing warnings
          on standard error.

          Sparse accepts options controlling the set of warnings to
          generate.  To turn on warnings Sparse does not issue by default,
          use the corresponding warning option -Wsomething.  Sparse issues
          some warnings by default; to turn off those warnings, pass the
          negation of the associated warning option, -Wno-something.


-----------------------------------------------------------------------

::

          -fmax-errors=COUNT
                 Set the maximum number of displayed errors to COUNT, which
                 should be a numerical value or 'unlimited'.  The default
                 limit is 100.

          -fmax-warnings=COUNT
                 Set the maximum number of displayed warnings to COUNT,
                 which should be a numerical value or 'unlimited'.  The
                 default limit is 100.

          -Wsparse-all
                 Turn on all sparse warnings, except for those explicitly
                 disabled via -Wno-something.

          -Wsparse-error
                 Turn all sparse warnings into errors.

          -Waddress-space
                 Warn about code which mixes pointers to different address
                 spaces.

                 Sparse allows an extended attribute
                 __attribute__((address_space(id))) on pointers, which
                 designates a pointer target in address space id (an
                 identifier or a constant integer).  With -Waddress-space,
                 Sparse treats pointers with identical target types but
                 different address spaces as distinct types and will warn
                 accordingly.

                 Sparse will also warn on casts which remove the address
                 space (casts to an integer type or to a plain pointer
                 type). An exception to this is when the destination type
                 is uintptr_t (or unsigned long) since such casts are often
                 used to "get a pointer value representation in an integer
                 type" and such values are independent of the address
                 space.

                 To override these warnings, use a type that includes
                 __attribute__((force)).

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-address-space.

          -Wbitwise
                 Warn about unsupported operations or type mismatches with
                 restricted integer types.

                 Sparse supports an extended attribute,
                 __attribute__((bitwise)), which creates a new restricted
                 integer type from a base integer type, distinct from the
                 base integer type and from any other restricted integer
                 type not declared in the same declaration or typedef.  For
                 example, this allows programs to create typedefs for
                 integer types with specific endianness.  With -Wbitwise,
                 Sparse will warn on any use of a restricted type in
                 arithmetic operations other than bitwise operations, and
                 on any conversion of one restricted type into another,
                 except via a cast that includes __attribute__((force)).

                 __bitwise ends up being a "stronger integer separation",
                 one that doesn't allow you to mix with non-bitwise
                 integers, so now it's much harder to lose the type by
                 mistake.

                 __bitwise is for *unique types* that cannot be mixed with
                 other types, and that you'd never want to just use as a
                 random integer (the integer 0 is special, though, and gets
                 silently accepted iirc - it's kind of like "NULL" for
                 pointers). So "gfp_t" or the "safe endianness" types would
                 be __bitwise: you can only operate on them by doing
                 specific operations that know about *that* particular
                 type.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-bitwise.

          -Wbitwise-pointer
                 Same as -Wbitwise but for casts to or from pointers to
                 bitwise types.

                 Sparse does not issue these warnings by default.

          -Wcast-from-as
                 Warn about casts which remove an address space from a
                 pointer type.

                 This is similar to -Waddress-space but will also warn on
                 casts to unsigned long.

                 Sparse does not issues these warnings by default.

          -Wcast-to-as
                 Warn about casts which add an address space to a pointer
                 type.

                 A cast that includes __attribute__((force)) will suppress
                 this warning.  No warning is generated if the original
                 type is uintptr_t (or unsigned long).

                 Sparse does not issue these warnings by default.

          -Wcast-truncate
                 Warn about casts that truncate constant values.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-cast-truncate.

          -Wconstant-suffix
                 Warn if an integer constant is larger than the maximum
                 representable value of the type indicated by its type
                 suffix (if any). For example, on a system where ints are
                 32-bit and longs 64-bit, the constant 0x100000000U is
                 larger than can be represented by an unsigned int but fits
                 in an unsigned long. So its type is unsigned long but this
                 is not indicated by its suffix. In this case, the warning
                 could be suppressed by using the suffix UL: 0x100000000UL.

                 Sparse does not issue these warnings by default.

          -Wconstexpr-not-const
                 Warn if a non-constant expression is encountered when
                 really expecting a constant expression instead.
                 Currently, this warns when initializing an object of
                 static storage duration with an initializer which is not a
                 constant expression.

                 Sparse does not issue these warnings by default.

          -Wcontext
                 Warn about potential errors in synchronization or other
                 delimited contexts.

                 Sparse supports several means of designating functions or
                 statements that delimit contexts, such as synchronization.
                 Functions with the extended attribute
                 __attribute__((context(expression,in_context,out_context))
                 require the context expression (for instance, a lock) to
                 have the value in_context (a constant nonnegative integer)
                 when called, and return with the value out_context (a
                 constant nonnegative integer).  For APIs defined via
                 macros, use the statement form
                 __context__(expression,in_value,out_value) in the body of
                 the macro.

                 With -Wcontext Sparse will warn when it sees a function
                 change the context without indicating this with a context
                 attribute, either by decreasing a context below zero (such
                 as by releasing a lock without acquiring it), or returning
                 with a changed context (such as by acquiring a lock
                 without releasing it).  Sparse will also warn about blocks
                 of code which may potentially execute with different
                 contexts.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-context.

          -Wdecl Warn about any non-static variable or function definition
                 that has no previous declaration.

                 Private symbols (functions and variables) internal to a
                 given source file should use static, to allow additional
                 compiler optimizations, allow detection of unused symbols,
                 and prevent other code from relying on these internal
                 symbols.  Public symbols used by other source files will
                 need declarations visible to those other source files,
                 such as in a header file.  All declarations should fall
                 into one of these two categories.  Thus, with -Wdecl,
                 Sparse warns about any symbol definition with neither
                 static nor a declaration.  To fix this warning, declare
                 private symbols static, and ensure that the files defining
                 public symbols have the symbol declarations available
                 first (such as by including the appropriate header file).

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-decl.

          -Wdeclaration-after-statement
                 Warn about declarations that are not at the start of a
                 block.

                 These declarations are permitted in C99 but not in C89.

                 Sparse issues these warnings by default only when the C
                 dialect is C89 (i.e. -ansi or -std=c89).  To turn them
                 off, use -Wno-declaration-after-statement.

          -Wdefault-bitfield-sign
                 Warn about any bitfield with no explicit signedness.

                 Bitfields have no standard-specified default signedness.
                 (C99 6.7.2) A bitfield without an explicit signed or
                 unsigned creates a portability problem for software that
                 relies on the available range of values.  To fix this,
                 specify the bitfield type as signed or unsigned
                 explicitly.

                 Sparse does not issue these warnings by default.

          -Wdesignated-init
                 Warn about positional initialization of structs marked as
                 requiring designated initializers.

                 Sparse allows an attribute
                 __attribute__((designated_init)) which marks a struct as
                 requiring designated initializers.  Sparse will warn about
                 positional initialization of a struct variable or struct
                 literal of a type that has this attribute.

                 Requiring designated initializers for a particular struct
                 type will insulate code using that struct type from
                 changes to the layout of the type, avoiding the need to
                 change initializers for that type unless they initialize a
                 removed or incompatibly changed field.

                 Common examples of this type of struct include collections
                 of function pointers for the implementations of a class of
                 related operations, for which the default NULL for an
                 unmentioned field in a designated initializer will
                 correctly indicate the absence of that operation.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-designated-init.

          -Wdo-while
                 Warn about do-while loops that do not delimit the loop
                 body with braces.

                 Sparse does not issue these warnings by default.

          -Wenum-mismatch
                 Warn about the use of an expression of an incorrect enum
                 type when initializing another enum type, assigning to
                 another enum type, or passing an argument to a function
                 which expects another enum type.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-enum-mismatch.

          -Wexternal-function-has-definition
                 Warn about function definitions that are declared with
                 external linkage.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-external-function-has-definition.

          -Wflexible-array-array
                 Warn about arrays of structures containing a flexible
                 array.

                 Sparse issues these warnings by default. To turn them off,
                 use -Wno-flexible-array-array.

          -Wflexible-array-nested
                 Warn about structures containing a flexible array being
                 contained into another structure, union or array.

                 Sparse does not issue these warnings by default.

          -Wflexible-array-sizeof
                 Warn about using the sizeof operator on a structure
                 containing a flexible array, possibly recursively.

                 Sparse does not issue these warnings by default.

          -Wflexible-array-union
                 Enable the warnings regarding flexible arrays and unions.
                 To have any effect, at least one of -Wflexible-array-
                 array, -Wflexible-array-nested or -Wflexible-array-sizeof
                 must also be enabled.

                 Sparse does issue these warnings by default.

          -Winit-cstring
                 Warn about initialization of a char array with a too long
                 constant C string.

                 If the size of the char array and the length of the string
                 are the same, there is no space for the last nul char of
                 the string in the array:

                 char s[3] = "abc";

                 If the array is used as a byte array, not as C string,
                 this warning is just noise. However, if the array is
                 passed to functions dealing with C string like printf(%s)
                 and strcmp, it may cause a trouble.

                 Sparse does not issue these warnings by default.

          -Wmemcpy-max-count
                 Warn about call of memcpy(), memset(), copy_from_user(),
                 or copy_to_user() with a large compile-time byte count.

                 Sparse issues these warnings by default. To turn them off,
                 use -Wno-memcpy-max-count.

                 The limit can be changed with -fmemcpy-max-count=COUNT,
                 the default being 100000.

          -Wnewline-eof
                 Warn if the input file doesn't end with a newline.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-newline-eof.

          -Wnon-pointer-null
                 Warn about the use of 0 as a NULL pointer.

                 0 has integer type.  NULL has pointer type.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-non-pointer-null.

          -Wold-initializer
                 Warn about the use of the pre-C99 GCC syntax for
                 designated initializers.

                 C99 provides a standard syntax for designated fields in
                 struct or union initializers:

                 struct structname var = { .field = value };

                 GCC also has an old, non-standard syntax for designated
                 initializers which predates C99:

                 struct structname var = { field: value };

                 Sparse will warn about the use of GCC's non-standard
                 syntax for designated initializers.  To fix this warning,
                 convert designated initializers to use the standard C99
                 syntax.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-old-initializer.

          -Wone-bit-signed-bitfield
                 Warn about any one-bit signed bitfields.

                 A one-bit signed bitfield can only have the values 0 and
                 -1, or with some compilers only 0; this results in
                 unexpected behavior for programs which expected the
                 ability to store 0 and 1.

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-one-bit-signed-bitfield.

          -Wparen-string
                 Warn about the use of a parenthesized string to initialize
                 an array.

                 Standard C syntax does not permit a parenthesized string
                 as an array initializer.  GCC allows this syntax as an
                 extension.  With -Wparen-string, Sparse will warn about
                 this syntax.

                 Sparse does not issue these warnings by default.

          -Wpast-deep-designator
                 Warn when, in a initializer-list, a initializer with a
                 deep (nested) designator is followed by a non-designated
                 one.

                 Sparse does not issue these warnings by default.

          -Wpointer-arith
                 Warn about anything that depends on the sizeof a void or
                 function type.

                 C99 does not allow the sizeof operator to be applied to
                 function types or to incomplete types such as void. GCC
                 allows sizeof to be applied to these types as an extension
                 and assigns these types a size of 1. With -pointer-arith,
                 Sparse will warn about pointer arithmetic on void or
                 function pointers, as well as expressions which directly
                 apply the sizeof operator to void or function types.

                 Sparse does not issue these warnings by default.

          -Wptr-subtraction-blows
                 Warn when subtracting two pointers to a type with a non-
                 power-of-two size.

                 Subtracting two pointers to a given type gives a
                 difference in terms of the number of items of that type.
                 To generate this value, compilers will usually need to
                 divide the difference by the size of the type, an
                 potentially expensive operation for sizes other than
                 powers of two.

                 Code written using pointer subtraction can often use
                 another approach instead, such as array indexing with an
                 explicit array index variable, which may allow compilers
                 to generate more efficient code.

                 Sparse does not issue these warnings by default.

          -Wreturn-void
                 Warn if a function with return type void returns a void
                 expression.

                 C99 permits this, and in some cases this allows for more
                 generic code in macros that use typeof or take a type as a
                 macro argument.  However, some programs consider this poor
                 style, and those programs can use -Wreturn-void to get
                 warnings about it.

                 Sparse does not issue these warnings by default.

          -Wshadow
                 Warn when declaring a symbol which shadows a declaration
                 with the same name in an outer scope.

                 Such declarations can lead to error-prone code.

                 Sparse does not issue these warnings by default.

          -Wshift-count-negative
                 Warn if a shift count is negative.

                 Sparse issues these warnings by default.

          -Wshift-count-overflow
                 Warn if a shift count is bigger than the operand's width.

                 Sparse issues these warnings by default.

          -Wsizeof-bool
                 Warn when checking the sizeof a _Bool.

                 C99 does not specify the size of a _Bool. GCC, by default,
                 uses 1.

                 Sparse does not issue these warnings by default.

          -Wtransparent-union
                 Warn about any declaration using the GCC extension
                 __attribute__((transparent_union)).

                 Sparse issues these warnings by default.  To turn them
                 off, use -Wno-transparent-union.

          -Wtypesign
                 Warn when converting a pointer to an integer type into a
                 pointer to an integer type with different signedness.

                 Sparse does not issue these warnings by default.

          -Wundef
                 Warn about preprocessor conditionals that use the value of
                 an undefined preprocessor symbol.

                 Standard C (C99 6.10.1) permits using the value of an
                 undefined preprocessor symbol in preprocessor
                 conditionals, and specifies it has a value of 0.  However,
                 this behavior can lead to subtle errors.

                 Sparse does not issue these warnings by default.

          -Wuniversal-initializer
                 Do not suppress warnings caused by using '{ 0 }' instead
                 of '{ }' on aggregate types, ignoring its special status
                 as universal initializer.  The concerned warnings are, for
                 example, those triggered by -Wdesignated-init or
                 -Wnon-pointer-null.

                 Sparse does not issue these warnings by default,
                 processing '{ 0 }' the same as '{ }'.

          -Wunion-cast
                 Warn on casts to union types.

                 Sparse does not issues these warnings by default.


-----------------------------------------------------------------

::

          --arch=ARCH
                 Specify the target architecture.  For architectures having
                 both a 32-bit and a 64-bit variant (mips, powerpc, riscv
                 and sparc) the architecture name can be suffixed with 32
                 or 64.

                 The default architecture and size is the one of the
                 machine used to build Sparse.

          -gcc-base-dir dir
                 Look for compiler-provided system headers in dir/include/
                 and dir/include-fixed/.

          -multiarch-dir dir
                 Look for system headers in the multiarch subdirectory dir.
                 The dir name would normally take the form of the target's
                 normalized GNU triplet. (e.g. i386-linux-gnu).

          --os=OS
                 Specify the target Operating System.  This only makes a
                 few differences with the predefined types.  The accepted
                 values are: linux, unix, freebsd, netbsd, opensd, sunos,
                 darwin and cygwin.

                 The default OS is the one of the machine used to build
                 Sparse if it can be detected, otherwise some generic
                 settings are used.


-------------------------------------------------------------------

::

          -fmem-report
                 Report some statistics about memory allocation used by the
                 tool.


-------------------------------------------------------------------

::

          -fdiagnostic-prefix[=PREFIX]
                 Prefix all diagnostics by the given PREFIX, followed by ":
                 ".  If no one is given "sparse" is used.  The default is
                 to not use a prefix at all.

          -fmemcpy-max-count=COUNT
                 Set the limit for the warnings given by -Wmemcpy-max-
                 count.  A COUNT of 'unlimited' or '0' will effectively
                 disable the warning.  The default limit is 100000.

          -ftabstop=WIDTH
                 Set the distance between tab stops.  This helps sparse
                 report correct column numbers in warnings or errors.  If
                 the value is less than 1 or greater than 100, the option
                 is ignored.  The default is 8.

          -f[no-]unsigned-bitfields, -f[no-]signed-bitfields
                 Determine the signedness of bitfields declared without an
                 explicit sign ('signed' or 'unsigned').  By default such
                 bitfields are signed, like others plain integers.

          -f[no-]unsigned-char, -f[no-]signed-char
                 Let plain 'char' be unsigned or signed.  By default chars
                 are signed.


---------------------------------------------------------

::

          cgcc(1)


---------------------------------------------------------

::

          https://sparse.docs.kernel.org


-----------------------------------------------------------------

::

          linux-sparse@vger.kernel.org


-------------------------------------------------------------------------------------------------------

::

          Submission of patches and reporting of bugs, as well as
          discussions related to Sparse, should be done via the mailing
          list (linux-sparse@vger.kernel.org) where the development and
          maintenance is primarily done.  You do not have to be subscribed
          to the list to send a message there.

          Bugs can also be reported and tracked via the Linux kernel's
          bugzilla:
          http://bugzilla.kernel.org/enter_bug.cgi?component=Sparse&product=Tools
          .


-------------------------------------------------------------------

::

          More documentation about Sparse can be found at
          https://sparse.docs.kernel.org


-------------------------------------------------------

::

          Sparse was started by Linus Torvalds.  The complete list of
          contributors can be find at
          https://www.openhub.net/p/sparse/contributors .

          Luc Van Oostenryck is Sparse's current maintainer.

COLOPHON
---------------------------------------------------------

::

          This page is part of the sparse (a Semantic Parser for C)
          project.  Information about the project can be found at 
          ⟨https://sparse.wiki.kernel.org/⟩.  If you have a bug report for
          this manual page, send it to linux-sparse@vger.kernel.org.  This
          page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/devel/sparse/sparse.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-02.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                                  sparse(1)

--------------

Pages that refer to this page: `cgcc(1) <../man1/cgcc.1.html>`__, 
`semind(1) <../man1/semind.1.html>`__

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
