#!/usr/bin/python3

CODE = "#!/usr/bin/python3{nl}{nl}CODE = {quote}{code}{quote}{nl}THERES_NO_DEFINE_IN_PYTHON = 0{nl}main = lambda : (open({quote}Grace_kid.py{quote}, {quote}w{quote})).write(CODE.format(code=CODE, tab='{backs}x09', nl='{backs}x0A', quote='{backs}x22', backs='{backs}x5C')){nl}{nl}# Yea sadly there are no define in python :({nl}{nl}if __name__ == {quote}__main__{quote}:{nl}{tab}main(){nl}"
THERES_NO_DEFINE_IN_PYTHON = 0
main = lambda : (open("Grace_kid.py", "w")).write(CODE.format(code=CODE, tab='\x09', nl='\x0A', quote='\x22', backs='\x5C'))

# Yea sadly there are no define in python :(

if __name__ == "__main__":
	main()
