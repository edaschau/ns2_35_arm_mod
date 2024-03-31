Modified ns2.35 for ARM and x86 platform without gcc4.8 and g++4.8

Try this package I modified (this package could be used directly)

Alternative download: [Google Drive](https://drive.google.com/file/d/1uldwUqbAjQJfaxkRmQYKze3cONfrxip9/view)

Unfortunately, I don't have any Apple device. I tested with my Samsung Phone on Snapdragon 8+gen1 with Android 14, using Termux environment to run Ubuntu 22.04. Also my Intel x86 PC with Ubuntu22.04 installed without any problem. 
If you have any problem with Mac, let me know!

install with:

```bash
tar -xzvf ns-allinone-2.35-eda.tar.gz
sudo apt-get update
sudo apt-get install build-essential autoconf automake libxmu-dev
cd ns-allinone-2.35-eda
./install
```

Modifications:

ns-2.35/Makefile.in

`CFLAGS  += $(CCOPT) $(DEFINE) -std=c++03`

So no need to do the compiler stuff.

All config.sub and config.guess have replaced with the newest version from the link it prompted when installing, so ARM platform can be recognized correctly.

nam-1.15/Makefile.in

`CXXFLAGS = @V_CXXFLAGS@ -Wno-narrowing`

Otherwise the nam will build error.
Also the line 137 `this->` (already mentioned)
