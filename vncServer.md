- Install vncserver
```
sudo apt install tightvncserver
```

- Run vncserver and set password
```
vncserver
```

Comme nous allons modifier la configuration du serveur VNC, arrêtez tout d'abord l'instance du serveur VNC lancée sur le port 5901 grâce à la commande suivante :

```
vncserver -kill :1
```

Avant de modifier le fichier xstartup, sauvegardez l'original :
```
mv ~/.vnc/xstartup ~/.vnc/xstartup.backup
```

Créez maintenant un nouveau fichier xstartup et ouvrez-le dans votre éditeur de texte :
```
nano ~/.vnc/xstartup
```

Les commandes de ce fichier sont exécutées automatiquement chaque fois que vous démarrez ou redémarrez le serveur VNC. Nous avons besoin que VNC démarre notre environnement de bureau s'il n'est pas déjà lancé. Ajoutez ces commandes au fichier `~/.vnc/xstartup` :
```
#!/bin/sh

# Uncomment the following two lines for normal desktop:
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
#. /etc/X11/xinit/xinitrc
/usr/bin/mate-session

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
x-window-manager &
```
