FOR /F %%h IN (find_hosts.txt) DO (dir /b \\%%h\C$\Users\%1)
