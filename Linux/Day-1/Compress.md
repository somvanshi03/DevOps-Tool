# Compress Utilities
				
	 1. zip <filename> <source_files>	    - \        to zip & unzip a single
		unzip <filename>.zip		    - /           or multiple files

	 2. compress <filename>			    - \
		uncompress <filename>.Z		        \
								  \
	 3. gzip <filename>			            \     to compress and
		gunzip <filename>.gz		            /  uncompres a single file
								  /
	 4. bzip2 <filename>			        /
		bunzip2 <filename>.bz2		    - /

	 5. tar -cvf <filename>.tar <source_files>  - \        to tar & untar a single
		tar -xvf <filename>			    - /	    or multiple files

	 6. tar -Zcvf <filename>.Z <source_files>   - \
		tar -Zxvf <filename>	                \
								  \
	 7. tar -zcvf <filename>.gz <source_files>          \    to tar & compress
		tar -zxvf <filename>		             /      multiple files
								   /
	 8. tar -jcvf <filename>.bz2 <source_files>      /
		tar -jxvf <filename>	             - /
	 
	 9. tar -tvf <filename>				- \ 
		tar -Ztvf <filename>			   \      to test & list content
		tar -ztvf <filename>			  /      of compressed tar files
		tar -jtvf <filename>		      - /

	zcat <filename>.gz
	bcat <filename>.bz2
	cpio -idmv <filename>.cpio
	zcat <filename>.cpio.gz | cpio -idmv