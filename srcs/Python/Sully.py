#!/usr/bin/python3

CODE = "#!/usr/bin/python3{nl}{nl}CODE = {quote}{code}{quote}{nl}{nl}import os{nl}{nl}def main():{nl}{tab}i = {I}{nl}{tab}FILENAME = {quote}{quote}{nl}{tab}fd = None{nl}{tab}CMD = {quote}{quote}{nl}{nl}{tab}FILENAME = {quote}Sully_%d.py{quote} % i{nl}{tab}if FILENAME == __file__.split('/')[-1]:{nl}{tab}{tab}i -= 1{nl}{tab}{tab}FILENAME = {quote}Sully_%d.py{quote} % i{nl}{tab}fd = open(FILENAME, {quote}w{quote}){nl}{tab}fd.write(CODE.format(code=CODE, tab='{backs}x09', nl='{backs}x0A', quote='{backs}x22', backs='{backs}x5C', I=i)){nl}{tab}fd.close(){nl}{nl}{tab}CMD = {quote}chmod +x Sully_%d.py{quote} % i{nl}{tab}os.system(CMD){nl}{tab}if i != 0:{nl}{tab}{tab}CMD = {quote}./Sully_%d.py{quote} % i{nl}{tab}{tab}os.system(CMD){nl}{nl}if __name__ == {quote}__main__{quote}:{nl}{tab}main(){nl}"

import os

def main():
	i = 5
	FILENAME = ""
	fd = None
	CMD = ""

	FILENAME = "Sully_%d.py" % i
	if FILENAME == __file__.split('/')[-1]:
		i -= 1
		FILENAME = "Sully_%d.py" % i
	fd = open(FILENAME, "w")
	fd.write(CODE.format(code=CODE, tab='\x09', nl='\x0A', quote='\x22', backs='\x5C', I=i))
	fd.close()

	CMD = "chmod +x Sully_%d.py" % i
	os.system(CMD)
	if i != 0:
		CMD = "./Sully_%d.py" % i
		os.system(CMD)

if __name__ == "__main__":
	main()
