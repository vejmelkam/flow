

Built-in library of tasks
=========================


Filesystem
==========

Tasks
-----
* write <string> to file <filename>
* touch <filename>
* rename/move <src_filename> to <tgt_filename>
* create symlink to <tgt_file> from <new_link>
* bulk make symlinks to <files> exiting in <tgt_directory> from <link_directory>
* create directory <dir>
* remove file <file>
* remove directory<directory>
* delete file or directory (recursively) <file-or-dir-name>
* delete all files maching <regexp>


Query functions
---------------
* directory <dir> exists?
* file <file> exists?
* read <file> contents and return as string
* get <file-size> of <file>


Subprocess execution
====================
* execute file <file> in directory <in-dir>, pass it args <args>, store/read in output as <output>
* monitor process output file <file> and scan for <string>
* continuously scan output file <file> and monitor progress of process <process>


Network
=======
* stream the content of <url> via HTTP/GET to a file <file>
* retrieve the content of a <url> via HTTP/GET into a <string>
* download and cache a set of grib files to cover <time span> from grib source <source>


Query functions
---------------
* check if a file exists at <url> via HTTP/HEAD


Miscellaneous
=============

* wait for <ms> milliseconds


Namelists
=========

* update a parsed namelist <nl> with a kvy/value property list <lst>
* load a namelist with name <name> form the namelist dbase and return its parsed form



