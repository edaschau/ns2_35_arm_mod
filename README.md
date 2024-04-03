# Modified ns2.35 for ARM and x86 platform without gcc4.8 and g++4.8



## Install
Download the [`tar.gz`](ns-allinone-2.35-eda.tar.gz) package, 
Alternative download: [Google Drive](https://drive.google.com/file/d/1uldwUqbAjQJfaxkRmQYKze3cONfrxip9/view)

Then install with:

```bash
sudo apt-get update
sudo apt-get install build-essential autoconf automake libxmu-dev xorg-dev
tar -xzvf ns-allinone-2.35-eda.tar.gz
cd ns-allinone-2.35-eda
./install
./env_config.sh
```

## Notes:
Try this package I modified (this package could be used directly).

I've tested with my Samsung Phone on Snapdragon 8+gen1 with Android 14, using Termux environment to run Ubuntu 22.04. Also my Intel x86 PC with Ubuntu22.04 installed without any problem. My friend tested on M series MacBook and also succeed.
If you have any problem with Mac, let me know!

## Modifications:

ns-2.35/Makefile.in

`CFLAGS  += $(CCOPT) $(DEFINE) -std=c++03`

So no need to do the compiler stuff.

All config.sub and config.guess have replaced with the newest version from the link it prompted when installing, so ARM platform can be recognized correctly.

nam-1.15/Makefile.in

`CXXFLAGS = @V_CXXFLAGS@ -Wno-narrowing`

Otherwise the nam will build error.
Also the line 137 `this->` (already mentioned)
