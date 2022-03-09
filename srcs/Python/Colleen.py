#!/usr/bin/python3

CODE = "#!/usr/bin/python3{nl}{nl}CODE = {quote}{code}{quote}{nl}{nl}# This program will print its own source when run.{nl}{nl}def printf(string):{nl}{tab}print(string.format(code=string, tab='{backs}x09', nl='{backs}x0A', quote='{backs}x22', backs='{backs}x5C')){nl}{nl}def main():{nl}{tab}# Hello World !{nl}{tab}printf(CODE){nl}{nl}if __name__ == {quote}__main__{quote}:{nl}{tab}main()"

# This program will print its own source when run.

def printf(string):
	print(string.format(code=string, tab='\x09', nl='\x0A', quote='\x22', backs='\x5C'))

def main():
	# Hello World !
	printf(CODE)

if __name__ == "__main__":
	main()
