.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ltrace.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PROTOTYPES <#PROTOTYPES>`__ \|   |                                   |
| `TYPES <#TYPES>`__ \|             |                                   |
| `LENSES <#LENSES>`__ \|           |                                   |
| `TYPE ALIASES <#TYPE_ALIASES>`__  |                                   |
| \|                                |                                   |
| `IMPORT D                         |                                   |
| IRECTIVES <#IMPORT_DIRECTIVES>`__ |                                   |
| \|                                |                                   |
| `RECURSIVE STRU                   |                                   |
| CTURES <#RECURSIVE_STRUCTURES>`__ |                                   |
| \| `EXPRESSIONS <#EXPRESSIONS>`__ |                                   |
| \|                                |                                   |
| `PARA                             |                                   |
| METER PACKS <#PARAMETER_PACKS>`__ |                                   |
| \|                                |                                   |
| `RETURN                           |                                   |
|  ARGUMENTS <#RETURN_ARGUMENTS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ltrace.conf(5)          ltrace configuration file         ltrace.conf(5)

NAME
-------------------------------------------------

::

          ltrace.conf - Configuration file for ltrace(1).


---------------------------------------------------------------

::

          This manual page describes ltrace.conf, a file that describes
          prototypes of functions in binaries for ltrace(1) to use.  Ltrace
          needs this information to display function call arguments.

          Each line of a configuration file describes at most a single
          item.  Lines composed entirely of white space are ignored, as are
          lines starting with semicolon or hash characters (comment lines).
          Described items can be either function prototypes, or definitions
          of type aliases.


-------------------------------------------------------------

::

          A prototype describes return type and parameter types of a single
          function.  The syntax is as follows:

                 [function] LENS NAME ([LENS{,LENS}]);

          NAME is the (mangled) name of a symbol.  In the elementary case,
          LENS is simply a type.  Both lenses and types are described
          below.  The function keyword, if present, has no effect.  It can
          be used to force a line to be interpreted as a function prototype
          when the return type is a keyword that would start a different
          type of line (such as import).

          For example, a simple function prototype might look like this:

                 int kill(int,int);

          Despite the apparent similarity with C, ltrace.conf is really its
          own language that's only somewhat inspired by C.


---------------------------------------------------

::

          Ltrace understands a range of primitive types.  Those are
          interpreted according to C convention native on a given
          architecture.  E.g. ulong is interpreted as 4-byte unsigned
          integer on 32-bit GNU/Linux machine, but 8-byte unsigned integer
          on 64-bit GNU/Linux machine.

          void   Denotes that a function does not return anything.  Can be
                 also used to construct a generic pointer, i.e. pointer-
                 sized number formatted in hexadecimal format.

          char   8-bit quantity rendered as a character

          ushort,short
                 Denotes unsigned or signed short integer.

          uint,int
                 Denotes unsigned or signed integer.

          ulong,long
                 Denotes unsigned or signed long integer.

          float  Denotes floating point number with single precision.

          double Denotes floating point number with double precision.

          Besides primitive types, the following composed types are
          possible:

          struct([LENS{,LENS}])
                 Describes a structure with given types as fields, e.g.
                 struct(int,int,float).

                 Alignment is computed as customary on the architecture.
                 Custom alignment (e.g. packed structs) and bit-fields are
                 not supported.  It's also not possible to differentiate
                 between structs and non-POD C++ classes, for arches where
                 it makes a difference.

          array(LENS,EXPR)
                 Describes array of length EXPR, which is composed of types
                 described by LENS, e.g. array(int, 6).

                 Note that in C, arrays in role of function argument decay
                 into pointers.  Ltrace currently handles this
                 automatically, but for full formal correctness, any such
                 arguments should be described as pointers to arrays.

          LENS*  Describes a pointer to a given type, e.g. char* or int***.
                 Note that the former example actually describes a pointer
                 to a character, not a string.  See below for string lens,
                 which is applicable to these cases.


-----------------------------------------------------

::

          Lenses change the way that types are described.  In the simplest
          case, a lens is directly a type.  Otherwise a type is decorated
          by the lens.  Ltrace understands the following lenses:

          oct(TYPE)
                 The argument, which should be an integer type, is
                 formatted in base-8.

          hex(TYPE)
                 The argument, which should be an integer or floating point
                 type, is formatted in base-16.  Floating point arguments
                 are converted to double and then displayed using the %a
                 fprintf modifier.

          hide(TYPE)
                 The argument is not shown in argument list.

          bool(TYPE)
                 Arguments with zero value are shown as "false", others are
                 shown as "true".

          bitvec(TYPE)
                 Underlying argument is interpreted as a bit vector and a
                 summary of bits set in the vector is displayed.  For
                 example if bits 3,4,5 and 7 of the bit vector are set,
                 ltrace shows <3-5,7>.  Empty bit vector is displayed as
                 <>.  If there are more bits set than unset, inverse is
                 shown instead: e.g. ~<0> when a number 0xfffffffe is
                 displayed.  Full set is thus displayed ~<>.

                 If the underlying type is integral, then bits are shown in
                 their natural big-endian order, with LSB being bit 0.
                 E.g. bitvec(ushort) with value 0x0102 would be displayed
                 as <1,8>, irrespective of underlying byte order.

                 For other data types (notably structures and arrays), the
                 underlying data is interpreted byte after byte.  Bit 0 of
                 first byte has number 0, bit 0 of second byte number 8,
                 and so on.  Thus bitvec(struct(int)) is endian sensitive,
                 and will show bytes comprising the integer in their memory
                 order.  Pointers are first dereferenced, thus
                 bitvec(array(char, 32)*) is actually a pointer to 256-bit
                 bit vector.

          string(TYPE)
          string[EXPR]
          string
                 The first form of the argument is canonical, the latter
                 two are syntactic sugar.  In the canonical form, the
                 function argument is formatted as string.  The TYPE can
                 have either of the following forms: X*, or array(X,EXPR),
                 or array(X,EXPR)*.  X is either char for normal strings,
                 or an integer type for wide-character strings.

                 If an array is given, the length will typically be a zero
                 expression (but doesn't have to be).  Using argument that
                 is plain array (i.e. not a pointer to array) makes sense
                 e.g. in C structs, in cases like struct(string(array(char,
                 6))), which describes the C type struct {char s[6];}.

                 Because simple C-like strings are pretty common, there are
                 two shorthand forms.  The first shorthand form (with
                 brackets) means the same as string(array(char, EXPR)*).
                 Plain string without an argument is then taken to mean the
                 same as string[zero].

                 Note that char* by itself describes a pointer to a char.
                 Ltrace will dereference the pointer, and read and display
                 the single character that it points to.

          enum(NAME[=VALUE]{,NAME[=VALUE]})
          enum[TYPE](NAME[=VALUE]{,NAME[=VALUE]})
                 This describes an enumeration lens.  If an argument has
                 any of the given values, it is instead shown as the
                 corresponding NAME.  If a VALUE is omitted, the next
                 consecutive value following after the previous VALUE is
                 taken instead.  If the first VALUE is omitted, it's 0 by
                 default.

                 TYPE, if given, is the underlying type.  It is thus
                 possible to create enums over shorts or longs—arguments
                 that are themselves plain, non-enum types in C, but whose
                 values can be meaningfully described as enumerations.  If
                 omitted, TYPE is taken to be int.


-----------------------------------------------------------------

::

          A line in config file can, instead of describing a prototype,
          create a type alias.  Instead of writing the same enum or struct
          on many places (and possibly updating when it changes), one can
          introduce a name for such type, and later just use that name:

                 typedef NAME = LENS;


---------------------------------------------------------------------------

::

          It's possible for config files to import definitions from other
          config files.  A line of the form:

                 import "FILENAME";

          will make all definitions from FILENAME.conf available in the
          current file.  The imported file is searched for in the same
          directories as when looking up a config file corresponding to a
          library; see ltrace(1) for details.


---------------------------------------------------------------------------------

::

          Ltrace allows you to express recursive structures.  Such
          structures are expanded to the depth described by the parameter
          -A.  To declare a recursive type, you first have to introduce the
          type to ltrace by using forward declaration.  Then you can use
          the type in other type definitions in the usual way:

                 typedef NAME = struct;
                 typedef NAME = struct(NAME can be used here)

          For example, consider the following singy-linked structure and a
          function that takes such list as an argument:

                 typedef int_list = struct;
                 typedef int_list = struct(int, int_list*);
                 void ll(int_list*);

          Such declarations might lead to an output like the following:

                 ll({ 9, { 8, { 7, { 6, ... } } } }) = <void>

          Ltrace detects recursion and will not expand already-expanded
          structures.  Thus a doubly-linked list would look like the
          following:

                 typedef int_list = struct;
                 typedef int_list = struct(int, int_list*, int_list*);

          With output e.g. like:

                 ll({ 9, { 8, { 7, { 6, ..., ... }, recurse^ }, recurse^ },
                 nil })

          The "recurse^" tokens mean that given pointer points to a
          structure that was expanded in the previous layer.  Simple
          "recurse" would mean that it points back to this object.  E.g.
          "recurse^^^" means it points to a structure three layers up.  For
          doubly-linked list, the pointer to the previous element is of
          course the one that has been just expanded in the previous round,
          and therefore all of them are either recurse^, or nil.  If the
          next and previous pointers are swapped, the output adjusts
          correspondingly:

                 ll({ 9, nil, { 8, recurse^, { 7, recurse^, { 6, ..., ... }
                 } } })


---------------------------------------------------------------

::

          Ltrace has support for some elementary expressions.  Each
          expression can be either of the following:

          NUM    An integer number.

          argNUM Value of NUM-th argument.  The expression has the same
                 value as the corresponding argument.  arg1 refers to the
                 first argument, arg0 to the return value of the given
                 function.

          retval Return value of function, same as arg0.

          eltNUM Value of NUM-th element of the surrounding structure type.
                 E.g.  struct(ulong,array(int,elt1)) describes a structure
                 whose first element is a length, and second element an
                 array of ints of that length.

          zero
          zero(EXPR)
                 Describes array which extends until the first element,
                 whose each byte is 0.  If an expression is given, that is
                 the maximum length of the array.  If NUL terminator is not
                 found earlier, that's where the array ends.


-----------------------------------------------------------------------

::

          Sometimes the actual function prototype varies slightly depending
          on the exact parameters given.  For example, the number and types
          of printf parameters are not known in advance, but ltrace might
          be able to determine them in runtime.  This feature has wider
          applicability, but currently the only parameter pack that ltrace
          supports is printf-style format string itself:

          format When format is seen in the parameter list, the underlying
                 string argument is parsed, and GNU-style format specifiers
                 are used to determine what the following actual arguments
                 are.  E.g. if the format string is "%s %d\n", it's as if
                 the format was replaced by string, string, int.


-------------------------------------------------------------------------

::

          C functions often use one or more arguments for returning values
          back to the caller.  The caller provides a pointer to storage,
          which the called function initializes.  Ltrace has some support
          for this idiom.

          When a traced binary hits a function call, ltrace first fetches
          all arguments.  It then displays left portion of the argument
          list.  Only when the function returns does ltrace display right
          portion as well.  Typically, left portion takes up all the
          arguments, and right portion only contains return value.  But
          ltrace allows you to configure where exactly to put the dividing
          line by means of a + operator placed in front of an argument:

                 int asprintf(+string*, format);

          Here, the first argument to asprintf is denoted as return
          argument, which means that displaying the whole argument list is
          delayed until the function returns:

                 a.out->asprintf( <unfinished ...>
                 libc.so.6->malloc(100)                   = 0x245b010
                 [... more calls here ...]
                 <... asprintf resumed> "X=1", "X=%d", 1) = 5

          It is currently not possible to have an "inout" argument that
          passes information in both directions.


---------------------------------------------------------

::

          In the following, the first is the C prototype, and following
          that is ltrace configuration line.

          void func_charp_string(char str[]);
                 void func_charp_string(string);

          enum e_foo {RED, GREEN, BLUE};
          void func_enum(enum e_foo bar);
                 void func_enum(enum(RED,GREEN,BLUE));
                        - or -
                 typedef e_foo = enum(RED,GREEN,BLUE);
                 void func_enum(e_foo);

          void func_arrayi(int arr[], int len);
                 void func_arrayi(array(int,arg2)*,int);

          struct S1 {float f; char a; char b;};
          struct S2 {char str[6]; float f;};
          struct S1 func_struct(int a, struct S2, double d);
                 struct(float,char,char) func_struct(int,
                 struct(string(array(char, 6)),float), double);


-----------------------------------------------------

::

          Petr Machata <pmachata@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the ltrace (library call tracer) project.
          Information about the project can be found at 
          ⟨http://ltrace.org/⟩.  If you have a bug report for this manual
          page, see ⟨http://ltrace.org/⟩.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/dkogan/ltrace⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2016-09-01.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                 October 2012                ltrace.conf(5)

--------------

Pages that refer to this page: `ltrace(1) <../man1/ltrace.1.html>`__

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
