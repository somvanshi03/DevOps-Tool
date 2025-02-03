Vim Editor
				   

	There are two main modes in vi editor, COMMAND mode and INSERT mode.
	COMMAND mode is for giving commands to the vi editor and INSERT mode is for
	entrying data.

		Vi editor opens in COMMAND mode by default. To go to the INSERT mode
	press "i" or "Insert". If the last line of the screen displays "-- INSERT --"
	then it is in the INSERT mode and to return to the COMMAND mode press "Esc".

		There is also a REPLACE mode where one can overwrite the content without
	inserting. To to to the REPLACE mode press "Insert" twice. In REPLACE mode the
	last line of the screen displays "-- REPLACE --".

	Open
	====
	# vi			-> open
	# vi <file>		-> open the file
	# view <file>		-> open the file as read-only

	Save / Exit
	===========
	:q			-> exit
	:w			-> save
	:w <file>		-> save as
	:wq			-> save and exit
	:x			-^
	ZZ			-^
	:q!			-> exit forcefully without saving
	:w!			-> save forcefully
				   (in case of read-only files, which can be saved only
					by the owner or root)

	Switch mode
	===========
	i			-> go to INSERT mode
	Insert			-^
	Esc			-> return to COMMAND mode
	v			-> go to VISUAL mode

	Find
	====
	/<word>			-> find the word
	n			-> go to the next word

	Undo / Redo
	===========
	u			-> undo the last action
	Ctrl+r			-> redo the last action
	.			-> repeat the last action

	Moving between lines
	====================
	:1			-> go to the first line
	[[			-^
	gg			-^
	:$			-> go to the last line
	]]			-^
	G			-^
	``			-> go to the previous cursor position
	w			-> go to the next word
	b			-> go to the previous word
	:@			-> go to the @ line ( @ = line number )
	@G			-^

	Set options
	===========
	:set all		-> show all set options

	:set nu			-> show line numbers before every line
	:set nonu		-> do not show line numbers

	:set ruler		-> show position of cursor at bottom right of the screen
	:set noruler		-> do not show the above

	:set ic			-> set ignore case in search on
	:set noic		-> set ignore case in search off

	:set hls		-> highlight the word given for searching
	:set nohls		-> do not highlight the word

	:set showmode		-> set the indicator mode
	:set noai		-> set autoindenting
	:set lm=@		-> set the left margin
	:set tw=@		-> set the text width from left to right
	:set wm=@		-> set the wrap margin
	:set ts=@		-> set the tab stop
	:set incsearch		-> set up an incremental search

	Insert
	======
	O			-> insert a blank line above the cursor and change to
				   insert mode
	o			-> insert a blank line below the cursor and change to
				   insert mode
	:r <file>		-> insert the file's content in current file after the
				   cursor

	Cut, Copy & Paste
	=================
	x			-> cut the character
	@x			-> cut @ characters ( @ = number of characters )

	yw			-> copy the word
	@yw			-> copy @ words ( @ = number of words )

	cw			-> cut the word
	@cw			-> cut @ words ( @ = number of words )

	dw			-> delete the word
	@dw			-> delete @ words ( @ = number of words )

	yy			-> copy the line
	@yy			-> copy @ lines ( @ = number of lines )

	cc			-> cut the line
	@cc			-> cut @ lines ( @ = number of lines )

	dd			-> delete the line
	@dd			-> delete @ lines ( @ - number of lines )

	y$			-> copy words from the cursor upto the end of the line
	c$			-> cut words from the cursor upto the end of the line
	C			-^ ...and change to insert mode
	d$			-> delete words from the cursor upto the end of the line
	D			-^

	p			-> paste the cut/copied/deleted line/s, word/s or
				   character/s

	Find & replace
	==============
	:1,$ s/<old>/<new>/g	-> replace the character or word in the whole file
				   1 - first line
				   $ - last line
	:% s/<old>/<new>/g	-^
	:1,. s/<old>/<new>/g    -> replace the character or word between the lines
				   1 - first line
							   . - current cursor position
	:@,. s/<old>/<new>/g    -> replace the character or word between the lines
				   @ - line number
							   . - current cursor position
	:.,$ s/<old>/<new>/g    -> replace the character or word between the lines
							   . - current cursor position
				   $ - last line
	:.,@ s/<old>/<new>/g    -> replace the character or word between the lines
							   . - current cursor position
				   @ - line number
	:@,@ s/<old>/<new>/g	-> replace the character or word between the lines
				   @ - line number

	Bookmarks
	=========
	m<character>		-> mark current position
	`<character>		-> go to the marked position
	:marks			-> show all marked positions

	Abbreviations
	=============
	:ab			-> show all abbreviations
	:ab <abr> <word>	-> set the abbreviation to the word
	:unab <abr>		-> unset the abbreviation
	:abcl			-> Clear all abbreviations, which are set

	System
	======
	:!<command>		-> run the command and show output if any without
				   exiting the vi editor
	:sh			-> give a shell temporarily
	exit			-> exit the shell and return to the vi editor
	Ctrl+d			-^

	Sessions
	========
	:sp			-> split the screen horizontally in two
	:vsp			-> split the screen vertically in two
	Ctrl+w			-> switch between the screens

	Keyboard mapping
	================
	:map			-> show all keyboard mappings
	:map <key> <command>	-> map the key to the command
	:unmap <key>		-> unmap the mapped key

	Help
	====
	:help			-> general Help
	:help quickref		-> go directly to a topic
	:help tutor
	:help usr_06.txt
	:help vimrc		-> search for a term and bring up a list of choices
	:help CTRL-V
	:help F5
	:help /b
	:help options

	Personalising
	=============
	~/.exrc			-> config file of vi editor
				   (the file does not exist by default, you have to
					create it)